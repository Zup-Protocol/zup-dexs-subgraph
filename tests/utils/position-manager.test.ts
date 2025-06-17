import { assert, dataSourceMock, describe, test } from "matchstick-as";
import { V3PositionManagerAddress, V4PositionManagerAddress } from "../../src/utils/position-manager-address";

describe("V3PositionManagerAddress", () => {
  test("nuriExchange returns correct address for scroll", () => {
    dataSourceMock.setNetwork("scroll");
    assert.stringEquals(V3PositionManagerAddress.nuriExchange, "0xAAA78E8C4241990B4ce159E105dA08129345946A");
  });

  test(
    "nuriExchange throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("mainnet");
      V3PositionManagerAddress.nuriExchange;
    },
    true,
  );

  test("aerodrome returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V3PositionManagerAddress.aerodrome, "0x827922686190790b37229fd06084350E74485b72");
  });

  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xC36442b4a4522E871399CD717aBDD847Ab11FE88");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork("sepolia");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x1238536071E1c677A632429e3655c799b22cDA52");
  });

  test("uniswap returns correct address for scroll", () => {
    dataSourceMock.setNetwork("scroll");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xB39002E4033b162fAc607fc3471E205FA2aE5967");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x03a520b32C04BF3bEEf7BEb72E919cf822Ed34f1");
  });

  test("pancakeSwap returns correct address for all supported networks", () => {
    let networks = ["mainnet", "sepolia", "scroll", "base"];
    for (let i = 0; i < networks.length; i++) {
      dataSourceMock.setNetwork(networks[i]);
      assert.stringEquals(V3PositionManagerAddress.pancakeSwap, "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364");
    }
  });

  test("sushiSwap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x2214A42d8e2A1d20635c2cb0664422c528B6A432");
  });

  test("sushiSwap returns correct address for scroll", () => {
    dataSourceMock.setNetwork("scroll");
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x0389879e0156033202C44BF784ac18fC02edeE4f");
  });

  test("sushiSwap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x80C7DD17B01855a6D2347444a0FCC36136a314de");
  });

  test("zebra returns correct address for scroll", () => {
    dataSourceMock.setNetwork("scroll");
    assert.stringEquals(V3PositionManagerAddress.zebra, "0x349B654dcbce53943C8e87F914F62ae9526C6681");
  });

  test("baseSwap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V3PositionManagerAddress.baseSwap, "0xDe151D5c92BfAA288Db4B67c21CD55d5826bCc93");
  });

  test("AlienBase returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V3PositionManagerAddress.alienBase, "0xB7996D1ECD07fB227e8DcA8CD5214bDfb04534E5");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork("unichain");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x943e6e07a7e8e791dafc44083e54041d743c46e9");
  });

  test("uniswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x7b8A01B39D58278b5DE7e48c8449c9f4F5170613");
  });

  test("pancakeSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V3PositionManagerAddress.pancakeSwap, "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364");
  });

  test("sushiSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0xF70c086618dcf2b1A461311275e00D6B722ef914");
  });

  test("squadSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V3PositionManagerAddress.squadSwap, "0x501535ef0B92eE1df5C12f47720f1E479b1Db7b4");
  });

  test("unichainX returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V3PositionManagerAddress.unchainX, "0x854EC70B78933fAB3f95E5bC95D7Af72b62703dE");
  });

  test(
    "unsupportedProtocolNetworkError throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("unichain");
      V3PositionManagerAddress.aerodrome;
    },
    true,
  );
});

describe("V4PositionManagerAddress", () => {
  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork("sepolia");
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x429ba70129df741B2Ca2a85BC3A2a3328e5c09b4");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork("unichain");
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x4529A01c7A0410167c5740C487A8DE60232617bf");
  });

  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork("mainnet");
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0xbD216513d74C8cf14cf4747E6AaA6420FF64ee9e");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork("base");
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x7c5f5a4bbd8fd63184577525326123b519429bdc");
  });

  test("uniswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x7A4a5c919aE2541AeD11041A1AEeE68f1287f95b");
  });

  test("pancakeswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork("bsc");
    assert.stringEquals(V4PositionManagerAddress.pancakeSwap, "0x55f4c8abA71A1e923edC303eb4fEfF14608cC226");
  });

  test(
    "uniswap throws for unsupported network",
    () => {
      dataSourceMock.setNetwork("scroll");
      V4PositionManagerAddress.uniswap;
    },
    true,
  );
});
