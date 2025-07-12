import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../../../generated/templates/CamelotV2Pool/CamelotV2Pool";
import { handleV2PoolSwap } from "../../v2-pool-swap";

export function handleCamelotV2PoolSwap(event: SwapEvent): void {
  let pool = PoolEntity.load(event.address)!;
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = TokenEntity.load(pool.token1)!;

  handleV2PoolSwap(
    event,
    pool,
    token0,
    token1,
    event.params.amount0In,
    event.params.amount1In,
    event.params.amount0Out,
    event.params.amount1Out,
  );
}
