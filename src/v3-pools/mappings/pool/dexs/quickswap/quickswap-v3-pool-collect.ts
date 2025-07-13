import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Collect as CollectEvent } from "../../../../../../generated/templates/QuickSwapV3Pool/QuickSwapV3Pool";
import { handleV3PoolCollect } from "../../v3-pool-collect";

export function handleQuickSwapV3PoolCollect(event: CollectEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolCollect(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
