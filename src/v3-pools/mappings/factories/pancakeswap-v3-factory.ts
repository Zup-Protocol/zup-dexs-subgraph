import { Protocol as ProtocolEntity } from "../../../../generated/schema";
import { PoolCreated as PoolCreatedEvent } from "../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { PANCAKE_SWAP_ID } from "../../../utils/constants";
import { handleV3PoolCreated } from "./v3-factory";

export function handlePancakeSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let poolEntity = handleV3PoolCreated(event);

  let protocolEntity = ProtocolEntity.load(PANCAKE_SWAP_ID);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(PANCAKE_SWAP_ID);

    protocolEntity.name = "PancakeSwap";
    protocolEntity.url = "https://pancakeswap.finance";
    protocolEntity.logo =
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png";

    protocolEntity.save();
  }

  if (poolEntity.protocol != PANCAKE_SWAP_ID) {
    poolEntity.protocol = PANCAKE_SWAP_ID;

    poolEntity.save();
  }
}
