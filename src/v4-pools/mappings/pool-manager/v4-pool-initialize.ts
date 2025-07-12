import { Address, BigInt, Bytes, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Protocol as ProtocolEntity, V4Pool as V4PoolEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../../common/constants";
import { PoolSetters } from "../../../common/pool-setters";
import { getOrCreateTokenEntity } from "../../../common/token-utils";
import { PoolType } from "../../../common/types/pool-type";
import { sqrtPriceX96toPrice } from "../../../v3-pools/utils/v3-v4-pool-converters";

export function handleV4PoolInitialize(
  event: ethereum.Event,
  poolId: Bytes,
  token0Address: Address,
  token1Address: Address,
  feeTier: u32,
  tickSpacing: u32,
  tick: BigInt,
  sqrtPriceX96: BigInt,
  hooks: Address,
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
    hooks,
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
  hooks: Address,
  v4PoolSetters: PoolSetters = new PoolSetters(),
): void {
  let poolEntity = new PoolEntity(poolId);
  let v4PoolEntity = new V4PoolEntity(poolId);
  let token0Entity = getOrCreateTokenEntity(token0Address);
  let token1Entity = getOrCreateTokenEntity(token1Address);

  v4PoolEntity.sqrtPriceX96 = sqrtPriceX96;
  v4PoolEntity.hooks = hooks;
  v4PoolEntity.tickSpacing = tickSpacing;
  v4PoolEntity.tick = tick;
  v4PoolEntity.pool = poolId;

  poolEntity.protocol = protocol.id;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.token0 = token0Entity.id;
  poolEntity.token1 = token1Entity.id;
  poolEntity.currentFeeTier = feeTier;
  poolEntity.initialFeeTier = feeTier;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.type = PoolType.V4;

  v4PoolSetters.setPricesForPoolWhitelistedTokens(
    poolEntity,
    token0Entity,
    token1Entity,
    sqrtPriceX96toPrice(sqrtPriceX96, token0Entity, token1Entity),
  );

  v4PoolEntity.save();
  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
