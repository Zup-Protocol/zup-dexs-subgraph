import { assert, test } from "matchstick-as";
import { ProtocolId } from "../../src/utils/protocol-id";

test("PancakeSwap V3 Id should be correct", () => {
  const expectedId = "pancake-swap-v3";
  const actualId = ProtocolId.pancakeSwapV3;

  assert.stringEquals(actualId, expectedId);
});

test("Uniswap V3 Id should be correct", () => {
  const expectedId = "uniswap-v3";
  const actualId = ProtocolId.uniswapV3;

  assert.stringEquals(actualId, expectedId);
});

test("NuriExchange V3 Id should be correct", () => {
  const expectedId = "nuri-exchange-v3";
  const actualId = ProtocolId.nuriExchangeV3;

  assert.stringEquals(actualId, expectedId);
});

test("Zebra v3 Id should be correct", () => {
  const expectedId = "zebra-protocol-v3";
  const actualId = ProtocolId.zebraV3;

  assert.stringEquals(actualId, expectedId);
});

test("SushiSwap V3 Id should be correct", () => {
  const expectedId = "sushi-swap-v3";
  const actualId = ProtocolId.sushiSwapV3;

  assert.stringEquals(actualId, expectedId);
});

test("OkuTrade V3 Id should be correct", () => {
  const expectedId = "oku-trade-v3";
  const actualId = ProtocolId.okuTradeV3;

  assert.stringEquals(actualId, expectedId);
});

test("BaseSwap V3 Id should be correct", () => {
  const expectedId = "base-swap-v3";
  const actualId = ProtocolId.baseSwapV3;

  assert.stringEquals(actualId, expectedId);
});

test("AlienBase V3 Id should be correct", () => {
  const expectedId = "alien-base-v3";
  const actualId = ProtocolId.alienBaseV3;

  assert.stringEquals(actualId, expectedId);
});

test("Aerodrome V3 Id should be correct", () => {
  const expectedId = "aerodrome-v3";
  const actualId = ProtocolId.aerodromeV3;

  assert.stringEquals(actualId, expectedId);
});

test("Uniswap V4 Id should be correct", () => {
  const expectedId = "uniswap-v4";
  const actualId = ProtocolId.uniswapV4;

  assert.stringEquals(actualId, expectedId);
});
