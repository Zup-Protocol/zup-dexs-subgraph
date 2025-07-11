import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/NuriExchangeV3Factory/NuriExchangeV3Factory";
import { NuriExchangeV3Pool } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleNuriExchangeV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.nuriExchangeV3,
    "Nuri Exchange V3",
    "https://www.nuri.exchange/",
    "https://www.nuri.exchange/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Femission.081c7921.png&w=64&q=75",
    V3PositionManagerAddress.nuriExchange,
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

  NuriExchangeV3Pool.create(event.params.pool);
}
