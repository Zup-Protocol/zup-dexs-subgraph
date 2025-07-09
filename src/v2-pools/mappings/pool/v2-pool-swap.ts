import { BigInt, ethereum } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";

import { PoolSetters } from "../../../common/pool-setters";
import { formatFromTokenAmount } from "../../../common/token-utils";
import { poolReservesToPrice } from "../../utils/v2-pool-converters";

export function handleV2PoolSwap(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0In: BigInt,
  amount1In: BigInt,
  amount0Out: BigInt,
  amount1Out: BigInt,
  feeTier: i32 = i32(0),
): void {
  handleV2PoolSwapImpl(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    amount0In,
    amount1In,
    amount0Out,
    amount1Out,
    new PoolSetters(),
    feeTier,
  );
}

export function handleV2PoolSwapImpl(
  event: ethereum.Event,
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  amount0In: BigInt,
  amount1In: BigInt,
  amount0Out: BigInt,
  amount1Out: BigInt,
  v2PoolSetters: PoolSetters = new PoolSetters(),
  feeTier: i32 = i32(0),
): void {
  let rawAmount0 = amount0In.minus(amount0Out);
  let rawAmount1 = amount1In.minus(amount1Out);

  let tokenAmount0InFormatted = formatFromTokenAmount(amount0In, token0Entity);
  let tokenAmount1InFormatted = formatFromTokenAmount(amount1In, token1Entity);

  let tokenAmount0OutFormatted = formatFromTokenAmount(amount0Out, token0Entity);
  let tokenAmount1OutFormatted = formatFromTokenAmount(amount1Out, token1Entity);

  let amount0Formatted = tokenAmount0InFormatted.minus(tokenAmount0OutFormatted);
  let amount1Formatted = tokenAmount1InFormatted.minus(tokenAmount1OutFormatted);

  let newPoolReserve0Formatted = poolEntity.totalValueLockedToken0.plus(amount0Formatted);
  let newPoolReserve1Formatted = poolEntity.totalValueLockedToken1.plus(amount1Formatted);

  v2PoolSetters.setPricesForPoolWhitelistedTokens(
    poolEntity,
    token0Entity,
    token1Entity,
    poolReservesToPrice(newPoolReserve0Formatted, newPoolReserve1Formatted),
  );

  poolEntity.totalValueLockedToken0 = newPoolReserve0Formatted;
  poolEntity.totalValueLockedToken1 = newPoolReserve1Formatted;

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  if (feeTier != 0) poolEntity.feeTier = feeTier;

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(amount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(amount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  v2PoolSetters.setHourlyData(event, token0Entity, token1Entity, poolEntity, rawAmount0, rawAmount1);
  v2PoolSetters.setDailyData(event, poolEntity, token0Entity, token1Entity, rawAmount0, rawAmount1);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
