import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import {
  BASE_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  MAX_UINT256,
  ONE_BIG_INT,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
  ZERO_ADDRESS,
  ZERO_BIG_DECIMAL,
  ZERO_BIG_INT,
} from "../../src/utils/constants";

test("Zero big decimal should return zero as Big Decimal", () => {
  assert.assertTrue(ZERO_BIG_DECIMAL.equals(BigDecimal.fromString("0")));
});

test("Zero big int should return zero as big int", () => {
  assert.bigIntEquals(ZERO_BIG_INT, BigInt.fromU32(0));
});

test("'MAINNET_NETWORK_NAME' should return 'mainnet'", () => {
  assert.assertTrue(MAINNET_NETWORK_NAME == "mainnet");
});

test("'SCROLL_NETWORK_NAME' should return 'scroll'", () => {
  assert.assertTrue(SCROLL_NETWORK_NAME == "scroll");
});

test("'SEPOLIA_NETWORK_NAME' should return 'sepolia'", () => {
  assert.assertTrue(SEPOLIA_NETWORK_NAME == "sepolia");
});

test("BASE_NETWORK_NAME should return 'base'", () => {
  assert.assertTrue(BASE_NETWORK_NAME == "base");
});

test("MAX_UINT256 should return the correct value", () => {
  assert.stringEquals(
    BigInt.fromString("115792089237316195423570985008687907853269984665640564039457584007913129639935").toString(),
    MAX_UINT256.toString(),
  );
});

test("ZERO_ADDRESS should return the correct value", () => {
  assert.stringEquals("0x0000000000000000000000000000000000000000", ZERO_ADDRESS);
});

test("ONE_BIG_INT should return the correct value", () => {
  assert.bigIntEquals(BigInt.fromI32(1), ONE_BIG_INT);
});

test("Q96 should return the correct value", () => {
  assert.bigIntEquals(BigInt.fromI32(2).pow(96), BigInt.fromI32(2).pow(96));
});

test("UNICHAIN_NAME should return the correct value", () => {
  assert.assertTrue(UNICHAIN_NETWORK_NAME == "unichain");
});
