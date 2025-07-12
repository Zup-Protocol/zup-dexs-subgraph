import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Mint as MintEvent } from "../../../../../../generated/templates/CamelotV2Pool/CamelotV2Pool";
import { handleV2PoolMint } from "../../v2-pool-mint";

export function handleCamelotV2PoolMint(event: MintEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  let amount0 = event.params.amount0;
  let amount1 = event.params.amount1;

  handleV2PoolMint(event, poolEntity, token0Entity, token1Entity, amount0, amount1);
}
