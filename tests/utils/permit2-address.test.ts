import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { Permit2Address } from "../../src/utils/permit2-address";

describe("Permit2Address", () => {
  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork("sepolia");
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for scroll", () => {
    dataSourceMock.setNetwork("scroll");
    assert.stringEquals(Permit2Address.uniswap, "0xFcf5986450E4A014fFE7ad4Ae24921B589D039b5");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork("unichain");
    assert.stringEquals(Permit2Address.uniswap, "0x000000000022D473030F116dDEE9F6B43aC78BA3");
  });

  test("uniswap returns correct address for bsc", () => {
    dataSourceMock.setNetwork("bsc");
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
