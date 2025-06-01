import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";

import { formatFromTokenAmount } from "../../../utils/token-utils";
import { V3V4PoolSetters } from "../../utils/v3-v4-pool-setters";

export function handleV3PoolSwap(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  sqrtPriceX96: BigInt,
  tick: BigInt,
): void {
  handleV3PoolSwapImpl(event, poolEntity, token0Entity, token1Entity, amount0, amount1, sqrtPriceX96, tick);
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
  v3PoolSetters: V3V4PoolSetters = new V3V4PoolSetters(),
): void {
  let tokenAmount0Formatted = formatFromTokenAmount(amount0, token0Entity);
  let tokenAmount1Formatted = formatFromTokenAmount(amount1, token1Entity);

  v3PoolSetters.setPricesForPoolWhitelistedTokens(sqrtPriceX96, poolEntity, token0Entity, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(tokenAmount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(tokenAmount1Formatted);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  poolEntity.sqrtPriceX96 = sqrtPriceX96;
  poolEntity.tick = tick;

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(tokenAmount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(tokenAmount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v3PoolSetters.setHourlyData(event, token0Entity, token1Entity, poolEntity, amount0, amount1);
  v3PoolSetters.setDailyData(event, poolEntity, token0Entity, token1Entity, amount0, amount1);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
