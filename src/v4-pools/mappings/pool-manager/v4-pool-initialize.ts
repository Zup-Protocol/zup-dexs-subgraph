import { Address, BigInt, Bytes, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Protocol as ProtocolEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../../utils/constants";
import { getOrCreateTokenEntity } from "../../../utils/token-utils";
import { PoolType } from "../../../utils/types/pool-type";
import { V3V4PoolSetters } from "../../../v3-pools/utils/v3-v4-pool-setters";

export function handleV4PoolInitialize(
  event: ethereum.Event,
  poolId: Bytes,
  token0Address: Address,
  token1Address: Address,
  feeTier: u32,
  tickSpacing: u32,
  tick: BigInt,
  sqrtPriceX96: BigInt,
  protocol: ProtocolEntity,
): void {
  handleV4PoolInitializeImpl(
    event,
    poolId,
    token0Address,
    token1Address,
    feeTier,
    tickSpacing,
    tick,
    sqrtPriceX96,
    protocol,
  );
}

export function handleV4PoolInitializeImpl(
  event: ethereum.Event,
  poolId: Bytes,
  token0Address: Address,
  token1Address: Address,
  feeTier: u32,
  tickSpacing: u32,
  tick: BigInt,
  sqrtPriceX96: BigInt,
  protocol: ProtocolEntity,
  v4PoolSetters: V3V4PoolSetters = new V3V4PoolSetters(),
): void {
  let poolEntity = new PoolEntity(poolId);
  let token0Entity = getOrCreateTokenEntity(token0Address);
  let token1Entity = getOrCreateTokenEntity(token1Address);

  poolEntity.protocol = protocol.id;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.token0 = token0Entity.id;
  poolEntity.token1 = token1Entity.id;
  poolEntity.feeTier = feeTier;
  poolEntity.tickSpacing = tickSpacing;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.type = PoolType.V4;
  poolEntity.tick = tick;
  poolEntity.sqrtPriceX96 = sqrtPriceX96;

  v4PoolSetters.setPricesForPoolWhitelistedTokens(sqrtPriceX96, poolEntity, token0Entity, token1Entity);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
