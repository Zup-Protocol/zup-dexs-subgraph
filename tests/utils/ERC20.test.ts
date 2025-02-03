import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, createMockedFunction, test } from "matchstick-as";
import { ERC20 } from "../../src/utils/ERC20";

test("when calling `safe_decimals` and an error occur in the call, it should return 0", () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));

  createMockedFunction(erc20._address, "decimals", "decimals():(uint8)").reverts();
  let result = erc20.safe_decimals();

  assert.i32Equals(result, 0);
});

test("when calling `safe_decimals` it should return the token decimals got from the contract", () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));
  let expectedDecimals = 18;

  createMockedFunction(erc20._address, "decimals", "decimals():(uint8)").returns([
    ethereum.Value.fromI32(expectedDecimals),
  ]);
  let result = erc20.safe_decimals();

  assert.i32Equals(result, expectedDecimals);
});

test(`when calling 'safe_decimals' and the token decimals is very weird (like a really big number)
  it should return 0 to not cause any error`, () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));

  createMockedFunction(erc20._address, "decimals", "decimals():(uint8)").returns([
    ethereum.Value.fromI32(I32.MAX_VALUE),
  ]);

  let result = erc20.safe_decimals();

  assert.i32Equals(result, 0);
});

test(`when calling 'safe_symbol' and an error occur in the call, it should return an empty string`, () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));

  createMockedFunction(erc20._address, "symbol", "symbol():(string)").reverts();
  let result = erc20.safe_symbol();

  assert.stringEquals(result, "");
});

test(`when calling 'safe_symbol' it should return the token symbol got from the contract`, () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));
  let expectedSymbol = "DALE";

  createMockedFunction(erc20._address, "symbol", "symbol():(string)").returns([
    ethereum.Value.fromString(expectedSymbol),
  ]);
  let result = erc20.safe_symbol();

  assert.stringEquals(result, expectedSymbol);
});

test(`when calling 'safe_name' and an error occur in the call, it should return an empty string`, () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));

  createMockedFunction(erc20._address, "name", "name():(string)").reverts();
  let result = erc20.safe_name();

  assert.stringEquals(result, "");
});

test(`when calling 'safe_name' it should return the token name got from the contract`, () => {
  const erc20 = ERC20.bind(Address.fromString("0x0000000000000000000000000000000000000000"));
  let expectedName = "Dale Token Name";

  createMockedFunction(erc20._address, "name", "name():(string)").returns([ethereum.Value.fromString(expectedName)]);
  let result = erc20.safe_name();

  assert.stringEquals(result, expectedName);
});
