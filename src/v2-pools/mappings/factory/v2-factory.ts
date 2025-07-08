import { Address, ethereum } from "@graphprotocol/graph-ts";
import { Pool, Protocol as ProtocolEntity, V2Pool as V2PoolEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../../common/constants";
import { getOrCreateTokenEntity } from "../../../common/token-utils";
import { PoolType } from "../../../common/types/pool-type";

export function handleV2PoolCreated(
  event: ethereum.Event,
  token0Address: Address,
  token1Address: Address,
  poolAddress: Address,
  feeTier: u32,
  protocol: ProtocolEntity,
): void {
  let token0Entity = getOrCreateTokenEntity(token0Address);
  let token1Entity = getOrCreateTokenEntity(token1Address);
  let poolEntity = new Pool(poolAddress);
  let v2PoolEntity = new V2PoolEntity(poolAddress);

  v2PoolEntity.pool = poolAddress;

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = feeTier;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.protocol = protocol.id;
  poolEntity.type = PoolType.v2;

  v2PoolEntity.save();
  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
