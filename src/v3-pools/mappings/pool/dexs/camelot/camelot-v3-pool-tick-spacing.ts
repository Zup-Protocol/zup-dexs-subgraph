import { V3Pool as V3PoolEntity } from "../../../../../../generated/schema";
import { TickSpacing as TickSpacingEvent } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";

export function handleCamelotV3PoolTickSpacing(event: TickSpacingEvent): void {
  let v3PoolEntity = V3PoolEntity.load(event.address)!;

  v3PoolEntity.tickSpacing = event.params.newTickSpacing;
  v3PoolEntity.save();
}
