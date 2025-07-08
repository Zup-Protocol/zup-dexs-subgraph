import { BigDecimal } from "@graphprotocol/graph-ts";
import { safeDiv } from "../../common/math";
import { PriceResult } from "../../common/types/price-result";

export function poolReservesToPrice(
  token0ReserveFormatted: BigDecimal,
  token1ReserveFormatted: BigDecimal,
): PriceResult {
  let price = safeDiv(token0ReserveFormatted, token1ReserveFormatted);

  let token0PerToken1Price = price;
  let token1PerToken0Price = safeDiv(BigDecimal.fromString("1"), price);

  return { token0PerToken1: token0PerToken1Price, token1PerToken0: token1PerToken0Price };
}
