import { Address, ethereum } from "@graphprotocol/graph-ts";

import { Pool as PoolEntity, Protocol as ProtocolEntity, V3Pool as V3PoolEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL, ZERO_BIG_INT } from "../../../common/constants";
import { getOrCreateTokenEntity } from "../../../common/token-utils";
import { PoolType } from "../../../common/types/pool-type";

export function handleV3PoolCreated(
  event: ethereum.Event,
  poolAddress: Address,
  token0Address: Address,
  token1Address: Address,
  feeTier: u32,
  tickSpacing: u32,
  protocol: ProtocolEntity,
): PoolEntity {
  let token0Entity = getOrCreateTokenEntity(token0Address);
  let token1Entity = getOrCreateTokenEntity(token1Address);
  let poolEntity = new PoolEntity(poolAddress);
  let v3PoolEntity = new V3PoolEntity(poolAddress);

  v3PoolEntity.tickSpacing = tickSpacing;
  v3PoolEntity.sqrtPriceX96 = ZERO_BIG_INT;
  v3PoolEntity.tick = ZERO_BIG_INT;
  v3PoolEntity.pool = poolAddress;

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = feeTier;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.protocol = protocol.id;
  poolEntity.type = PoolType.V3;

  v3PoolEntity.save();
  poolEntity.save();
  token0Entity.save();
  token1Entity.save();

  return poolEntity;
}
