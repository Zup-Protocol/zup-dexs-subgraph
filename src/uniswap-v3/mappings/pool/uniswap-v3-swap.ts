import { BigInt, log } from "@graphprotocol/graph-ts";
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
import { setWhitelistedTokensPriceForUniswapV3 as setTokensPricesForUniswapV3 } from "../../utils/uniswap-v3-pool-pricing";
import { setPoolDailyDataTVL } from "../../utils/uniswap-v3-pool-setters";

export function handleUniswapV3PoolSwap(event: SwapEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;
  let tokenAmount0Formatted = formatFromTokenAmount(event.params.amount0, token0Entity);
  let tokenAmount1Formatted = formatFromTokenAmount(event.params.amount1, token1Entity);

  setTokensPricesForUniswapV3(event.params.sqrtPriceX96, token0Entity, token1Entity, poolEntity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(tokenAmount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(tokenAmount1Formatted);

  log.error(
    `swap: totalValueLockedToken0: ${poolEntity.totalValueLockedToken0}, totalValueLockedToken1: ${poolEntity.totalValueLockedToken1}`,
    [],
  );

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  setHourlyData(event, poolEntity);
  setDailyData(event, poolEntity);

  token0Entity.save();
  token1Entity.save();
  poolEntity.save();
}

function setHourlyData(event: SwapEvent, pool: PoolEntity): void {
  let hourlyPoolDataId = getPoolHourlyDataId(event.block.timestamp, pool.createdAtTimestamp, pool.id);
  let poolHourlyDataEntity = PoolHourlyDataEntity.load(hourlyPoolDataId);
  let userInputToken = findUserInputToken(event, pool);

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
    .times(userInputToken.usdPrice)
    .plus(poolHourlyDataEntity.feesToken1.times(userInputToken.usdPrice));

  return poolHourlyDataEntity.save();
}

function setDailyData(event: SwapEvent, pool: PoolEntity): void {
  setPoolDailyDataTVL(event, pool);

  let dailyPoolDataId = getPoolDailyDataId(event.block.timestamp, pool.createdAtTimestamp, pool.id);
  let poolDailyDataEntity = PoolDailyDataEntity.load(dailyPoolDataId)!; // adding ! here assuming [setPoolDailyDataTVL] created it if null
  let userInputToken = findUserInputToken(event, pool);

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
    .times(userInputToken.usdPrice)
    .plus(poolDailyDataEntity.feesToken1.times(userInputToken.usdPrice));

  poolDailyDataEntity.save();
}

function getSwapFee(tokenAmount: BigInt, poolFeeTier: i32): BigInt {
  return tokenAmount.times(BigInt.fromI32(poolFeeTier)).div(BigInt.fromU32(1000000));
}

function findUserInputToken(event: SwapEvent, pool: PoolEntity): TokenEntity {
  if (event.params.amount0.lt(ZERO_BIG_INT)) return TokenEntity.load(pool.token1)!;
  return TokenEntity.load(pool.token0)!;
}
