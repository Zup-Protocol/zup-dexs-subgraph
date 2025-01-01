import { Pool as PoolEntity, Token as TokenEntity } from "../../../../generated/schema";
import { Initialize as InitializeEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { V3PoolSetters } from "../../utils/v3-pool-setters";

export function handleV3PoolInitialize(
  event: InitializeEvent,
  v3PoolSetters: V3PoolSetters = new V3PoolSetters(),
): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let poolToken0Entity = TokenEntity.load(poolEntity.token0)!;
  let poolToken1Entity = TokenEntity.load(poolEntity.token1)!;

  v3PoolSetters.setPricesForV3PoolWhitelistedTokens(event.params.sqrtPriceX96, poolEntity);

  poolToken0Entity.save();
  poolToken1Entity.save();
  poolEntity.save();
}
