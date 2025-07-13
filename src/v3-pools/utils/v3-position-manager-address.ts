import { dataSource } from "@graphprotocol/graph-ts";
import {
  ARBITRUM_NETWORK_NAME,
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  OP_NETWORK_NAME,
  POLYGON_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../common/constants";

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
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x7b8A01B39D58278b5DE7e48c8449c9f4F5170613";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xC36442b4a4522E871399CD717aBDD847Ab11FE88";
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0xC36442b4a4522E871399CD717aBDD847Ab11FE88";
    if (dataSource.network() == OP_NETWORK_NAME) return "0xC36442b4a4522E871399CD717aBDD847Ab11FE88";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap");
  }

  static get pancakeSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Pancake Swap");
  }

  static get sushiSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x2214A42d8e2A1d20635c2cb0664422c528B6A432";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x0389879e0156033202C44BF784ac18fC02edeE4f";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x80C7DD17B01855a6D2347444a0FCC36136a314de";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0xF70c086618dcf2b1A461311275e00D6B722ef914";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xF0cBce1942A68BEB3d1b73F0dd86C8DCc363eF49";
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0xb7402ee99F0A008e461098AC3A27F4957Df89a40";
    if (dataSource.network() == OP_NETWORK_NAME) return "0x1af415a1EbA07a4986a52B6f2e7dE7003D82231e";

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

  static get alienBase(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0xB7996D1ECD07fB227e8DcA8CD5214bDfb04534E5";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("AlienBase");
  }

  static get squadSwap(): string {
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x501535ef0B92eE1df5C12f47720f1E479b1Db7b4";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("SquadSwap");
  }

  static get unchainX(): string {
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x854EC70B78933fAB3f95E5bC95D7Af72b62703dE";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("UnchainX");
  }

  static get camelot(): string {
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0x00c7f3082833e796A5b3e4Bd59f6642FF44DCD15";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Camelot V3");
  }

  static get ramses(): string {
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xAA277CB7914b7e5514946Da92cb9De332Ce610EF";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Ramses V3");
  }

  static get quickSwap(): string {
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0x8eF88E4c7CfbbaC1C163f7eddd4B578792201de6";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("QuickSwap V3");
  }

  static get velodrome(): string {
    if (dataSource.network() == OP_NETWORK_NAME) return "0x416b433906b1B72FA758e166e239c43d68dC6F29";

    throw V3PositionManagerAddress.unsupportedProtocolNetworkError("Velodrome V3");
  }
}
