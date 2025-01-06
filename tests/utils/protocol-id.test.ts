import { assert, test } from "matchstick-as";
import { ProtocolId } from "../../src/utils/protocol-id";

test("PancakeSwap Id should be correct", () => {
  const expectedId = "pancake-swap";
  const actualId = ProtocolId.pancakeSwap;

  assert.stringEquals(actualId, expectedId);
});

test("Uniswap Id should be correct", () => {
  const expectedId = "uniswap";
  const actualId = ProtocolId.uniswap;

  assert.stringEquals(actualId, expectedId);
});

test("NuriExchange Id should be correct", () => {
  const expectedId = "nuri-exchange";
  const actualId = ProtocolId.nuriExchange;

  assert.stringEquals(actualId, expectedId);
});

test("Zebra Id should be correct", () => {
  const expectedId = "zebra-protocol";
  const actualId = ProtocolId.zebra;

  assert.stringEquals(actualId, expectedId);
});