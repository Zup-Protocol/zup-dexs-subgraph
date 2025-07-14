import { Address } from "@graphprotocol/graph-ts";
import { assert, dataSourceMock, describe, test } from "matchstick-as";
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
} from "../../src/common/constants";
import { CurrentNetwork } from "../../src/common/current-network";

describe("`wrappedNativeAddress` should return the correct value for each network", () => {
  test("Mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2"),
    );
  });

  test("Scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x5300000000000000000000000000000000000004"),
    );
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xfFf9976782d46CC05630D1f6eBAb18b2324d6B14"),
    );
  });

  test("Base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x4200000000000000000000000000000000000006"),
    );
  });

  test("Unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x4200000000000000000000000000000000000006"),
    );
  });

  test("BNB", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0xBB4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"),
    );
  });

  test("Arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x82aF49447D8a07e3bd95BD0d56f35241523fBab1"),
    );
  });

  test("Polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.addressEquals(
      Address.fromString(CurrentNetwork.wrappedNativeAddress),
      Address.fromString("0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270"),
    );
  });

  test("Optimism", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

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
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);

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
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        ["0xf55BEC9cafDbE8730f096Aa55dad6D22d44099Df", "0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4"].join(),
    );
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() == ["0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238"].join(),
    );
  });

  test("Base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

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
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        ["0x078D782b760474a361dDA0AF3839290b0EF57AD6", "0x9151434b16b9763660705744891fA906F660EcC5"].join(),
    );
  });

  test("BNB", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d",
          "0x55d398326f99059ff775485246999027b3197955",
          "0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409",
          "0x5d3a1ff2b6bab83b63cd9ad0787074081a52ef34",
          "0x2492D0006411Af6C8bbb1c8afc1B0197350a79e9",
        ].join(),
    );
  });

  test("Arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0xaf88d065e77c8cC2239327C5EDb3A432268e5831",
          "0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9",
          "0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8",
          "0xe80772Eaf6e2E18B651F160Bc9158b2A5caFCA65",
          "0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1",
          "0x4D15a3A2286D883AF0AA1B3f21367843FAc63E07",
          "0x6a7661795c374c0bfc635934efaddff3a7ee23b6",
        ].join(),
    );
  });

  test("Polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0x3c499c542cEF5E3811e1192ce70d8cC03d5c3359",
          "0x2791bca1f2de4661ed88a30c99a7a9449aa84174",
          "0xc2132d05d31c914a87c6611c10748aeb04b58e8f",
          "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
          "0xbC2b48BC930Ddc4E5cFb2e87a45c379Aab3aac5C",
        ].join(),
    );
  });

  test("Optimism", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.assertTrue(
      CurrentNetwork.stablecoinsAddresses.join() ==
        [
          "0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85", // USDC
          "0x7f5c764cbc14f9669b88837ca1490cca17c31607", // USDC.e
          "0x94b008aa00579c1307b0ef2c499ad98a8ce58e58", // USDT
          "0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1", // DAI
          "0x8aE125E8653821E851F12A49F7765db9a9ce7384", // DOLA
          "0x5d3a1ff2b6bab83b63cd9ad0787074081a52ef34", // USDe
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

describe("`NativeToken` should return a correct native token object for each network", () => {
  test("Mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("BNB", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "BNB");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "BNB");
  });

  test("Arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });

  test("Polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "POL");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Polygon");
  });

  test("Optimism", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.stringEquals(CurrentNetwork.nativeToken().symbol, "ETH");
    assert.i32Equals(CurrentNetwork.nativeToken().decimals, 18);
    assert.stringEquals(CurrentNetwork.nativeToken().name, "Ether");
  });
});
