import { VelodromeV2Pool as VelodromeV2PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/VelodromeV2Factory/VelodromeV2Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleVelodromeV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.velodromeV2,
    "Velodrome V2",
    "https://velodrome.finance/",
    "https://icons.llamao.fi/icons/protocols/velodrome",
    V2PositionManagerAddress.velodrome,
  );

  let poolCreated = handleV2PoolCreated(
    event,
    event.params.token0,
    event.params.token1,
    event.params.pool,
    0,
    protocolEntity,
  );

  VelodromeV2PoolTemplate.create(event.params.pool);

  poolCreated.isStablePool = event.params.stable;
  poolCreated.save();
}
