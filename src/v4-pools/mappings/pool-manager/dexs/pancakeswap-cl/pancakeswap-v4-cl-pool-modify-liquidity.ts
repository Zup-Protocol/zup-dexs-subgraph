import { ModifyLiquidity as ModifyLiquidityEvent } from "../../../../../../generated/PancakeSwapV4CLPoolManager/PancakeSwapV4CLPoolManager";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { handleV4PoolModifyLiquidity } from "../../v4-pool-modify-liquidity";

export function handlePancakeSwapV4CLModifyLiquidity(event: ModifyLiquidityEvent): void {
  let poolEntity = PoolEntity.load(event.params.id)!;
  let token0 = TokenEntity.load(poolEntity.token0)!;
  let token1 = TokenEntity.load(poolEntity.token1)!;

  handleV4PoolModifyLiquidity(
    poolEntity,
    token0,
    token1,
    event.params.liquidityDelta,
    event.params.tickLower,
    event.params.tickUpper,
  );
}
