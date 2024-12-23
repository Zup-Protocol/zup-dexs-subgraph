import { ethereum } from "@graphprotocol/graph-ts";
import { PoolDailyData as PoolDailyDataEntity, Pool as PoolEntity } from "../../../generated/schema";
import { ZERO_BIG_DECIMAL } from "../../utils/constants";
import { getPoolDailyDataId } from "../../utils/pool-utils";

export function setPoolDailyDataTVL(event: ethereum.Event, poolEntity: PoolEntity): void {
  let poolDailyDataId = getPoolDailyDataId(event.block.timestamp, poolEntity.createdAtTimestamp, poolEntity.id);
  let poolDailyDataEntity = PoolDailyDataEntity.load(poolDailyDataId);

  if (poolDailyDataEntity != null) {
    poolDailyDataEntity.totalValueLockedUSD = poolEntity.totalValueLockedUSD;
    poolDailyDataEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0;
    poolDailyDataEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1;
  } else {
    poolDailyDataEntity = new PoolDailyDataEntity(poolDailyDataId);

    poolDailyDataEntity.dayStartTimestamp = event.block.timestamp;
    poolDailyDataEntity.totalValueLockedUSD = poolEntity.totalValueLockedUSD;
    poolDailyDataEntity.totalValueLockedToken0 = poolEntity.totalValueLockedToken0;
    poolDailyDataEntity.totalValueLockedToken1 = poolEntity.totalValueLockedToken1;
    poolDailyDataEntity.pool = poolEntity.id;
    poolDailyDataEntity.feesToken0 = ZERO_BIG_DECIMAL;
    poolDailyDataEntity.feesToken1 = ZERO_BIG_DECIMAL;
    poolDailyDataEntity.feesUSD = ZERO_BIG_DECIMAL;
  }

  poolDailyDataEntity.save();
}
