import { dataSource } from "@graphprotocol/graph-ts";
import { UNICHAIN_NETWORK_NAME } from "../../common/constants";

export class V2PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V2 Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x284f11109359a7e1306c3e447ef14d38400063ff";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap V2");
  }
}
