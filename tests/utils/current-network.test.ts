import { Address } from "@graphprotocol/graph-ts";
import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { CurrentNetwork } from "../../src/utils/current-network";

describe("`wrappedNativeAddress` should return the correct value for each network", () => {
  test("Mainnet should return 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2", () => {
    dataSourceMock.setNetwork("mainnet");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2"),
    );
  });
});

test(
  "`wrappedNativeAddress` should throw if the current network is not supported",
  () => {
    dataSourceMock.setNetwork("some-random-unsupported-network");

    CurrentNetwork.wrappedNativeAddress;
  },
  true, // should throw flag
);

describe("`stablecoinsAddresses` should return a correct list of stablecoins for each network", () => {
  test("mainnet stablecoin addresses", () => {
    dataSourceMock.setNetwork("mainnet");

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0xdac17f958d2ee523a2206206994597c13d831ec7",
          "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48",
          "0xdC035D45d973E3EC169d2276DDab16f1e407384F",
          "0x4c9edd5852cd905f086c759e8383e09bff1e68b3",
          "0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409",
          "0x6c3ea9036406852006290770bedfcaba0e23a0e8",
        ].join(),
    );
  });
});

test(
  "`stablecoinsAddresses` should throw if the current network is not supported",
  () => {
    dataSourceMock.setNetwork("some-random-unsupported-network");

    CurrentNetwork.stablecoinsAddresses;
  },
  true, // should throw flag
);
