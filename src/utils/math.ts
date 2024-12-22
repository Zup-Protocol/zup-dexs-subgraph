import { BigDecimal } from "@graphprotocol/graph-ts";
import { ZERO_BIG_DECIMAL } from "./constants";

export function safeDiv(a: BigDecimal, b: BigDecimal): BigDecimal {
  if (b.equals(ZERO_BIG_DECIMAL)) return ZERO_BIG_DECIMAL;

  return a.div(b);
}
