import { Pool as PoolEntity } from "../../../../../../generated/schema";
import { FeePercentUpdated as FeePercentUpdatedEvent } from "../../../../../../generated/templates/CamelotV2Pool/CamelotV2Pool";

export function handleCamelotV2PoolFeePercentUpdated(event: FeePercentUpdatedEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;

  let newFeeTier = (event.params.token0FeePercent + event.params.token1FeePercent) / 2;
  let newFeeTierAsUniswapFeeTier = newFeeTier * 10;

  poolEntity.currentFeeTier = newFeeTierAsUniswapFeeTier;

  poolEntity.save();
}
