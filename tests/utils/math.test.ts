import { BigDecimal } from "@graphprotocol/graph-ts";
import { test } from "matchstick-as";
import { ZERO_BIG_DECIMAL } from "../../src/utils/constants";
import { safeDiv } from "../../src/utils/math";

test("When passing the `b` param as zero in safeDiv, instead of throwing, it should return zero", () => {
  const a = BigDecimal.fromString("1");
  const b = BigDecimal.fromString("0");

  const result = safeDiv(a, b);

  assert(result == ZERO_BIG_DECIMAL);
});

test("When passing the `a` and `b` param as non zero in safeDiv, it should simply divide them", () => {
  const a = BigDecimal.fromString("10");
  const b = BigDecimal.fromString("2");

  const result = safeDiv(a, b);

  assert(result == BigDecimal.fromString("5"));
});
