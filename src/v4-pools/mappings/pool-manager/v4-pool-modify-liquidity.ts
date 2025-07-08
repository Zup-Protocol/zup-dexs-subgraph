import { BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity, V4Pool as V4PoolEntity } from "../../../../generated/schema";
import { formatFromTokenAmount } from "../../../common/token-utils";
import { getAmount0, getAmount1 } from "../../utils/liquidity-amounts";

export function handleV4PoolModifyLiquidity(
  poolEntity: PoolEntity,
  token0Entity: TokenEntity,
  token1Entity: TokenEntity,
  liqudityDelta: BigInt,
  tickLower: i32,
  tickUpper: i32,
): void {
  let v4PoolEntity = V4PoolEntity.load(poolEntity.id)!;
  let amount0 = getAmount0(tickLower, tickUpper, v4PoolEntity.tick.toI32(), liqudityDelta, v4PoolEntity.sqrtPriceX96);
  let amount1 = getAmount1(tickLower, tickUpper, v4PoolEntity.tick.toI32(), liqudityDelta, v4PoolEntity.sqrtPriceX96);
  let amount0Formatted = formatFromTokenAmount(amount0, token0Entity);
  let amount1Formatted = formatFromTokenAmount(amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(amount0Formatted);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(amount1Formatted);
  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  token0Entity.totalTokenPooledAmount = token0Entity.totalTokenPooledAmount.plus(amount0Formatted);
  token1Entity.totalTokenPooledAmount = token1Entity.totalTokenPooledAmount.plus(amount1Formatted);

  token0Entity.totalValuePooledUsd = token0Entity.totalTokenPooledAmount.times(token0Entity.usdPrice);
  token1Entity.totalValuePooledUsd = token1Entity.totalTokenPooledAmount.times(token1Entity.usdPrice);

  poolEntity.save();
  token0Entity.save();
  token1Entity.save();
}
