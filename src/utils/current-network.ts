import { dataSource } from "@graphprotocol/graph-ts";
import { BASE_NETWORK_NAME, MAINNET_NETWORK_NAME, SCROLL_NETWORK_NAME, SEPOLIA_NETWORK_NAME } from "./constants";

export abstract class CurrentNetwork {
  private static unsupportedNetworkError: Error = new Error("Unsupported network: " + dataSource.network());

  static get wrappedNativeAddress(): string {
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2";
    if (dataSource.network() == SCROLL_NETWORK_NAME) return "0x5300000000000000000000000000000000000004";
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0xfFf9976782d46CC05630D1f6eBAb18b2324d6B14";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x4200000000000000000000000000000000000006";

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

    if (dataSource.network() == SCROLL_NETWORK_NAME) {
      return [
        "0xf55BEC9cafDbE8730f096Aa55dad6D22d44099Df", // USDT
        "0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4", // USDC
      ];
    }

    if (dataSource.network() == SEPOLIA_NETWORK_NAME) {
      return [
        "0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238", // USDC
      ];
    }

    if (dataSource.network() == BASE_NETWORK_NAME) {
      return [
        "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913", // USDC
        "0xfde4C96c8593536E31F229EA8f37b2ADa2699bb2", // USDT
        "0x820c137fa70c8691f0e44dc420a5e53c168921dc", // USDS
        "0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA", // USDbC
      ];
    }

    throw CurrentNetwork.unsupportedNetworkError;
  }
}
