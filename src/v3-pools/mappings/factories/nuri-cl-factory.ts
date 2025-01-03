import { Protocol as ProtocolEntity } from "../../../../generated/schema";
import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { NURI_EXCHANGE_ID } from "../../../utils/constants";
import { handleV3PoolCreated } from "./v3-factory";

export function handleNuriCLPoolCreated(event: PoolCreatedEvent): void {
  let poolEntity = handleV3PoolCreated(event);

  let protocolEntity = ProtocolEntity.load(NURI_EXCHANGE_ID);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(NURI_EXCHANGE_ID);

    protocolEntity.name = "Nuri Exchange";
    protocolEntity.url = "https://www.nuri.exchange/";
    protocolEntity.logo =
      "https://www.nuri.exchange/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Femission.081c7921.png&w=64&q=75";

    protocolEntity.save();
  }

  if (poolEntity.protocol != NURI_EXCHANGE_ID) {
    poolEntity.protocol = NURI_EXCHANGE_ID;

    poolEntity.save();
  }
}
