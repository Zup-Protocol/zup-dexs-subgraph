import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/AerodromeV2Factory/AerodromeV2Factory";
import { AerodromeV2Pool as AerodromeV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleAerodromeV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.aerodromeV2,
    "Aerodrome V2",
    "https://aerodrome.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/aerodrome.finance.png",
    V2PositionManagerAddress.aerodrome,
  );

  let poolEntity = handleV2PoolCreated(
    event,
    event.params.token0,
    event.params.token1,
    event.params.pool,
    0,
    protocolEntity,
  );

  AerodromeV2PoolTemplate.create(event.params.pool);

  poolEntity.isStablePool = event.params.stable;
  poolEntity.save();
}
