import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { V4PoolManagerAddress } from "../../../src/v4-pools/utils/v4-pool-manager-address";

describe("V4PoolManagerAddress", () => {
  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(V4PoolManagerAddress.uniswap, "0x000000000004444c5dc75cB358380D2e3dE08A90");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork("sepolia");
    assert.stringEquals(V4PoolManagerAddress.uniswap, "0xE03A1074c86CFeDd5C142C4F04F1a1536e203543");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V4PoolManagerAddress.uniswap, "0x498581ff718922c3f8e6a244956af099b2652b2b");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork("unichain");
    assert.stringEquals(V4PoolManagerAddress.uniswap, "0x1f98400000000000000000000000000000000004");
  });

  test(
    "uniswap throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("randomnet");
      V4PoolManagerAddress.uniswap;
    },
    true,
  );
});
