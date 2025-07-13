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

export class V2PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V2 Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x284f11109359a7e1306c3e447ef14d38400063ff";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3";
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x4752ba5DBc23f44D87826276BF6Fd6b1C372aD24";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x4752ba5dbc23f44d87826276bf6fd6b1c372ad24";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0x4752ba5dbc23f44d87826276bf6fd6b1c372ad24";
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0xedf6066a2b290C185783862C7F4776A2C8077AD1";
    if (dataSource.network() == OP_NETWORK_NAME) return "0x4A7b5Da61326A6379179b40d00F57E5bbDC962c2";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap V2");
  }

  static get sushiSwap(): string {
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x9B3336186a38E1b6c21955d112dbb0343Ee061eE";
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x6BDED42c6DA8FBf0d2bA55B2fa120C5e0c8D7891";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506";
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506";
    if (dataSource.network() == OP_NETWORK_NAME) return "0x2ABf469074dc0b54d793850807E6eb5Faf2625b1";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("SushiSwap V2");
  }

  static get pancakeSwap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xEfF92A263d31888d860bD50809A8D171709b7b1c";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x10ED43C718714eb63d5aA57B78B54704E256024E";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x8cFe327CEc66d1C090Dd72bd0FF11d690C33a2Eb";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0x8cFe327CEc66d1C090Dd72bd0FF11d690C33a2Eb";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("PancakeSwap V2");
  }

  static get baseSwap(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x327Df1E6de05895d2ab08513aaDD9313Fe505d86";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("BaseSwap V2");
  }

  static get alienBase(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x8c1A3cF8f83074169FE5D7aD50B978e1cD6b37c7";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Alien Base V2");
  }

  static get aerodrome(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0xcF77a3Ba9A5CA399B7c97c74d54e5b1Beb874E43";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Aerodrome V2");
  }

  static get camelot(): string {
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xc873fEcbd354f5A56E00E710B90EF4201db2448d";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Camelot V2");
  }

  static get ramses(): string {
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xAAA87963EFeB6f7E0a2711F397663105Acb1805e";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Ramses V2");
  }

  static get quickSwap(): string {
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("QuickSwap V2");
  }

  static get velodrome(): string {
    if (dataSource.network() == OP_NETWORK_NAME) return "0xa062aE8A9c5e11aaA026fc2670B0D65cCc8B2858";

    throw V2PositionManagerAddress.unsupportedProtocolNetworkError("Velodrome V2");
  }
}
