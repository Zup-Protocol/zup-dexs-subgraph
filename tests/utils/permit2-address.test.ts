import { assert, dataSourceMock, describe, test } from "matchstick-as";
import {
  ARBITRUM_NETWORK_NAME,
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../src/common/constants";
import { Permit2Address } from "../../src/common/permit2-address";

describe("Permit2Address", () => {
  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0xFcf5986450E4A014fFE7ad4Ae24921B589D039b5");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for bsc", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test(
    "uniswap throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("randomnet");
      Permit2Address.uniswap;
    },
    true,
  );

  test("pancakeSWap returns correct address for bsc", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(Permit2Address.pancakeSwap, "0x31c2F6fcFf4F8759b3Bd5Bf0e1084A055615c768");
  });

  test(
    "pancakeSwap throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("randomnet");
      Permit2Address.pancakeSwap;
    },
    true,
  );
});
