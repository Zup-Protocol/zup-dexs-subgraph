import { Address, BigInt } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { ZERO_BIG_DECIMAL } from "../../../../src/common/constants";
import { PoolType } from "../../../../src/common/types/pool-type";
import { handleV4PoolInitialize } from "../../../../src/v4-pools/mappings/pool-manager/v4-pool-initialize";
import { PoolMock, ProtocolMock, TokenMock, V4PoolMock } from "../../../mocks";

test("When calling the handler, it should correctly assign the protocol to the pool", () => {
  let expectedProtocolId = "some-random-id-tot-te";
  let event = newMockEvent();
  let pool = new PoolMock();
  let v4Pool = new V4PoolMock();
  let protocol = new ProtocolMock(expectedProtocolId);

  handleV4PoolInitialize(
    event,
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "protocol", expectedProtocolId);
});

test("When calling the handler, it should correctly assign the created timestamp to the pool", () => {
  let mockEvent = newMockEvent();

  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    mockEvent,
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "createdAtTimestamp", mockEvent.block.timestamp.toString());
});

test("When calling the handler, it should correctly assign the token0 to the pool", () => {
  let token0Address = Address.fromString("0x0000000000000000000000000000000000000119");
  let pool = new PoolMock();
  let v4Pool = new V4PoolMock();
  let protocol = new ProtocolMock();
  let token0 = new TokenMock(Address.fromBytes(token0Address));

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(token0.id),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "token0", token0Address.toHexString());
});

test("When calling the handler, it should correctly assign the token1 to the pool", () => {
  let token1Address = Address.fromString("0x0000000000000000000000000000000000012379");
  let pool = new PoolMock();
  let v4Pool = new V4PoolMock();
  let protocol = new ProtocolMock();
  let token1 = new TokenMock(Address.fromBytes(token1Address));

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(token1.id),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "token1", token1Address.toHexString());
});

test("When calling the handler, it should correctly assign the fee tier to the pool", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let feeTier = 7283;
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    feeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", feeTier.toString());
  assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", feeTier.toString());
});

test("When calling the handler, it should correctly assign the tick spacing to the pool", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let tickSpacing = 32;
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("V4Pool", pool.id.toHexString(), "tickSpacing", tickSpacing.toString());
});

test("When calling the handler, it should correctly assign the tick to the pool", () => {
  let pool = new PoolMock();
  let v4Pool = new V4PoolMock();
  let protocol = new ProtocolMock();
  let tick = 8976;

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    BigInt.fromI32(tick),
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("V4Pool", pool.id.toHexString(), "tick", tick.toString());
});

test("When calling the handler, it should correctly assign the sqrt price to the pool", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let sqrtPriceX96 = 998896678;
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    BigInt.fromI32(sqrtPriceX96),
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("V4Pool", pool.id.toHexString(), "sqrtPriceX96", sqrtPriceX96.toString());
});

test("When calling the handler, it should set totalValueLockedUSD to ZERO_BIG_DECIMAL", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "totalValueLockedUSD", ZERO_BIG_DECIMAL.toString());
});

test("When calling the handler, it should set totalValueLockedToken0 to ZERO_BIG_DECIMAL", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "totalValueLockedToken0", ZERO_BIG_DECIMAL.toString());
});

test("When calling the handler, it should set totalValueLockedToken1 to ZERO_BIG_DECIMAL", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "totalValueLockedToken1", ZERO_BIG_DECIMAL.toString());
});

test("When calling the handler, it should set type to PoolType.V4", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(v4Pool.hooks),
    protocol,
  );

  assert.fieldEquals("Pool", pool.id.toHexString(), "type", PoolType.V4.toString());
});

test("When calling the handler, it should set the v4 hooks passed to the pool", () => {
  let pool = new PoolMock();
  let protocol = new ProtocolMock();
  let v4Pool = new V4PoolMock();
  let hooksAddress = Address.fromString("0x1240000000000000000000000000000000000001");

  handleV4PoolInitialize(
    newMockEvent(),
    pool.id,
    Address.fromBytes(pool.token0),
    Address.fromBytes(pool.token1),
    pool.currentFeeTier,
    v4Pool.tickSpacing,
    v4Pool.tick,
    v4Pool.sqrtPriceX96,
    Address.fromBytes(hooksAddress),
    protocol,
  );

  assert.fieldEquals("V4Pool", pool.id.toHexString(), "hooks", hooksAddress.toHexString());
});
