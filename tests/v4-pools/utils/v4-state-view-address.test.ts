import { assert, dataSourceMock, describe, test } from "matchstick-as";
import {
  ARBITRUM_NETWORK_NAME,
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  OP_NETWORK_NAME,
  POLYGON_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../../src/common/constants";
import { V4StateViewAddress } from "../../../src/v4-pools/utils/v4-state-view-address";

describe("V4StateViewAddress", () => {
  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
    assert.stringEquals(V4StateViewAddress.uniswap, "0x7ffe42c4a5deea5b0fec41c94c136cf115597227");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);
    assert.stringEquals(V4StateViewAddress.uniswap, "0xe1dd9c3fa50edb962e442f60dfbc432e24537e4c");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V4StateViewAddress.uniswap, "0xa3c0c9b65bad0b08107aa264b0f3db444b867a71");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
    assert.stringEquals(V4StateViewAddress.uniswap, "0x86e8631a016f9068c3f085faf484ee3f5fdee8f2");
  });

  test("uniswap returns correct address for bsc", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V4StateViewAddress.uniswap, "0xd13Dd3D6E93f276FAfc9Db9E6BB47C1180aeE0c4");
  });

  test("UniswapV4 returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V4StateViewAddress.uniswap, "0x76Fd297e2D437cd7f76d50F01AfE6160f86e9990");
  });

  test("UniswapV4 returns correct address for polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.stringEquals(V4StateViewAddress.uniswap, "0x5eA1bD7974c8A611cBAB0bDCAFcB1D9CC9b3BA5a");
  });

  test("UniswapV4 returns correct address for optimism", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.stringEquals(V4StateViewAddress.uniswap, "0xc18a3169788F4F75A170290584ECA6395C75Ecdb");
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
