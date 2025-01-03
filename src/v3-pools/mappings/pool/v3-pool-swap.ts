import { BigInt } from "@graphprotocol/graph-ts";
import {
  PoolDailyData as PoolDailyDataEntity,
  Pool as PoolEntity,
  PoolHourlyData as PoolHourlyDataEntity,
  Token as TokenEntity,
} from "../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { ZERO_BIG_DECIMAL, ZERO_BIG_INT } from "../../../utils/constants";
import { getPoolDailyDataId, getPoolHourlyDataId } from "../../../utils/pool-utils";
import { formatFromTokenAmount } from "../../../utils/token-utils";
import { V3PoolSetters } from "../../utils/v3-pool-setters";

export function handleV3PoolSwap(event: SwapEvent): void {
  handleV3PoolSwapImpl(event);
}

export function handleV3PoolSwapImpl(event: SwapEvent, v3PoolSetters: V3PoolSetters = new V3PoolSetters()): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;
  let tokenAmount0Formatted = formatFromTokenAmount(event.params.amount0, token0Entity);
  let tokenAmount1Formatted = formatFromTokenAmount(event.params.amount1, token1Entity);

  v3PoolSetters.setPricesForV3PoolWhitelistedTokens(event.params.sqrtPriceX96, poolEntity, token0Entity, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(tokenAmount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(tokenAmount1Formatted);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  setHourlyData(event, poolEntity);
  setDailyData(event, poolEntity, v3PoolSetters);

  poolEntity.save();
}

function setHourlyData(event: SwapEvent, pool: PoolEntity): void {
  let hourlyPoolDataId = getPoolHourlyDataId(event.block.timestamp, pool);
  let poolHourlyDataEntity = PoolHourlyDataEntity.load(hourlyPoolDataId);
  let userInputToken = findUserInputToken(event, pool);
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = TokenEntity.load(pool.token1)!;

  if (poolHourlyDataEntity == null) {
    poolHourlyDataEntity = new PoolHourlyDataEntity(hourlyPoolDataId);
    poolHourlyDataEntity.hourStartTimestamp = event.block.timestamp;
    poolHourlyDataEntity.feesToken0 = ZERO_BIG_DECIMAL;
    poolHourlyDataEntity.feesToken1 = ZERO_BIG_DECIMAL;
    poolHourlyDataEntity.feesUSD = ZERO_BIG_DECIMAL;
    poolHourlyDataEntity.pool = pool.id;
  }

  if (userInputToken.id == pool.token0) {
    let feeAmountToken0 = getSwapFee(event.params.amount0, pool.feeTier);

    poolHourlyDataEntity.feesToken0 = poolHourlyDataEntity.feesToken0.plus(
      formatFromTokenAmount(feeAmountToken0, userInputToken),
    );
  } else {
    let feeAmountToken1 = getSwapFee(event.params.amount1, pool.feeTier);

    poolHourlyDataEntity.feesToken1 = poolHourlyDataEntity.feesToken1.plus(
      formatFromTokenAmount(feeAmountToken1, userInputToken),
    );
  }

  poolHourlyDataEntity.feesUSD = poolHourlyDataEntity.feesToken0
    .times(token0.usdPrice)
    .plus(poolHourlyDataEntity.feesToken1.times(token1.usdPrice));

  poolHourlyDataEntity.save();
}

function setDailyData(event: SwapEvent, pool: PoolEntity, v3PoolSetters: V3PoolSetters): void {
  v3PoolSetters.setPoolDailyDataTVL(event, pool);

  let dailyPoolDataId = getPoolDailyDataId(event.block.timestamp, pool);
  let poolDailyDataEntity = PoolDailyDataEntity.load(dailyPoolDataId)!; // adding ! here assuming [setPoolDailyDataTVL] created it if null
  let userInputToken = findUserInputToken(event, pool);
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = TokenEntity.load(pool.token1)!;

  if (userInputToken.id == pool.token0) {
    let feeAmountToken0 = getSwapFee(event.params.amount0, pool.feeTier);

    poolDailyDataEntity.feesToken0 = poolDailyDataEntity.feesToken0.plus(
      formatFromTokenAmount(feeAmountToken0, userInputToken),
    );
  } else {
    let feeAmountToken1 = getSwapFee(event.params.amount1, pool.feeTier);

    poolDailyDataEntity.feesToken1 = poolDailyDataEntity.feesToken1.plus(
      formatFromTokenAmount(feeAmountToken1, userInputToken),
    );
  }

  poolDailyDataEntity.feesUSD = poolDailyDataEntity.feesToken0
    .times(token0.usdPrice)
    .plus(poolDailyDataEntity.feesToken1.times(token1.usdPrice));

  poolDailyDataEntity.save();
}

function getSwapFee(tokenAmount: BigInt, poolFeeTier: i32): BigInt {
  return tokenAmount.times(BigInt.fromI32(poolFeeTier)).div(BigInt.fromU32(1000000));
}

function findUserInputToken(event: SwapEvent, pool: PoolEntity): TokenEntity {
  if (event.params.amount0.lt(ZERO_BIG_INT)) return TokenEntity.load(pool.token1)!;

  return TokenEntity.load(pool.token0)!;
}
