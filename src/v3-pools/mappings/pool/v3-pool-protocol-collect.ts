import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { formatFromTokenAmount } from "../../../utils/token-utils";
import { V3PoolSetters } from "../../utils/v3-pool-setters";

export function handleV3PoolProtocolCollect(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
): void {
  handleV3PoolProtocolCollectImpl(event, poolEntity, token0Entity, token1Entity, amount0, amount1);
}

export function handleV3PoolProtocolCollectImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0: BigInt,
  amount1: BigInt,
  v3PoolSetters: V3PoolSetters = new V3PoolSetters(),
): void {
  let token0AmountFormatted = formatFromTokenAmount(amount0, token0Entity);
  let token1AmountFormatted = formatFromTokenAmount(amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.minus(token0AmountFormatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.minus(token1AmountFormatted);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  v3PoolSetters.setPoolDailyDataTVL(event, poolEntity);

  poolEntity.save();
}
