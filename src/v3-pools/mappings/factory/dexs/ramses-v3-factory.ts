import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/RamsesV3Factory/RamsesV3Factory";
import { RamsesV3Pool as RamsesV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleRamsesV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.ramsesV3,
    "Ramses V3",
    "https://ramses.exchange/",
    "https://app.ramses.exchange/favicon/favicon.ico",
    V3PositionManagerAddress.ramses,
  );

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    event.params.fee,
    event.params.tickSpacing,
    protocolEntity,
  );

  RamsesV3PoolTemplate.create(event.params.pool);
}
