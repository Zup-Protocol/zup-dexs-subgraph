import { Address, BigInt, log } from "@graphprotocol/graph-ts";
import { describe, test } from "matchstick-as/assembly/index";
import { Token } from "../generated/schema";
import { sqrtPriceX96toPrice } from "../src/uniswap-v3/utils/uniswap-v3-pool-converters";

// Tests structure (matchstick-as >=0.5.0)
// https://thegraph.com/docs/en/developer/matchstick/#tests-structure-0-5-0

describe("Describe entity assertions", () => {
  test("dale", () => {
    let token0 = new Token(Address.empty());
    let token1 = new Token(Address.empty());

    token0.decimals = 8;
    token1.decimals = 18;

    let price = sqrtPriceX96toPrice(BigInt.fromString("42768586347934103071787668485563082"), token0, token1);
    log.info(`Price0: ${price.token0PerToken1}, Price1: ${price.token1PerToken0}`, []);
  });
});
