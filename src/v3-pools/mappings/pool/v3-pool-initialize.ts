import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";

import { V3PoolSetters } from "../../utils/v3-pool-setters";

export function handleV3PoolInitialize(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
): void {
  handleV3PoolInitializeImpl(poolEntity, poolToken0Entity, poolToken1Entity, sqrtPriceX96, new V3PoolSetters());
}

export function handleV3PoolInitializeImpl(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
  v3PoolSetters: V3PoolSetters = new V3PoolSetters(),
): void {
  v3PoolSetters.setPricesForV3PoolWhitelistedTokens(sqrtPriceX96, poolEntity, poolToken0Entity, poolToken1Entity);

  poolEntity.save();
}
