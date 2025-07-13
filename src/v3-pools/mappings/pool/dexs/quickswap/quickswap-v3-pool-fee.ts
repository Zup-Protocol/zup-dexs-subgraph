import { Pool as PoolEntity } from "../../../../../../generated/schema";
import { Fee as FeeEvent } from "../../../../../../generated/templates/QuickSwapV3Pool/QuickSwapV3Pool";

export function handleQuickSwapV3PoolFee(event: FeeEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;

  poolEntity.currentFeeTier = event.params.fee;

  poolEntity.save();
}
