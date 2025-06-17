import { BigInt } from "@graphprotocol/graph-ts";
import { Swap as SwapEvent } from "../../../../../../generated/PancakeSwapV4CLPoolManager/PancakeSwapV4CLPoolManager";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { handleV4PoolSwap } from "../../v4-pool-swap";

export function handlePancakeSwapV4CLSwap(event: SwapEvent): void {
  let poolEntity = PoolEntity.load(event.params.id)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV4PoolSwap(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    event.params.amount0,
    event.params.amount1,
    event.params.sqrtPriceX96,
    BigInt.fromI32(event.params.tick),
    event.params.fee,
  );
}
