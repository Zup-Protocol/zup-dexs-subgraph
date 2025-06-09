import { dataSource } from "@graphprotocol/graph-ts";
import {
  BASE_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "./constants";

export class Permit2Address {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`Permit2 address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x000000000022D473030F116dDEE9F6B43aC78BA3";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x000000000022D473030F116dDEE9F6B43aC78BA3";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0xFcf5986450E4A014fFE7ad4Ae24921B589D039b5";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x000000000022D473030F116dDEE9F6B43aC78BA3";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x000000000022D473030F116dDEE9F6B43aC78BA3";

    throw Permit2Address.unsupportedProtocolNetworkError("Uniswap");
  }
}
