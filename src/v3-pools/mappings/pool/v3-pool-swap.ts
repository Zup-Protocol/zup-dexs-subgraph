import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity, V3Pool as V3PoolEntity } from "../../../../generated/schema";

import { PoolSetters } from "../../../common/pool-setters";
import { formatFromTokenAmount } from "../../../common/token-utils";
import { sqrtPriceX96toPrice } from "../../utils/v3-v4-pool-converters";

export function handleV3PoolSwap(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  feeTier: i32 = 0,
): void {
  handleV3PoolSwapImpl(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    amount0,
    amount1,
    sqrtPriceX96,
    tick,
    new PoolSetters(),
    feeTier,
  );
}

export function handleV3PoolSwapImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  v3PoolSetters: PoolSetters = new PoolSetters(),
  feeTier: i32 = 0,
): void {
  let tokenAmount0Formatted = formatFromTokenAmount(amount0, token0Entity);
  let tokenAmount1Formatted = formatFromTokenAmount(amount1, token1Entity);
  let v3PoolEntity = V3PoolEntity.load(poolEntity.id)!;

  v3PoolSetters.setPricesForPoolWhitelistedTokens(
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

  if (feeTier != 0) poolEntity.feeTier = feeTier;

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(tokenAmount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(tokenAmount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v3PoolSetters.setHourlyData(event, token0Entity, token1Entity, poolEntity, amount0, amount1);
  v3PoolSetters.setDailyData(event, poolEntity, token0Entity, token1Entity, amount0, amount1);

  v3PoolEntity.sqrtPriceX96 = sqrtPriceX96;
  v3PoolEntity.tick = tick;

  poolEntity.save();
  v3PoolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
