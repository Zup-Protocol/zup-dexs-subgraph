import { BigDecimal, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity, V4Pool as V4PoolEntity } from "../../../../generated/schema";
import { PoolSetters } from "../../../common/pool-setters";
import { formatFromTokenAmount } from "../../../common/token-utils";
import { sqrtPriceX96toPrice } from "../../../v3-pools/utils/v3-v4-pool-converters";

export function handleV4PoolSwap(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  swapFee: i32,
): void {
  handleV4PoolSwapImpl(event, poolEntity, token0Entity, token1Entity, amount0, amount1, sqrtPriceX96, tick, swapFee);
}

export function handleV4PoolSwapImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  swapFee: i32,
  v4PoolSetters: PoolSetters = new PoolSetters(),
): void {
  // Unlike V3, a negative amount represents that amount is being sent to the pool and vice versa, so invert the sign
  let tokenAmount0Formatted = formatFromTokenAmount(amount0, token0Entity).times(BigDecimal.fromString("-1"));
  let tokenAmount1Formatted = formatFromTokenAmount(amount1, token1Entity).times(BigDecimal.fromString("-1"));

  let v4PoolEntity = V4PoolEntity.load(poolEntity.id)!;

  v4PoolSetters.setPricesForPoolWhitelistedTokens(
    poolEntity,
    token0Entity,
    token1Entity,
    sqrtPriceX96toPrice(sqrtPriceX96, token0Entity, token1Entity),
  );

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(tokenAmount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(tokenAmount1Formatted);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(tokenAmount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(tokenAmount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v4PoolSetters.setHourlyData(event, token0Entity, token1Entity, poolEntity, amount0, amount1, swapFee);
  v4PoolSetters.setDailyData(event, poolEntity, token0Entity, token1Entity, amount0, amount1, swapFee);

  v4PoolEntity.sqrtPriceX96 = sqrtPriceX96;
  v4PoolEntity.tick = tick;

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
  v4PoolEntity.save();
}
