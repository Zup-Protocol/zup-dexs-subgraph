import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../../../generated/templates/QuickSwapV3Pool/QuickSwapV3Pool";
import { handleV3PoolInitialize } from "../../v3-pool-initialize";

export function handleQuickSwapV3PoolInitialize(event: InitializeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolInitialize(poolEntity, token0Entity, token1Entity, event.params.price, BigInt.fromI32(event.params.tick));
}
