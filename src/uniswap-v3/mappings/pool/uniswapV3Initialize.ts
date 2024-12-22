import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import {
  findStableToken,
  findWrappedNative,
  isStablePool,
  isVariableWithStablePool,
  isWrappedNativePool,
} from "../../../utils/pool-utils";
import { sqrtPriceX96toPrice } from "../../utils/uniswap-v3-pool-converters";

export function handleUniswapV3PoolInitialize(event: InitializeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let poolToken0Entity = TokenEntity.load(poolEntity.token0)!;
  let poolToken1Entity = TokenEntity.load(poolEntity.token1)!;

  setTokenPrices(event, poolToken0Entity, poolToken1Entity, poolEntity);

  poolToken0Entity.save();
  poolToken1Entity.save();
  poolEntity.save();
}

function setTokenPrices(
  event: InitializeEvent,
  poolToken0Entity: TokenEntity,
  poolToken1Entity: TokenEntity,
  poolEntity: PoolEntity,
): void {
  let poolPrices = sqrtPriceX96toPrice(event.params.sqrtPriceX96, poolToken0Entity, poolToken1Entity);

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
