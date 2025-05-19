import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { CollectFees as CollectProtocolFeesEvent } from "../../../../../../generated/templates/AerodromeV3Pool/AerodromeV3Pool";
import { handleV3PoolProtocolCollect } from "../../v3-pool-protocol-collect";

export function handleAerodromeV3PoolCollectProtocol(event: CollectProtocolFeesEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolProtocolCollect(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    event.params.amount0,
    event.params.amount1,
  );
}
