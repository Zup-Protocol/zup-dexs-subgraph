import { dataSource } from "@graphprotocol/graph-ts";
import {
  BASE_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "./constants";

export class V3PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V3 Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get nuriExchange(): string {
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0xAAA78E8C4241990B4ce159E105dA08129345946A";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Nuri Exchange");
  }

  static get aerodrome(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x827922686190790b37229fd06084350E74485b72";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Aerodrome");
  }

  static get uniswap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xC36442b4a4522E871399CD717aBDD847Ab11FE88";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x1238536071E1c677A632429e3655c799b22cDA52";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0xB39002E4033b162fAc607fc3471E205FA2aE5967";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x03a520b32C04BF3bEEf7BEb72E919cf822Ed34f1";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x943e6e07a7e8e791dafc44083e54041d743c46e9";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap");
  }

  static get pancakeSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Pancake Swap");
  }

  static get sushiSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x2214A42d8e2A1d20635c2cb0664422c528B6A432";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x0389879e0156033202C44BF784ac18fC02edeE4f";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x80C7DD17B01855a6D2347444a0FCC36136a314de";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Sushi Swap");
  }
  static get zebra(): string {
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x349B654dcbce53943C8e87F914F62ae9526C6681";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Zebra");
  }

  static get baseSwap(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0xDe151D5c92BfAA288Db4B67c21CD55d5826bCc93";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Base Swap");
  }

  static get AlienBase(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0xB7996D1ECD07fB227e8DcA8CD5214bDfb04534E5";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("AlienBase");
  }
}

export class V4PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V4 Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x429ba70129df741B2Ca2a85BC3A2a3328e5c09b4";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x4529A01c7A0410167c5740C487A8DE60232617bf";
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xbD216513d74C8cf14cf4747E6AaA6420FF64ee9e";

    throw V4PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap V4");
  }
}
