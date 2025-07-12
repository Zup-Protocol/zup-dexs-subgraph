import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import {
  PoolDailyData as PoolDailyDataEntity,
  Pool as PoolEntity,
  PoolHourlyData as PoolHourlyDataEntity,
  Token as TokenEntity,
} from "../../generated/schema";
import { ZERO_BIG_DECIMAL, ZERO_BIG_INT } from "./constants";
import {
  findNativeToken,
  findStableToken,
  findWrappedNative,
  getPoolDailyDataId,
  getPoolHourlyDataId,
  isNativePool,
  isStablePool,
  isVariableWithStablePool,
  isWrappedNativePool,
} from "./pool-utils";
import { formatFromTokenAmount } from "./token-utils";
import { PriceResult } from "./types/price-result";

export class PoolSetters {
  setPoolDailyDataTVL(event: ethereum.Event, poolEntity: PoolEntity): void {
    let poolDailyDataId = getPoolDailyDataId(event.block.timestamp, poolEntity);
    let poolDailyDataEntity = PoolDailyDataEntity.load(poolDailyDataId);

    if (poolDailyDataEntity != null) {
      poolDailyDataEntity.totalValueLockedUSD = poolEntity.totalValueLockedUSD;
      poolDailyDataEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0;
      poolDailyDataEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1;
    } else {
      poolDailyDataEntity = new PoolDailyDataEntity(poolDailyDataId);

      poolDailyDataEntity.dayStartTimestamp = event.block.timestamp;
      poolDailyDataEntity.totalValueLockedUSD = poolEntity.totalValueLockedUSD;
      poolDailyDataEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0;
      poolDailyDataEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1;
      poolDailyDataEntity.pool = poolEntity.id;
      poolDailyDataEntity.feesToken0 = ZERO_BIG_DECIMAL;
      poolDailyDataEntity.feesToken1 = ZERO_BIG_DECIMAL;
      poolDailyDataEntity.feesUSD = ZERO_BIG_DECIMAL;
    }

    poolDailyDataEntity.save();
  }

  setPricesForPoolWhitelistedTokens(
    poolEntity: PoolEntity,
    poolToken0Entity: TokenEntity,
    poolToken1Entity: TokenEntity,
    poolPrices: PriceResult,
  ): void {
    if (isVariableWithStablePool(poolEntity)) {
      let stableToken = findStableToken(poolEntity);

      if (stableToken.id == poolToken0Entity.id) {
        poolToken1Entity.usdPrice = poolPrices.token0PerToken1;
        poolToken1Entity.save();

        poolToken0Entity.usdPrice = poolPrices.token1PerToken0.times(poolToken1Entity.usdPrice);
        poolToken0Entity.save();

        return;
      }

      poolToken0Entity.usdPrice = poolPrices.token1PerToken0;
      poolToken0Entity.save();

      poolToken1Entity.usdPrice = poolPrices.token0PerToken1.times(poolToken0Entity.usdPrice);
      poolToken1Entity.save();

      return;
    }

    if (isWrappedNativePool(poolEntity)) {
      if (findWrappedNative(poolEntity).id == poolToken0Entity.id) {
        poolToken1Entity.usdPrice = poolPrices.token0PerToken1.times(poolToken0Entity.usdPrice);
        poolToken1Entity.save();
        return;
      }

      poolToken0Entity.usdPrice = poolPrices.token1PerToken0.times(poolToken1Entity.usdPrice);
      poolToken0Entity.save();

      return;
    }

    if (isNativePool(poolEntity)) {
      if (findNativeToken(poolEntity).id == poolToken0Entity.id) {
        poolToken1Entity.usdPrice = poolPrices.token0PerToken1.times(poolToken0Entity.usdPrice);
        poolToken1Entity.save();
        return;
      }

      poolToken0Entity.usdPrice = poolPrices.token1PerToken0.times(poolToken1Entity.usdPrice);
      poolToken0Entity.save();
      return;
    }

    if (isStablePool(poolEntity)) {
      poolToken1Entity.usdPrice = poolPrices.token0PerToken1;
      poolToken0Entity.usdPrice = poolPrices.token1PerToken0;

      poolToken0Entity.save();
      poolToken1Entity.save();

      return;
    }

    if (poolToken1Entity.usdPrice != ZERO_BIG_DECIMAL) {
      poolToken0Entity.usdPrice = poolPrices.token1PerToken0.times(poolToken1Entity.usdPrice);
      poolToken0Entity.save();
    }

    if (poolToken0Entity.usdPrice != ZERO_BIG_DECIMAL) {
      poolToken1Entity.usdPrice = poolPrices.token0PerToken1.times(poolToken0Entity.usdPrice);
      poolToken1Entity.save();
    }
  }

