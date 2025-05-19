import {
  AerodromeV3Factory,
  PoolCreated as PoolCreatedEvent,
} from "../../../../../generated/AerodromeV3Factory/AerodromeV3Factory";
import { AerodromeV3Pool as AerodromeV3PoolTemplate } from "../../../../../generated/templates";
import { V3PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "../v3-factory";

export function handleAerodromeV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.aerodromeV3,
    "Aerodrome V3",
    "https://aerodrome.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/aerodrome.finance.png",
    V3PositionManagerAddress.aerodrome,
  );

  const swapFee = AerodromeV3Factory.bind(event.address).getSwapFee(event.params.pool);

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    swapFee,
    event.params.tickSpacing,
    protocolEntity,
  );

  AerodromeV3PoolTemplate.create(event.params.pool);
}
