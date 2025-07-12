import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, createMockedFunction, describe, newMockEvent, test } from "matchstick-as";

import { handleV2PoolCreated } from "../../../../src/v2-pools/mappings/factory/v2-factory";
import { PoolMock, ProtocolMock, TokenMock } from "../../../mocks";

describe("", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called,
      and the pool token0 entity doesn't exist yet,
      it should create the token0 entity with decimals
      got from the token contract`, () => {
    let expectedToken0Decimals = 32;

    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    createMockedFunction(token0Address, "decimals", "decimals():(uint8)").returns([
      ethereum.Value.fromI32(expectedToken0Decimals),
    ]);

    createMockedFunction(token0Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
    createMockedFunction(token0Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);

    handleV2PoolCreated(
      event,
      token0Address,
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Token", token0Address.toHexString(), "decimals", expectedToken0Decimals.toString());
  });

  test(`When the handler is called,
    and the pool token1 entity doesn't exist yet,
    it should create the token1 entity with decimals
    got from the token contract`, () => {
    let expectedToken1Decimals = 3;

    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;

    createMockedFunction(token1Address, "decimals", "decimals():(uint8)").returns([
      ethereum.Value.fromI32(expectedToken1Decimals),
    ]);

    createMockedFunction(token0Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
    createMockedFunction(token1Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
    createMockedFunction(token0Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
    createMockedFunction(token1Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);

    handleV2PoolCreated(
      event,
      token0Address,
      token1Address,
      Address.fromBytes(pool.id),
      fee,

      new ProtocolMock(),
    );

    assert.fieldEquals("Token", token1Address.toHexString(), "decimals", expectedToken1Decimals.toString());
  });

  test(`When the handler is called,
    and the pool token1 entity doesn't exist yet,
    it should create the token1 entity with usd price
    as zero`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Token", Address.fromBytes(token1.id).toHexString(), "usdPrice", "0");
  });

  test(`When the handler is called,
    and the pool token0 entity doesn't exist yet,
    it should create the token0 entity with usd price
    as zero`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Token", Address.fromBytes(token0.id).toHexString(), "usdPrice", "0");
  });

  test(`When getting token0 decimals and the contract call revert, it should set the decimals to 0`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;

    createMockedFunction(token0Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
    createMockedFunction(token1Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
    createMockedFunction(token0Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
    createMockedFunction(token1Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);

    createMockedFunction(token0Address, "decimals", "decimals():(uint8)").reverts();

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token0Address.toHexString(), "decimals", "0");
  });

  test(`When getting token1 decimals and the contract call revert, it should set the decimals to 0`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;

    createMockedFunction(token1Address, "decimals", "decimals():(uint8)").reverts();

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token1Address.toHexString(), "decimals", "0");
  });

  test(`When creating the new pool entity, the token 0 should be the token 0 of the event`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals(
      "Pool",
      Address.fromBytes(pool.id).toHexString(),
      "token0",
      Address.fromBytes(token0.id).toHexString(),
    );
  });

  test(`When creating the new pool entity, the token 1 should be the token 1 of the event`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals(
      "Pool",
      Address.fromBytes(pool.id).toHexString(),
      "token1",
      Address.fromBytes(token1.id).toHexString(),
    );
  });

  test(`When creating the new pool entity, the feeTier should be the fee tier from the event`, () => {
    let expectedEventFeeTier = 1246;

    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      expectedEventFeeTier,
      new ProtocolMock(),
    );

    assert.fieldEquals(
      "Pool",
      Address.fromBytes(pool.id).toHexString(),
      "initialFeeTier",
      expectedEventFeeTier.toString(),
    );

    assert.fieldEquals(
      "Pool",
      Address.fromBytes(pool.id).toHexString(),
      "currentFeeTier",
      expectedEventFeeTier.toString(),
    );
  });

  test(`When creating the new pool entity, the totalValueLockedUSD should be 0`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Pool", Address.fromBytes(pool.id).toHexString(), "totalValueLockedUSD", "0");
  });

  test(`When creating the new pool entity, the totalValueLockedToken0 should be 0`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Pool", Address.fromBytes(pool.id).toHexString(), "totalValueLockedToken0", "0");
  });

  test(`When creating the new pool entity, the totalValueLockedToken1 should be 0`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Pool", Address.fromBytes(pool.id).toHexString(), "totalValueLockedToken1", "0");
  });

  test(`When creating the new pool entity, the createdAtTimestamp should be the block timestamp`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals(
      "Pool",
      Address.fromBytes(pool.id).toHexString(),
      "createdAtTimestamp",
      event.block.timestamp.toString(),
    );
  });

  test(`When the handler is called, and the token0 entity has not been created yet, it should create it
    with totalValuePooledUsd set to 0`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Token", Address.fromBytes(token0.id).toHexString(), "totalValuePooledUsd", "0");
  });

  test(`When the handler is called, and the token1 entity has not been created yet, it should create it
    with totalValuePooledUsd set to 0`, () => {
    let event = newMockEvent();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000019"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000009"));
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(
      event,
      Address.fromBytes(token0.id),
      Address.fromBytes(token1.id),
      Address.fromBytes(pool.id),
      fee,
      new ProtocolMock(),
    );

    assert.fieldEquals("Token", Address.fromBytes(token1.id).toHexString(), "totalValuePooledUsd", "0");
  });

  test(`when the handler is called and the token0 entity has not been created yet,
    it should get the symbol from the token0 contract`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;
    let tokenSymbol = "MOCK-21";

    createMockedFunction(token0Address, "symbol", "symbol():(string)").returns([
      ethereum.Value.fromString(tokenSymbol),
    ]);

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token0Address.toHexString(), "symbol", tokenSymbol);
  });

  test(`when the handler is called and the token1 entity has not been created yet,
    it should get the symbol from the token1 contract`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;
    let tokenSymbol = "MOCK-987361";

    createMockedFunction(token1Address, "symbol", "symbol():(string)").returns([
      ethereum.Value.fromString(tokenSymbol),
    ]);

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token1Address.toHexString(), "symbol", tokenSymbol);
  });

  test(`when the handler is called and the token0 entity has not been created yet,
    it should get the name from the token0 contract`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;
    let tokenName = "Token Mock 1";

    createMockedFunction(token0Address, "name", "name():(string)").returns([ethereum.Value.fromString(tokenName)]);

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token0Address.toHexString(), "name", tokenName);
  });

  test(`when the handler is called and the token1 entity has not been created yet,
    it should get the name from the token1 contract`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;
    let tokenName = "Token Mock 2";

    createMockedFunction(token1Address, "name", "name():(string)").returns([ethereum.Value.fromString(tokenName)]);

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Token", token1Address.toHexString(), "name", tokenName);
  });

  test(`When the handler is called, it should assign the correct pool type to the pool`, () => {
    let event = newMockEvent();
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000019");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000009");
    let pool = new PoolMock();
    let fee = 3000;

    handleV2PoolCreated(event, token0Address, token1Address, Address.fromBytes(pool.id), fee, new ProtocolMock());

    assert.fieldEquals("Pool", pool.id.toHexString(), "type", "V2");
  });
});
