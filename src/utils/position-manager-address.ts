import { dataSource } from "@graphprotocol/graph-ts";
import { MAINNET_NETWORK_NAME, SCROLL_NETWORK_NAME, SEPOLIA_NETWORK_NAME } from "./constants";

export class PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get nuriExchange(): string {
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0xAAA78E8C4241990B4ce159E105dA08129345946A";

    throw PositionManagerAddress.unsupportedProtocolNetworkError("Nuri Exchange");
  }

  static get uniswap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xC36442b4a4522E871399CD717aBDD847Ab11FE88";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x1238536071E1c677A632429e3655c799b22cDA52";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0xB39002E4033b162fAc607fc3471E205FA2aE5967";

    throw PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap");
  }

  static get pancakeSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";

    throw PositionManagerAddress.unsupportedProtocolNetworkError("Pancake Swap");
  }

  static get sushiSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x2214A42d8e2A1d20635c2cb0664422c528B6A432";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x0389879e0156033202C44BF784ac18fC02edeE4f";

    throw PositionManagerAddress.unsupportedProtocolNetworkError("Sushi Swap");
  }
  static get zebra(): string {
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x349B654dcbce53943C8e87F914F62ae9526C6681";

    throw PositionManagerAddress.unsupportedProtocolNetworkError("Zebra");
  }
}
