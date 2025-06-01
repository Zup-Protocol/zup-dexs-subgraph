import { Address, ethereum } from "@graphprotocol/graph-ts";

import { Pool as PoolEntity, Protocol as ProtocolEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL, ZERO_BIG_INT } from "../../../utils/constants";
import { getOrCreateTokenEntity } from "../../../utils/token-utils";
import { PoolType } from "../../../utils/types/pool-type";

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

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = feeTier;
  poolEntity.tickSpacing = tickSpacing;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.protocol = protocol.id;
  poolEntity.type = PoolType.V3;
  poolEntity.sqrtPriceX96 = ZERO_BIG_INT;
  poolEntity.tick = ZERO_BIG_INT;

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();

  return poolEntity;
}
