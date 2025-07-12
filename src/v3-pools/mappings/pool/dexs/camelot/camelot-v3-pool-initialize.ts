import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";
import { handleV3PoolInitialize } from "../../v3-pool-initialize";

export function handleCamelotV3PoolInitialize(event: InitializeEvent): void {
  let pool: PoolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(pool.token0)!;
  let token1Entity = TokenEntity.load(pool.token1)!;

  handleV3PoolInitialize(pool, token0Entity, token1Entity, event.params.price, BigInt.fromI32(event.params.tick));
}
