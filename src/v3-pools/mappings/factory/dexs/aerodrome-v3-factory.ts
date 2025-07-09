import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/AerodromeV3Factory/AerodromeV3Factory";
import { AerodromeV3Pool as AerodromeV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleAerodromeV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.aerodromeV3,
    "Aerodrome V3",
    "https://aerodrome.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/aerodrome.finance.png",
    V3PositionManagerAddress.aerodrome,
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
