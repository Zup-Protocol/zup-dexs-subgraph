import { Pool as PoolEntity } from "../../../../../../generated/schema";
import { FeeAdjustment as FeeAdjustmentEvent } from "../../../../../../generated/templates/RamsesV3Pool/RamsesV3Pool";

export function handleRamsesV3PoolFeeAdjustment(event: FeeAdjustmentEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  poolEntity.currentFeeTier = event.params.newFee;

  poolEntity.save();
}
