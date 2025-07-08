import { BigDecimal } from "@graphprotocol/graph-ts";

export class PriceResult {
  token0PerToken1: BigDecimal;
  token1PerToken0: BigDecimal;
}
