import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Mint as MintEvent } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";
import { handleV3PoolMint } from "../../v3-pool-mint";

export function handleCamelotV3PoolMint(event: MintEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV3PoolMint(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
