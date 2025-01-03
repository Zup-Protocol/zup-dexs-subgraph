import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import {
  NURI_EXCHANGE_ID,
  PANCAKE_SWAP_ID,
  UNISWAP_ID,
  ZERO_BIG_DECIMAL,
  ZERO_BIG_INT,
} from "../../src/utils/constants";

test("Zero big decimal should return zero as Big Decimal", () => {
  assert.assertTrue(ZERO_BIG_DECIMAL.equals(BigDecimal.fromString("0")));
});

test("Zero big int should return zero as big int", () => {
  assert.bigIntEquals(ZERO_BIG_INT, BigInt.fromU32(0));
});

test("Uniswap id should be correct", () => {
  assert.stringEquals(UNISWAP_ID, "uniswap");
});

test("Nuri exchange id should be correct", () => {
  assert.stringEquals(NURI_EXCHANGE_ID, "nuri-exchange");
});

test("Panckake swap id should be correct", () => {
  assert.stringEquals(PANCAKE_SWAP_ID, "pancake-swap");
});
