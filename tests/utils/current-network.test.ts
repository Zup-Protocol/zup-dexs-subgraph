import { Address } from "@graphprotocol/graph-ts";
import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { CurrentNetwork } from "../../src/utils/current-network";

describe("`wrappedNativeAddress` should return the correct value for each network", () => {
  test("Mainnet", () => {
    dataSourceMock.setNetwork("mainnet");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2"),
    );
  });

  test("Scroll", () => {
    dataSourceMock.setNetwork("scroll");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x5300000000000000000000000000000000000004"),
    );
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork("sepolia");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xfFf9976782d46CC05630D1f6eBAb18b2324d6B14"),
    );
  });

  test("Base", () => {
    dataSourceMock.setNetwork("base");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x4200000000000000000000000000000000000006"),
    );
  });

  test("Unichain", () => {
    dataSourceMock.setNetwork("unichain");

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x4200000000000000000000000000000000000006"),
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
  test("Mainnet", () => {
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

  test("Scroll", () => {
    dataSourceMock.setNetwork("scroll");

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        ["0xf55BEC9cafDbE8730f096Aa55dad6D22d44099Df", "0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4"].join(),
    );
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork("sepolia");

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() == ["0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238"].join(),
    );
  });

  test("Base", () => {
    dataSourceMock.setNetwork("base");

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913",
          "0xfde4C96c8593536E31F229EA8f37b2ADa2699bb2",
          "0x820c137fa70c8691f0e44dc420a5e53c168921dc",
          "0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA",
        ].join(),
    );
  });

  test("Unichain", () => {
    dataSourceMock.setNetwork("unichain");

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        ["0x078D782b760474a361dDA0AF3839290b0EF57AD6", "0x9151434b16b9763660705744891fA906F660EcC5"].join(),
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

describe("`NativeToken` should return a correct native token object for each network", () => {
  test("Mainnet", () => {
    dataSourceMock.setNetwork("mainnet");

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Scroll", () => {
    dataSourceMock.setNetwork("scroll");

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork("sepolia");

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Base", () => {
    dataSourceMock.setNetwork("base");

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Unichain", () => {
    dataSourceMock.setNetwork("unichain");

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });
});
