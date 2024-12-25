import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { Token } from "../../../generated/schema";
import { sqrtPriceX96toPrice } from "../../../src/uniswap-v3/utils/uniswap-v3-pool-converters";

test(`When passing a SqrtPriceX96 to 'sqrtPriceX96toPrice'
    it should return the pool token prices based on each other
    `, () => {
  let token0 = new Token(Address.fromString("0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984")); // UNI
  let token1 = new Token(Address.fromString("0xdAC17F958D2ee523a2206206994597C13D831ec7")); // USDT

  token0.decimals = 18;
  token1.decimals = 6;

  let sqrtPriceX96 = BigInt.fromString("294761047928095129673970");
  let expectedToken0PerToken1 = BigDecimal.fromString("0.07224686121416139299703842271375217");
  let expectedToken1PerToken0 = BigDecimal.fromString("13.84143176872002357773659389207896");

  let prices = sqrtPriceX96toPrice(sqrtPriceX96, token0, token1);

  assert.assertTrue(
    prices.token0PerToken1.equals(expectedToken0PerToken1),
    `token0PerToken1 is not correct, expected: ${expectedToken0PerToken1.toString()}, actual: ${prices.token0PerToken1.toString()}`,
  );

  assert.assertTrue(
    prices.token1PerToken0.equals(expectedToken1PerToken0),
    `token1PerToken0 is not correct, expected: ${expectedToken1PerToken0.toString()}, actual: ${prices.token1PerToken0.toString()}`,
  );
});
