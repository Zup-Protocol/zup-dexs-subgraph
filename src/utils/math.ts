import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { ONE_BIG_INT, ZERO_BIG_DECIMAL } from "./constants";

export function safeDiv(a: BigDecimal, b: BigDecimal): BigDecimal {
  if (b.equals(ZERO_BIG_DECIMAL)) return ZERO_BIG_DECIMAL;

  return a.div(b);
}

export function hexToBigInt(hex: string): BigInt {
  if (hex.startsWith("0x")) {
    hex = hex.slice(2);
  }
  let decimal = "0";
  for (let i = 0; i < hex.length; i++) {
    decimal = BigInt.fromString(decimal)
      .times(BigInt.fromI32(16))
      .plus(BigInt.fromI32(parseInt(hex.charAt(i), 16) as i32))
      .toString();
  }
  return BigInt.fromString(decimal);
}

export function mulDivRoundingUp(a: BigInt, b: BigInt, denominator: BigInt): BigInt {
  const product = a.times(b);
  let result = product.div(denominator);

  if (!product.mod(denominator).isZero()) result = result.plus(ONE_BIG_INT);
  return result;
}
