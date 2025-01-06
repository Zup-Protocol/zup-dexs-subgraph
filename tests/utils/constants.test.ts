import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { ZERO_BIG_DECIMAL, ZERO_BIG_INT } from "../../src/utils/constants";

test("Zero big decimal should return zero as Big Decimal", () => {
  assert.assertTrue(ZERO_BIG_DECIMAL.equals(BigDecimal.fromString("0")));
});

test("Zero big int should return zero as big int", () => {
  assert.bigIntEquals(ZERO_BIG_INT, BigInt.fromU32(0));
});
