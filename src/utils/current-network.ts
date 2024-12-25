import { dataSource } from "@graphprotocol/graph-ts";

// Networks are defined like const variables because unfortunately enums are not supported in subgraphs
const MAINNET_NETWORK_NAME = "mainnet";

export abstract class CurrentNetwork {
  private static unsupportedNetworkError: Error = new Error("Unsupported network: " + dataSource.network());

  static get wrappedNativeAddress(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2";

    throw CurrentNetwork.unsupportedNetworkError;
  }

  static get stablecoinsAddresses(): string[] {
    if (dataSource.network() == MAINNET_NETWORK_NAME) {
      return [
        "0xdac17f958d2ee523a2206206994597c13d831ec7", // USDT
        "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48", // USDC
        "0xdC035D45d973E3EC169d2276DDab16f1e407384F", // USDS
        "0x4c9edd5852cd905f086c759e8383e09bff1e68b3", // USDE
        "0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409", // FDUSD
        "0x6c3ea9036406852006290770bedfcaba0e23a0e8", // PYUSD
      ];
    }

    throw CurrentNetwork.unsupportedNetworkError;
  }
}
