import { Pool as PoolCreatedEvent } from "../../../../../generated/CamelotV3Factory/CamelotV3Factory";
import { CamelotV3Pool as CamelotV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleCamelotV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.camelotV3,
    "Camelot V3",
    "https://camelot.exchange",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/camelot.exchange.png",
    V3PositionManagerAddress.camelot,
  );

  let baseFeeTier = 100;
  let baseTickSpacing = 60;

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    baseFeeTier,
    baseTickSpacing,
    protocolEntity,
  );

  CamelotV3PoolTemplate.create(event.params.pool);
}
