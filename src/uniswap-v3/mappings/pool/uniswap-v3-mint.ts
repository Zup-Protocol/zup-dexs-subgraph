import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { Mint as MintEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { formatFromTokenAmount } from "../../../utils/token-utils";
import { setPoolDailyDataTVL } from "../../utils/uniswap-v3-pool-setters";

export function handleUniswapV3PoolMint(event: MintEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;
  let token0FormattedAmount = formatFromTokenAmount(event.params.amount0, token0Entity);
  let token1FormattedAmount = formatFromTokenAmount(event.params.amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.plus(token0FormattedAmount);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.plus(token1FormattedAmount);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  setPoolDailyDataTVL(event, poolEntity);
  poolEntity.save();
}
