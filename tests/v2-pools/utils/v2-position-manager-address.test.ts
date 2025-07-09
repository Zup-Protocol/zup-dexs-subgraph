import { assert, dataSourceMock, test } from "matchstick-as";
import {
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../../src/common/constants";
import { V2PositionManagerAddress } from "../../../src/v2-pools/utils/v2-position-manager-address";

test("When calling 'uniswap' on Unichain, it should return the correct address", () => {
  dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x284f11109359a7e1306c3e447ef14d38400063ff");
});

test(
  "When calling 'uniswap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");

    V2PositionManagerAddress.uniswap;
  },
  true, // should fail flag
);

// Uniswap
test("When calling 'uniswap' on Unichain, it should return the correct address", () => {
  dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);
  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x284f11109359a7e1306c3e447ef14d38400063ff");
});

test("When calling 'uniswap' on Sepolia, it should return the correct address", () => {
  dataSourceMock.setNetwork(SEPOLIA_NETWORK_NAME);
  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0xeE567Fe1712Faf6149d80dA1E6934E354124CfE3");
});

test("When calling 'uniswap' on Mainnet, it should return the correct address", () => {
  dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D");
});

test("When calling 'uniswap' on BNB, it should return the correct address", () => {
  dataSourceMock.setNetwork(BNB_NETWORK_NAME);
  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x4752ba5DBc23f44D87826276BF6Fd6b1C372aD24");
});

test("When calling 'uniswap' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x4752ba5dbc23f44d87826276bf6fd6b1c372ad24");
});

test(
  "When calling 'uniswap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.uniswap;
  },
  true,
);

// SushiSwap
test("When calling 'sushiSwap' on Scroll, it should return the correct address", () => {
  dataSourceMock.setNetwork(SCROLL_NETWORK_NAME);
  let address = V2PositionManagerAddress.sushiSwap;
  assert.stringEquals(address, "0x9B3336186a38E1b6c21955d112dbb0343Ee061eE");
});

test("When calling 'sushiSwap' on Mainnet, it should return the correct address", () => {
  dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
  let address = V2PositionManagerAddress.sushiSwap;
  assert.stringEquals(address, "0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F");
});

test("When calling 'sushiSwap' on BNB, it should return the correct address", () => {
  dataSourceMock.setNetwork(BNB_NETWORK_NAME);
  let address = V2PositionManagerAddress.sushiSwap;
  assert.stringEquals(address, "0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506");
});

test("When calling 'sushiSwap' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.sushiSwap;
  assert.stringEquals(address, "0x6BDED42c6DA8FBf0d2bA55B2fa120C5e0c8D7891");
});

test(
  "When calling 'sushiSwap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.sushiSwap;
  },
  true,
);

// PancakeSwap
test("When calling 'pancakeSwap' on Mainnet, it should return the correct address", () => {
  dataSourceMock.setNetwork(MAINNET_NETWORK_NAME);
  let address = V2PositionManagerAddress.pancakeSwap;
  assert.stringEquals(address, "0xEfF92A263d31888d860bD50809A8D171709b7b1c");
});

test("When calling 'pancakeSwap' on BNB, it should return the correct address", () => {
  dataSourceMock.setNetwork(BNB_NETWORK_NAME);
  let address = V2PositionManagerAddress.pancakeSwap;
  assert.stringEquals(address, "0x10ED43C718714eb63d5aA57B78B54704E256024E");
});

test("When calling 'pancakeSwap' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.pancakeSwap;
  assert.stringEquals(address, "0x8cFe327CEc66d1C090Dd72bd0FF11d690C33a2Eb");
});

test(
  "When calling 'pancakeSwap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.pancakeSwap;
  },
  true,
);

// BaseSwap
test("When calling 'baseSwap' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.baseSwap;
  assert.stringEquals(address, "0x327Df1E6de05895d2ab08513aaDD9313Fe505d86");
});

test(
  "When calling 'baseSwap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.baseSwap;
  },
  true,
);

// AlienBase
test("When calling 'alienBase' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.alienBase;
  assert.stringEquals(address, "0x8c1A3cF8f83074169FE5D7aD50B978e1cD6b37c7");
});

test(
  "When calling 'alienBase' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.alienBase;
  },
  true,
);

// Aerodrome
test("When calling 'aerodrome' on Base, it should return the correct address", () => {
  dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  let address = V2PositionManagerAddress.aerodrome;
  assert.stringEquals(address, "0xcF77a3Ba9A5CA399B7c97c74d54e5b1Beb874E43");
});

test(
  "When calling 'aerodrome' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");
    V2PositionManagerAddress.aerodrome;
  },
  true,
);
