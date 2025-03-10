import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import {
  PoolDailyData as PoolDailyDataEntity,
  Pool as PoolEntity,
  Token as TokenEntity,
} from "../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../utils/constants";
import {
  findStableToken,
  findWrappedNative,
  getPoolDailyDataId,
  isStablePool,
  isVariableWithStablePool,
  isWrappedNativePool,
} from "../../utils/pool-utils";
import { sqrtPriceX96toPrice } from "./v3-pool-converters";

export class V3PoolSetters {
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

  setPricesForV3PoolWhitelistedTokens(
    poolSqrtPriceX96: BigInt,
    poolEntity: PoolEntity,
    poolToken0Entity: TokenEntity,
    poolToken1Entity: TokenEntity,
  ): void {
    let poolPrices = sqrtPriceX96toPrice(poolSqrtPriceX96, poolToken0Entity, poolToken1Entity);

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
}
