import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { ZERO_BIG_DECIMAL } from "../../src/utils/constants";
import { hexToBigInt, mulDivRoundingUp, safeDiv } from "../../src/utils/math";

test("When passing the `b` param as zero in safeDiv, instead of throwing, it should return zero", () => {
  const a = BigDecimal.fromString("1");
  const b = BigDecimal.fromString("0");

  const result = safeDiv(a, b);

  assert.stringEquals(result.toString(), ZERO_BIG_DECIMAL.toString());
});

test("When passing the `a` and `b` param as non zero in safeDiv, it should simply divide them", () => {
  const a = BigDecimal.fromString("10");
  const b = BigDecimal.fromString("2");

  const result = safeDiv(a, b);

  assert.stringEquals(result.toString(), BigDecimal.fromString("5").toString());
});

test("when passing a hex, it should converts hex string to BigInt", () => {
  assert.stringEquals(hexToBigInt("0x10").toString(), BigInt.fromI32(16).toString());
});

test("mulDivRoundingUp rounds up when remainder exists", () => {
  const a = BigInt.fromI32(10);
  const b = BigInt.fromI32(10);
  const denominator = BigInt.fromI32(3);

  assert.i32Equals(mulDivRoundingUp(a, b, denominator).toI32(), 34);
});

test("mulDivRoundingUp does not round up when no remainder", () => {
  const a = BigInt.fromI32(12);
  const b = BigInt.fromI32(10);
  const denominator = BigInt.fromI32(4);

  assert.i32Equals(mulDivRoundingUp(a, b, denominator).toI32(), 30);
});
