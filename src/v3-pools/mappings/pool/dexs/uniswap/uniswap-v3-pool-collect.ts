import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Collect } from "../../../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { handleV3PoolCollect } from "../../v3-pool-collect";

export function handleUniswapV3PoolCollect(event: Collect): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolCollect(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
