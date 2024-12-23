import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../generated/schema";
import {
  findStableToken,
  findWrappedNative,
  isStablePool,
  isVariableWithStablePool,
  isWrappedNativePool,
} from "../../utils/pool-utils";
import { sqrtPriceX96toPrice } from "./uniswap-v3-pool-converters";

export function setWhitelistedTokensPriceForUniswapV3(
  poolSqrtPriceX96: BigInt,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  poolEntity: PoolEntity,
): void {
  let poolPrices = sqrtPriceX96toPrice(poolSqrtPriceX96, poolToken0Entity, poolToken1Entity);

  if (isVariableWithStablePool(poolEntity)) {
    let stableToken = findStableToken(poolEntity);

    if (stableToken.id == poolToken0Entity.id) {
      poolToken1Entity.usdPrice = poolPrices.token0PerToken1;

      return;
    }

    poolToken0Entity.usdPrice = poolPrices.token1PerToken0;

    return;
  }

  if (isWrappedNativePool(poolEntity)) {
    if (findWrappedNative(poolEntity).id == poolToken0Entity.id) {
      poolToken1Entity.usdPrice = poolPrices.token0PerToken1.times(poolToken0Entity.usdPrice);

      return;
    }

    poolToken0Entity.usdPrice = poolPrices.token1PerToken0.times(poolToken1Entity.usdPrice);

    return;
  }

  if (isStablePool(poolEntity)) {
    poolToken1Entity.usdPrice = poolPrices.token0PerToken1;
    poolToken0Entity.usdPrice = poolPrices.token1PerToken0;

    return;
  }
}
