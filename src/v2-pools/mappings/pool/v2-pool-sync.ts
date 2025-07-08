import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { PoolSetters } from "../../../common/pool-setters";
import { formatFromTokenAmount } from "../../../common/token-utils";

export function handleV2PoolSync(
  event: ethereum.Event,
  pool: PoolEntity,
  token0: TokenEntity,
  token1: TokenEntity,
  reserve0: BigInt,
  reserve1: BigInt,
): void {
  handleV2PoolSyncImpl(event, pool, token0, token1, reserve0, reserve1, new PoolSetters());
}

export function handleV2PoolSyncImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  reserve0: BigInt,
  reserve1: BigInt,
  v2PoolSetters: PoolSetters = new PoolSetters(),
): void {
  let oldToken0LockedValue = poolEntity.totalValueLockedToken0;
  let oldToken1LockedValue = poolEntity.totalValueLockedToken1;
  let reserve0Formatted = formatFromTokenAmount(reserve0, token0Entity);
  let reserve1Formatted = formatFromTokenAmount(reserve1, token1Entity);
  let reserve0Difference = reserve0Formatted.minus(oldToken0LockedValue);
  let reserve1Difference = reserve1Formatted.minus(oldToken1LockedValue);

  poolEntity.totalValueLockedToken0 = reserve0Formatted;
  poolEntity.totalValueLockedToken1 = reserve1Formatted;

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(reserve0Difference);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(reserve1Difference);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v2PoolSetters.setPoolDailyDataTVL(event, poolEntity);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
