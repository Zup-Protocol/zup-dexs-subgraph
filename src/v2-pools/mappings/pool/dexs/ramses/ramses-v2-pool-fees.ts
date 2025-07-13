import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Fees as FeesEvent } from "../../../../../../generated/templates/RamsesV2Pool/RamsesV2Pool";
import { handleV2PoolClaimFees } from "../../v2-pool-claim-fees";

export function handleRamsesV2PoolFees(event: FeesEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  handleV2PoolClaimFees(event, poolEntity, token0Entity, token1Entity, event.params.amount0, event.params.amount1);
}
