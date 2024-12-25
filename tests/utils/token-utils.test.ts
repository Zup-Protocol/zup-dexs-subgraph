import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { Token } from "../../generated/schema";
import { formatFromTokenAmount, tokenBaseAmount } from "../../src/utils/token-utils";

test(`'tokenBaseAmount' should return the base amount
    for a token based on its decimals
    It is, when a token has 6 decimals, the base amount is 10^6
    `, () => {
  let token = new Token(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  token.decimals = 18;

  assert.bigIntEquals(tokenBaseAmount(token), BigInt.fromString("1000000000000000000"));
});

test(`'formatFromTokenAmount' should return the passed token amount
    as normal decimal number(e.g 1.0 instead of 1000000000000000000)
    `, () => {
  let token = new Token(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  token.decimals = 18;

  let formattedAmount = formatFromTokenAmount(BigInt.fromI64((1.76 * 10 ** 18) as i64), token);

  assert.assertTrue(formattedAmount == BigDecimal.fromString("1.76"));
});
