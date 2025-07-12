import { Pool as PoolEntity } from "../../../../../../generated/schema";
import { FeeAdjustment as FeeAdjustmentEvent } from "../../../../../../generated/templates/NuriExchangeV3Pool/NuriExchangeV3Pool";

export function handleNuriExchangeV3PoolFeeAdjustment(event: FeeAdjustmentEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  poolEntity.currentFeeTier = event.params.newFee;

  poolEntity.save();
}
