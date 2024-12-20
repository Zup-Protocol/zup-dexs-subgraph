import { PoolCreated as PoolCreatedEvent } from "../../../generated/UniswapV3Factory/UniswapV3Factory";
import { PoolDailyData as PoolDailyDataEntity, Pool as PoolEntity } from "../../../generated/schema";

export function handlePoolCreated(event: PoolCreatedEvent): void {
  let poolEntity = new PoolEntity(event.address);

  {
    poolEntity.token0 = event.params.token0;
    poolEntity.token1 = event.params.token1;
    poolEntity.feeTier = event.params.fee;
    poolEntity.tickSpacing = event.params.tickSpacing;
  }

  let poolDailyDataEntity = new PoolDailyDataEntity(event.address);

  {
    poolDailyDataEntity.pool = event.address;
  }

  poolEntity.save();
  poolDailyDataEntity.save();
}
