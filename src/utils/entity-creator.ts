import { Protocol as ProtocolEntity } from "../../generated/schema";

export class EntityCreator {
  createPancakeSwapProtocolEntity(): ProtocolEntity {
    let protocol = new ProtocolEntity("pancakeswap");
    protocol.name = "PancakeSwap";
    protocol.url = "https://pancakeswap.finance";
    protocol.logo =
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png";
    protocol.save();

    return protocol;
  }

  createUniswapProtocolEntity(): ProtocolEntity {
    let protocol = new ProtocolEntity("uniswap");

    protocol.name = "Uniswap";
    protocol.url = "https://uniswap.org";
    protocol.logo = "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png";

    protocol.save();
    return protocol;
  }
}
