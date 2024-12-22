import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { Token } from "../../generated/schema";

export function tokenBaseAmountBigDecimal(token: Token): BigDecimal {
  return BigInt.fromU32(10)
    .pow(token.decimals as u8)
    .toBigDecimal();
}
