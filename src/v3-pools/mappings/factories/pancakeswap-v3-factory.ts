import { Protocol as ProtocolEntity } from "../../../../generated/schema";
import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { handleV3PoolCreated } from "./v3-factory";

export function handlePancakeSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolId = "pancake-swap";
  let poolEntity = handleV3PoolCreated(event);
  let protocolEntity = ProtocolEntity.load(protocolId);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(protocolId);

    protocolEntity.name = "PancakeSwap";
    protocolEntity.url = "https://pancakeswap.finance";
    protocolEntity.logo =
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png";

    protocolEntity.save();
  }

  if (poolEntity.protocol != protocolId) {
    poolEntity.protocol = protocolId;

    poolEntity.save();
  }
}
