import { Protocol as ProtocolEntity } from "../../../../generated/schema";
import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { handleV3PoolCreated } from "./v3-factory";

export function handleUniswapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolId = "uniswap";
  let poolEntity = handleV3PoolCreated(event);
  let protocolEntity = ProtocolEntity.load(protocolId);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(protocolId);

    protocolEntity.name = "Uniswap";
    protocolEntity.url = "https://uniswap.org";
    protocolEntity.logo =
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png";

    protocolEntity.save();
  }

  if (poolEntity.protocol != protocolId) {
    poolEntity.protocol = protocolId;

    poolEntity.save();
  }
}
