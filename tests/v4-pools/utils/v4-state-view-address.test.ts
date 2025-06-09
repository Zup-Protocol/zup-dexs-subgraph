import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { V4StateViewAddress } from "../../../src/v4-pools/utils/v4-state-view-address";

describe("V4StateViewAddress", () => {
  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(V4StateViewAddress.uniswap, "0x7ffe42c4a5deea5b0fec41c94c136cf115597227");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork("sepolia");
    assert.stringEquals(V4StateViewAddress.uniswap, "0xe1dd9c3fa50edb962e442f60dfbc432e24537e4c");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V4StateViewAddress.uniswap, "0xa3c0c9b65bad0b08107aa264b0f3db444b867a71");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork("unichain");
    assert.stringEquals(V4StateViewAddress.uniswap, "0x86e8631a016f9068c3f085faf484ee3f5fdee8f2");
  });

  test(
    "uniswap throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("randomnet");
      V4StateViewAddress.uniswap;
    },
    true,
  );
});
