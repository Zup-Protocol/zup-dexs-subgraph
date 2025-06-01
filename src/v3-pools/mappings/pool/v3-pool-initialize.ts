import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";

import { V3V4PoolSetters } from "../../utils/v3-v4-pool-setters";

export function handleV3PoolInitialize(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
  tick: BigInt,
): void {
  handleV3PoolInitializeImpl(poolEntity, poolToken0Entity, poolToken1Entity, sqrtPriceX96, tick, new V3V4PoolSetters());
}

export function handleV3PoolInitializeImpl(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  v3PoolSetters: V3V4PoolSetters = new V3V4PoolSetters(),
): void {
  v3PoolSetters.setPricesForPoolWhitelistedTokens(sqrtPriceX96, poolEntity, poolToken0Entity, poolToken1Entity);
  poolEntity.sqrtPriceX96 = sqrtPriceX96;
  poolEntity.tick = tick;

  poolEntity.save();
}
