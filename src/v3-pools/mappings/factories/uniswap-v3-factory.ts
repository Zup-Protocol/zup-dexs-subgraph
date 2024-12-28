import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { EntityCreator } from "../../../utils/entity-creator";
import { checkAndCreatePoolProtocolEntity } from "../../../utils/pool-utils";
import { handleV3PoolCreated } from "./v3-factory";

export function handleUniswapV3PoolCreated(event: PoolCreatedEvent): void {
  let poolEntity = handleV3PoolCreated(event);

  checkAndCreatePoolProtocolEntity(poolEntity, () => new EntityCreator().createUniswapProtocolEntity());
}
