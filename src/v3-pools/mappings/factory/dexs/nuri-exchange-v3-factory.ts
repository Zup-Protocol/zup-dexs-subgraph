import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/NuriExchangeV3Factory/NuriExchangeV3Factory";
import { NuriExchangeV3Pool } from "../../../../../generated/templates";
import { NURI_EXCHANGE_ID } from "../../../../utils/constants";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleNuriExchangeV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    NURI_EXCHANGE_ID,
    "Nuri Exchange",
    "https://www.nuri.exchange/",
    "https://www.nuri.exchange/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Femission.081c7921.png&w=64&q=75",
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
