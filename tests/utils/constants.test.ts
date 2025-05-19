import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import {
  BASE_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  SCROLL_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
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
