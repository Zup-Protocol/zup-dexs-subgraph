import { dataSource } from "@graphprotocol/graph-ts";
import {
  BASE_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../utils/constants";

export class V4PoolManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V4 Pool Manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x000000000004444c5dc75cB358380D2e3dE08A90";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0xE03A1074c86CFeDd5C142C4F04F1a1536e203543";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x498581ff718922c3f8e6a244956af099b2652b2b";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x1f98400000000000000000000000000000000004";

    throw V4PoolManagerAddress.unsupportedProtocolNetworkError("Uniswap");
  }
}
