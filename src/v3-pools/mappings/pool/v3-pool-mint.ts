import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";

import { formatFromTokenAmount } from "../../../utils/token-utils";
import { V3PoolSetters } from "../../utils/v3-pool-setters";

export function handleV3PoolMint(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
): void {
  handleV3PoolMintImpl(event, poolEntity, token0Entity, token1Entity, amount0, amount1, new V3PoolSetters());
}

export function handleV3PoolMintImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  v3PoolSetters: V3PoolSetters = new V3PoolSetters(),
): void {
  let token0FormattedAmount = formatFromTokenAmount(amount0, token0Entity);
  let token1FormattedAmount = formatFromTokenAmount(amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(token0FormattedAmount);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(token1FormattedAmount);

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(token0FormattedAmount);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(token1FormattedAmount);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  v3PoolSetters.setPoolDailyDataTVL(event, poolEntity);
  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
