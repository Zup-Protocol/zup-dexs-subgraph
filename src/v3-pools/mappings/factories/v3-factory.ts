import { ERC20 } from "../../../../generated/UniswapV3Factory/ERC20";
import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { V3Pool as V3PoolTemplate } from "../../../../generated/templates";
import { ZERO_BIG_DECIMAL } from "../../../utils/constants";
import { SafeCallResult } from "../../../utils/safe-call-result";

export function handleV3PoolCreated(event: PoolCreatedEvent): PoolEntity {
  let poolAddress = event.params.pool;
  let token0Address = event.params.token0;
  let token1Address = event.params.token1;

  let token0Entity = TokenEntity.load(token0Address);
  let token1Entity = TokenEntity.load(token1Address);
  let poolEntity = new PoolEntity(poolAddress);

  if (token0Entity == null) {
    token0Entity = new TokenEntity(token0Address);
    token0Entity.decimals = SafeCallResult.fromNumber(ERC20.bind(token0Address).try_decimals());
    token0Entity.usdPrice = ZERO_BIG_DECIMAL;
  }

  if (token1Entity == null) {
    token1Entity = new TokenEntity(token1Address);
    token1Entity.decimals = SafeCallResult.fromNumber(ERC20.bind(token1Address).try_decimals());
    token1Entity.usdPrice = ZERO_BIG_DECIMAL;
  }

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = event.params.fee;
  poolEntity.tickSpacing = event.params.tickSpacing;
  poolEntity.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  poolEntity.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  poolEntity.createdAtTimestamp = event.block.timestamp;
  poolEntity.protocol = "";

  V3PoolTemplate.create(poolAddress);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();

  return poolEntity;
}
