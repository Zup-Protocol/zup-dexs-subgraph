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
import { V3PositionManagerAddress } from "../../src/v3-pools/utils/v3-position-manager-address";
import { V4PositionManagerAddress } from "../../src/v4-pools/utils/v4-position-manager-address";

describe("V3PositionManagerAddress", () => {
  test("nuriExchange returns correct address for scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.nuriExchange, "0xAAA78E8C4241990B4ce159E105dA08129345946A");
  });

  test(
    "nuriExchange throws for unsupported network",
    () => {
      dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
      V3PositionManagerAddress.nuriExchange;
    },
    true,
  );

  test("aerodrome returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.aerodrome, "0x827922686190790b37229fd06084350E74485b72");
  });

  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xC36442b4a4522E871399CD717aBDD847Ab11FE88");
  });

  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x1238536071E1c677A632429e3655c799b22cDA52");
  });

  test("uniswap returns correct address for scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xB39002E4033b162fAc607fc3471E205FA2aE5967");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x03a520b32C04BF3bEEf7BEb72E919cf822Ed34f1");
  });

  test("uniswap returns correct address for polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xC36442b4a4522E871399CD717aBDD847Ab11FE88");
  });

  test("pancakeSwap returns correct address for all supported networks", () => {
    let networks = [MAINNET_NETWORK_NAME, SEPOLIA_NETWORK_NAME, SCROLL_NETWORK_NAME, BASE_NETWORK_NAME];
    for (let i = 0; i < networks.length; i++) {
      dataSourceMock.setNetwork(networks[i]);
      assert.stringEquals(V3PositionManagerAddress.pancakeSwap, "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364");
    }
  });

  test("sushiSwap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x2214A42d8e2A1d20635c2cb0664422c528B6A432");
  });

  test("sushiSwap returns correct address for scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x0389879e0156033202C44BF784ac18fC02edeE4f");
  });

  test("sushiSwap returns correct address for polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0xb7402ee99F0A008e461098AC3A27F4957Df89a40");
  });

  test("sushiSwap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0x80C7DD17B01855a6D2347444a0FCC36136a314de");
  });

  test("zebra returns correct address for scroll", () => {
    dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.zebra, "0x349B654dcbce53943C8e87F914F62ae9526C6681");
  });

  test("baseSwap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.baseSwap, "0xDe151D5c92BfAA288Db4B67c21CD55d5826bCc93");
  });

  test("AlienBase returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.alienBase, "0xB7996D1ECD07fB227e8DcA8CD5214bDfb04534E5");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x943e6e07a7e8e791dafc44083e54041d743c46e9");
  });

  test("uniswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.uniswap, "0x7b8A01B39D58278b5DE7e48c8449c9f4F5170613");
  });

  test("pancakeSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.pancakeSwap, "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364");
  });

  test("sushiSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0xF70c086618dcf2b1A461311275e00D6B722ef914");
  });

  test("squadSwap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.squadSwap, "0x501535ef0B92eE1df5C12f47720f1E479b1Db7b4");
  });

  test("unichainX returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V3PositionManagerAddress.unchainX, "0x854EC70B78933fAB3f95E5bC95D7Af72b62703dE");
  });

  test("uniswap returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xC36442b4a4522E871399CD717aBDD847Ab11FE88");
  });

  test("PancakeSwap returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.pancakeSwap, "0x46A15B0b27311cedF172AB29E4f4766fbE7F4364");
  });

  test("SushiSwap returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.sushiSwap, "0xF0cBce1942A68BEB3d1b73F0dd86C8DCc363eF49");
  });

  test("Camelot returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.camelot, "0x00c7f3082833e796A5b3e4Bd59f6642FF44DCD15");
  });

  test("Ramses returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.ramses, "0xAA277CB7914b7e5514946Da92cb9De332Ce610EF");
  });

  test("QuickSwap returns correct address for Polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.quickSwap, "0x8eF88E4c7CfbbaC1C163f7eddd4B578792201de6");
  });

  test("Uniswap returns correct address for OP", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.uniswap, "0xC36442b4a4522E871399CD717aBDD847Ab11FE88");
  });

  test("Velodrome returns correct address for OP", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.velodrome, "0x416b433906b1B72FA758e166e239c43d68dC6F29");
  });

  test("Velodrome returns correct address for Unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    assert.stringEquals(V3PositionManagerAddress.velodrome, "0x991d5546C4B442B4c5fdc4c8B8b8d131DEB24702");
  });

  test(
    "unsupportedProtocolNetworkError throws for unsupported network",
    () => {
      dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
      V3PositionManagerAddress.aerodrome;
    },
    true,
  );
});

describe("V4PositionManagerAddress", () => {
  test("uniswap returns correct address for sepolia", () => {
    dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x429ba70129df741B2Ca2a85BC3A2a3328e5c09b4");
  });

  test("uniswap returns correct address for unichain", () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x4529A01c7A0410167c5740C487A8DE60232617bf");
  });

  test("uniswap returns correct address for mainnet", () => {
    dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0xbD216513d74C8cf14cf4747E6AaA6420FF64ee9e");
  });

  test("uniswap returns correct address for base", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x7c5f5a4bbd8fd63184577525326123b519429bdc");
  });

  test("uniswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x7A4a5c919aE2541AeD11041A1AEeE68f1287f95b");
  });

  test("pancakeswap returns correct address for bnb", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    assert.stringEquals(V4PositionManagerAddress.pancakeSwap, "0x55f4c8abA71A1e923edC303eb4fEfF14608cC226");
  });

  test("UniswapV4 returns correct address for arbitrum", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    assert.stringEquals(V4PositionManagerAddress.uniswap, "0xd88F38F930b7952f2DB2432Cb002E7abbF3dD869");
  });

  test("UniswapV4 returns correct address for polygon", () => {
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);

    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x1Ec2eBf4F37E7363FDfe3551602425af0B3ceef9");
  });

  test("UniswapV4 returns correct address for optimism", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    assert.stringEquals(V4PositionManagerAddress.uniswap, "0x3C3Ea4B57a46241e54610e5f022E5c45859A1017");
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
