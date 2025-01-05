import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { handleV3PoolInitialize } from "../../v3-pool-initialize";

export function handleUniswapV3PoolInitialize(event: InitializeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolInitialize(poolEntity, token0Entity, token1Entity, event.params.sqrtPriceX96);
}
