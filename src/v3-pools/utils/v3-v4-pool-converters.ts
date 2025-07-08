import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { Token } from "../../../generated/schema";
import { safeDiv } from "../../common/math";
import { tokenBaseAmount } from "../../common/token-utils";
import { PriceResult } from "../../common/types/price-result";

export function sqrtPriceX96toPrice(sqrtPriceX96: BigInt, poolToken0: Token, poolToken1: Token): PriceResult {
  const Q192 = BigInt.fromI32(2).pow(192 as u8);
  const num = sqrtPriceX96.times(sqrtPriceX96).toBigDecimal();
  const denominator = BigDecimal.fromString(Q192.toString());

  const price1 = num
    .div(denominator)
    .times(tokenBaseAmount(poolToken0).toBigDecimal())
    .div(tokenBaseAmount(poolToken1).toBigDecimal());

  const price0 = safeDiv(BigDecimal.fromString("1"), price1);

  return { token0PerToken1: price0, token1PerToken0: price1 };
}
