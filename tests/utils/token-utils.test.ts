import { Address, BigDecimal, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, createMockedFunction, test } from "matchstick-as";
import { Token } from "../../generated/schema";
import { ZERO_ADDRESS } from "../../src/utils/constants";
import { CurrentNetwork } from "../../src/utils/current-network";
import { formatFromTokenAmount, getOrCreateTokenEntity, tokenBaseAmount } from "../../src/utils/token-utils";
import { TokenMock } from "../mocks";

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

test("`getOrCreateTokenEntity` should return a already created token entity if the passed id exists", () => {
  let token = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  token.decimals = 18;
  token.name = "ETHER";
  token.symbol = "ETH";
  token.usdPrice = BigDecimal.fromString("321.2");
  token.totalValuePooledUsd = BigDecimal.fromString("9876");
  token.save();

  let tokenGot = getOrCreateTokenEntity(Address.fromBytes(token.id));

  assert.i32Equals(tokenGot.decimals, token.decimals);
  assert.stringEquals(tokenGot.usdPrice.toString(), token.usdPrice.toString());
  assert.stringEquals(tokenGot.name.toString(), token.name.toString());
  assert.stringEquals(tokenGot.symbol.toString(), token.symbol.toString());
});

test(`'getOrCreateTokenEntity' should return a new token entity if the passed id does not exist,
  and get the params as name, symbol and decimals from the contract`, () => {
  let tokenAddress = Address.fromHexString("0x0000000000000000000000000000000000000321");
  let expectedDecimals = 11;
  let expectedSymbol = "DALE_SUMVOL";
  let expectedName = "DALE_NOMNR";

  createMockedFunction(Address.fromBytes(tokenAddress), "decimals", "decimals():(uint8)").returns([
    ethereum.Value.fromI32(expectedDecimals),
  ]);
  createMockedFunction(Address.fromBytes(tokenAddress), "symbol", "symbol():(string)").returns([
    ethereum.Value.fromString(expectedSymbol),
  ]);
  createMockedFunction(Address.fromBytes(tokenAddress), "name", "name():(string)").returns([
    ethereum.Value.fromString(expectedName),
  ]);

  let tokenGot = getOrCreateTokenEntity(Address.fromBytes(tokenAddress));

  assert.i32Equals(tokenGot.decimals, expectedDecimals);
  assert.stringEquals(tokenGot.symbol, expectedSymbol);
  assert.stringEquals(tokenGot.name, expectedName);
  assert.stringEquals(tokenGot.usdPrice.toString(), "0");
  assert.stringEquals(tokenGot.totalValuePooledUsd.toString(), "0");
  assert.stringEquals(tokenGot.totalTokenPooledAmount.toString(), "0");
});

test(`'getOrCreateTokenEntity' should return a new token entity if the passed id does not exist,
  and if the token is the native token(zero address), it should get the params as name, symbol and decimals
  from the defined native token for the network`, () => {
  let tokenGot = getOrCreateTokenEntity(Address.fromString(ZERO_ADDRESS));
  let nativeToken = CurrentNetwork.nativeToken();

  assert.i32Equals(tokenGot.decimals, nativeToken.decimals);
  assert.stringEquals(tokenGot.symbol, nativeToken.symbol);
  assert.stringEquals(tokenGot.name, nativeToken.name);
  assert.stringEquals(tokenGot.usdPrice.toString(), "0");
  assert.stringEquals(tokenGot.totalValuePooledUsd.toString(), "0");
  assert.stringEquals(tokenGot.totalTokenPooledAmount.toString(), "0");
});
