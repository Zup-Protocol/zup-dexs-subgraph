import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { setPricesForWhitelistedTokensUniswapV3 } from "../../utils/uniswap-v3-pool-setters";

export function handleUniswapV3PoolInitialize(event: InitializeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let poolToken0Entity = TokenEntity.load(poolEntity.token0)!;
  let poolToken1Entity = TokenEntity.load(poolEntity.token1)!;

  setPricesForWhitelistedTokensUniswapV3(event.params.sqrtPriceX96, poolToken0Entity, poolToken1Entity, poolEntity);

  poolToken0Entity.save();
  poolToken1Entity.save();
  poolEntity.save();
}
