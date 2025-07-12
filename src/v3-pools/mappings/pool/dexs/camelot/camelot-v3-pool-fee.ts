import { Pool as PoolEntity } from "../../../../../../generated/schema";
import { Fee as FeeEvent } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";

export function handleCamelotV3PoolFee(event: FeeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;

  poolEntity.currentFeeTier = (event.params.feeOtz + event.params.feeZto) / 2;

  poolEntity.save();
}
