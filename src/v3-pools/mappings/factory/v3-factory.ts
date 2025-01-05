import { Address, ethereum } from "@graphprotocol/graph-ts";

import { Pool as PoolEntity, Protocol as ProtocolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../../utils/constants";
import { ERC20 } from "../../../utils/ERC20";

export function handleV3PoolCreated(
  event: ethereum.Event,
  poolAddress: Address,
  token0Address: Address,
  token1Address: Address,
  feeTier: u32,
  tickSpacing: u32,
  protocol: ProtocolEntity,
): PoolEntity {
  let token0Entity = TokenEntity.load(token0Address);
  let token1Entity = TokenEntity.load(token1Address);
  let poolEntity = new PoolEntity(poolAddress);

  if (token0Entity == null) {
    token0Entity = new TokenEntity(token0Address);

    token0Entity.decimals = ERC20.bind(token0Address).safe_decimals();
    token0Entity.usdPrice = ZERO_BIG_DECIMAL;
  }

  if (token1Entity == null) {
    token1Entity = new TokenEntity(token1Address);
    token1Entity.decimals = ERC20.bind(token1Address).safe_decimals();
    token1Entity.usdPrice = ZERO_BIG_DECIMAL;
  }

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = feeTier;
  poolEntity.tickSpacing = tickSpacing;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.protocol = protocol.id;

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();

  return poolEntity;
}