  setDailyData(
    event: ethereum.Event,
    pool: PoolEntity,
    token0: TokenEntity,
    token1: TokenEntity,
    amount0: BigInt,
    amount1: BigInt,
    customFee: i32 = pool.currentFeeTier,
  ): void {
    this.setPoolDailyDataTVL(event, pool);

    let dailyPoolDataId = getPoolDailyDataId(event.block.timestamp, pool);
    let poolDailyDataEntity = PoolDailyDataEntity.load(dailyPoolDataId)!; // adding ! here assuming [setPoolDailyDataTVL] created it if null
    let userInputToken = this._findUserInputToken(amount0, pool);

    if (userInputToken.id == pool.token0) {
      let feeAmountToken0 = this._getSwapFee(
        amount0,
        customFee == pool.currentFeeTier ? pool.currentFeeTier : customFee,
      );

      poolDailyDataEntity.feesToken0 = poolDailyDataEntity.feesToken0.plus(
        formatFromTokenAmount(feeAmountToken0, userInputToken),
      );
    } else {
      let feeAmountToken1 = this._getSwapFee(
        amount1,
        customFee == pool.currentFeeTier ? pool.currentFeeTier : customFee,
      );

      poolDailyDataEntity.feesToken1 = poolDailyDataEntity.feesToken1.plus(
        formatFromTokenAmount(feeAmountToken1, userInputToken),
      );
    }

    poolDailyDataEntity.feesUSD = poolDailyDataEntity.feesToken0
      .times(token0.usdPrice)
      .plus(poolDailyDataEntity.feesToken1.times(token1.usdPrice));

    poolDailyDataEntity.save();
  }

  setHourlyData(
    event: ethereum.Event,
    token0: TokenEntity,
    token1: TokenEntity,
    pool: PoolEntity,
    amount0: BigInt,
    amount1: BigInt,
    customFee: i32 = pool.currentFeeTier,
  ): void {
    let hourlyPoolDataId = getPoolHourlyDataId(event.block.timestamp, pool);
    let poolHourlyDataEntity = PoolHourlyDataEntity.load(hourlyPoolDataId);
    let userInputToken = this._findUserInputToken(amount0, pool);

    if (poolHourlyDataEntity == null) {
      poolHourlyDataEntity = new PoolHourlyDataEntity(hourlyPoolDataId);
      poolHourlyDataEntity.hourStartTimestamp = event.block.timestamp;
      poolHourlyDataEntity.feesToken0 = ZERO_BIG_DECIMAL;
      poolHourlyDataEntity.feesToken1 = ZERO_BIG_DECIMAL;
      poolHourlyDataEntity.feesUSD = ZERO_BIG_DECIMAL;
      poolHourlyDataEntity.pool = pool.id;
    }

    if (userInputToken.id == pool.token0) {
      let feeAmountToken0 = this._getSwapFee(
        amount0,
        customFee != pool.currentFeeTier ? customFee : pool.currentFeeTier,
      );

      poolHourlyDataEntity.feesToken0 = poolHourlyDataEntity.feesToken0.plus(
        formatFromTokenAmount(feeAmountToken0, userInputToken),
      );
    } else {
      let feeAmountToken1 = this._getSwapFee(
        amount1,
        customFee != pool.currentFeeTier ? customFee : pool.currentFeeTier,
      );

      poolHourlyDataEntity.feesToken1 = poolHourlyDataEntity.feesToken1.plus(
        formatFromTokenAmount(feeAmountToken1, userInputToken),
      );
    }

    poolHourlyDataEntity.feesUSD = poolHourlyDataEntity.feesToken0
      .times(token0.usdPrice)
      .plus(poolHourlyDataEntity.feesToken1.times(token1.usdPrice));

    poolHourlyDataEntity.save();
  }

  private _getSwapFee(tokenAmount: BigInt, poolFeeTier: i32): BigInt {
    return tokenAmount.times(BigInt.fromI32(poolFeeTier)).div(BigInt.fromU32(1000000));
  }

  private _findUserInputToken(amount0: BigInt, pool: PoolEntity): TokenEntity {
    if (amount0.lt(ZERO_BIG_INT)) return TokenEntity.load(pool.token1)!;

    return TokenEntity.load(pool.token0)!;
  }
}
