import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Mint as MintEvent } from "../../../../../../generated/templates/VelodromeV2Pool/VelodromeV2Pool";
import { handleV2PoolMint } from "../../v2-pool-mint";

export function handleVelodromeV2PoolMint(event: MintEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV2PoolMint(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
