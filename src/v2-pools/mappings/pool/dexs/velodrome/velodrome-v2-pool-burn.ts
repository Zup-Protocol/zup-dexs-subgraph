import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Burn as BurnEvent } from "../../../../../../generated/templates/VelodromeV2Pool/VelodromeV2Pool";
import { handleV2PoolBurn } from "../../v2-pool-burn";

export function handleVelodromeV2PoolBurn(event: BurnEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV2PoolBurn(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
