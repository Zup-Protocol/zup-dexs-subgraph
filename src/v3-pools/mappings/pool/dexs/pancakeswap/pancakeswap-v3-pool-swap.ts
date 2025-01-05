import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../../../generated/templates/PancakeSwapV3Pool/PancakeSwapV3Pool";
import { handleV3PoolSwap } from "../../v3-pool-swap";

export function handlePancakeSwapV3PoolSwap(event: SwapEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolSwap(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    event.params.amount0,
    event.params.amount1,
    event.params.sqrtPriceX96,
  );
}
