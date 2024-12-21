import { ERC20 } from "../../../generated/UniswapV3Factory/ERC20";
import { PoolCreated as PoolCreatedEvent } from "../../../generated/UniswapV3Factory/UniswapV3Factory";
import {
  PoolDailyData as PoolDailyDataEntity,
  Pool as PoolEntity,
  PoolHourlyData as PoolHourlyDataEntity,
  Token as TokenEntity,
} from "../../../generated/schema";
import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../generated/templates";
import { ZERO_BIG_DECIMAL } from "../../utils/constants";
import { SafeCallResult } from "../../utils/safeCallResult";

export function handleUniswapV3PoolCreated(event: PoolCreatedEvent): void {
  let poolAddress = event.params.pool;
  let token0Address = event.params.token0;
  let token1Address = event.params.token1;

  let token0Entity = TokenEntity.load(token0Address);
  let token1Entity = TokenEntity.load(token1Address);
  let poolEntity = new PoolEntity(poolAddress);
  let poolDailyDataEntity = new PoolDailyDataEntity(poolAddress);
  let poolHourlyDataEntity = new PoolHourlyDataEntity(poolAddress);

  if (token0Entity == null) token0Entity = new TokenEntity(token0Address);
  if (token1Entity == null) token1Entity = new TokenEntity(token1Address);

  token0Entity.decimals = SafeCallResult.fromi32(ERC20.bind(token0Address).try_decimals());
  token0Entity.usdPrice = ZERO_BIG_DECIMAL;

  token1Entity.decimals = SafeCallResult.fromi32(ERC20.bind(token1Address).try_decimals());
  token1Entity.usdPrice = ZERO_BIG_DECIMAL;

  poolEntity.token0 = token0Address;
  poolEntity.token1 = token1Address;
  poolEntity.feeTier = event.params.fee;
  poolEntity.tickSpacing = event.params.tickSpacing;

  poolDailyDataEntity.pool = poolAddress;
  poolHourlyDataEntity.pool = poolAddress;

  UniswapV3PoolTemplate.create(poolAddress);

  poolEntity.save();
  poolDailyDataEntity.save();
  poolHourlyDataEntity.save();
  token0Entity.save();
  token1Entity.save();
}
