import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity, V3Pool as V3PoolEntity } from "../../../../generated/schema";

import { PoolSetters } from "../../../common/pool-setters";
import { sqrtPriceX96toPrice } from "../../utils/v3-v4-pool-converters";

export function handleV3PoolInitialize(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
  tick: BigInt,
): void {
  handleV3PoolInitializeImpl(poolEntity, poolToken0Entity, poolToken1Entity, sqrtPriceX96, tick, new PoolSetters());
}

export function handleV3PoolInitializeImpl(
  poolEntity: PoolEntity,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  sqrtPriceX96: BigInt,
  tick: BigInt,
  v3PoolSetters: PoolSetters = new PoolSetters(),
): void {
  let v3PoolEntity = V3PoolEntity.load(poolEntity.id)!;

  v3PoolSetters.setPricesForPoolWhitelistedTokens(
    poolEntity,
    poolToken0Entity,
    poolToken1Entity,
    sqrtPriceX96toPrice(sqrtPriceX96, poolToken0Entity, poolToken1Entity),
  );

  v3PoolEntity.sqrtPriceX96 = sqrtPriceX96;
  v3PoolEntity.tick = tick;

  poolEntity.save();
  v3PoolEntity.save();
}
