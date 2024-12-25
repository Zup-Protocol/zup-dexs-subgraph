import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { Token } from "../../generated/schema";

export function tokenBaseAmount(token: Token): BigInt {
  return BigInt.fromU32(10).pow(token.decimals as u8);
}

export function formatFromTokenAmount(amount: BigInt, token: Token): BigDecimal {
  return amount.toBigDecimal().div(
    BigInt.fromU32(10)
      .pow(token.decimals as u8)
      .toBigDecimal(),
  );
}
