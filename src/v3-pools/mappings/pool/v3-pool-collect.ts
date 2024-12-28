import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { Collect as CollectEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { formatFromTokenAmount } from "../../../utils/token-utils";
import { setPoolDailyDataTVL } from "../../utils/v3-pool-setters";

export function handleV3PoolCollect(event: CollectEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;
  let formattedToken0CollectedAmount = formatFromTokenAmount(event.params.amount0, token0Entity);
  let formattedToken1CollectAmount = formatFromTokenAmount(event.params.amount1, token1Entity);

  poolEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0.minus(formattedToken0CollectedAmount);
  poolEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1.minus(formattedToken1CollectAmount);

  poolEntity.totalValueLockedUSD = poolEntity.totalValueLockedToken0
    .times(token0Entity.usdPrice)
    .plus(poolEntity.totalValueLockedToken1.times(token1Entity.usdPrice));

  setPoolDailyDataTVL(event, poolEntity);
  poolEntity.save();
}
