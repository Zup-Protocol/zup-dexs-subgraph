import { dataSource } from "@graphprotocol/graph-ts";
import {
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../common/constants";

export class V4StateViewAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V4 State view address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0x7ffe42c4a5deea5b0fec41c94c136cf115597227";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0xe1dd9c3fa50edb962e442f60dfbc432e24537e4c";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0xa3c0c9b65bad0b08107aa264b0f3db444b867a71";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x86e8631a016f9068c3f085faf484ee3f5fdee8f2";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0xd13Dd3D6E93f276FAfc9Db9E6BB47C1180aeE0c4";

    throw V4StateViewAddress.unsupportedProtocolNetworkError("Uniswap");
  }
}
