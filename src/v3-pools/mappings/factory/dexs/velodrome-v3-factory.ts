import { AerodromeV3Pool as AerodromeV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/VelodromeV3Factory/AerodromeV3Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleVelodromeV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.velodromeV3,
    "Velodrome V3",
    "https://velodrome.finance/",
    "https://icons.llamao.fi/icons/protocols/velodrome",
    V3PositionManagerAddress.velodrome,
  );

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    0,
    event.params.tickSpacing,
    protocolEntity,
  );

  AerodromeV3PoolTemplate.create(event.params.pool);
}
