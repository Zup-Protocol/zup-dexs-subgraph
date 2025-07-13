import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { PoolSetters } from "../../../common/pool-setters";
import { formatFromTokenAmount } from "../../../common/token-utils";

export function handleV2PoolClaimFees(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
): void {
  handleV2PoolClaimFeesImpl(event, poolEntity, token0Entity, token1Entity, amount0, amount1, new PoolSetters());
}

export function handleV2PoolClaimFeesImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  v2PoolSetters: PoolSetters = new PoolSetters(),
): void {
  let amount0Formatted = formatFromTokenAmount(amount0, token0Entity);
  let amount1Formatted = formatFromTokenAmount(amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.minus(amount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.minus(amount1Formatted);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.minus(amount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.minus(amount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v2PoolSetters.setPoolDailyDataTVL(event, poolEntity);

  poolEntity.save();
}
