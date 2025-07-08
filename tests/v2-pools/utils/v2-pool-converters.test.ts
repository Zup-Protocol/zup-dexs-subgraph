import { BigDecimal } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { poolReservesToPrice } from "../../../src/v2-pools/utils/v2-pool-converters";

test(`When calling 'poolReservesToPrice' it should correctly calculate
    the price of token0 in terms of token1 and vice versa, based on the
    v2 pool price calculation math`, () => {
  let prices = poolReservesToPrice(BigDecimal.fromString("1000"), BigDecimal.fromString("2000"));

  assert.stringEquals(prices.token0PerToken1.toString(), "0.5");
  assert.stringEquals(prices.token1PerToken0.toString(), "2");
});
