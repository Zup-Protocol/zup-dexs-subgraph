import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { CollectProtocol as CollectProtocolEvent } from "../../../../../../generated/templates/RamsesV3Pool/RamsesV3Pool";
import { handleV3PoolProtocolCollect } from "../../v3-pool-protocol-collect";

export function handleRamsesV3PoolCollectProtocol(event: CollectProtocolEvent): void {
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
