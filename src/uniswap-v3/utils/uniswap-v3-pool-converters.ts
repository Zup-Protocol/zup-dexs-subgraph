import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { Token } from "../../../generated/schema";
import { safeDiv } from "../../utils/math";
import { tokenBaseAmountBigDecimal } from "../../utils/token-utils";

class PriceResult {
  token0PerToken1: BigDecimal;
  token1PerToken0: BigDecimal;
}

export function sqrtPriceX96toPrice(sqrtPriceX96: BigInt, poolToken0: Token, poolToken1: Token): PriceResult {
  const Q192 = BigInt.fromI32(2).pow(192 as u8);
  const num = sqrtPriceX96.times(sqrtPriceX96).toBigDecimal();
  const denominator = BigDecimal.fromString(Q192.toString());

  const price1 = num
    .div(denominator)
    .times(tokenBaseAmountBigDecimal(poolToken0))
    .div(tokenBaseAmountBigDecimal(poolToken1));

  const price0 = safeDiv(BigDecimal.fromString("1"), price1);

  return { token0PerToken1: price0, token1PerToken0: price1 };
}
