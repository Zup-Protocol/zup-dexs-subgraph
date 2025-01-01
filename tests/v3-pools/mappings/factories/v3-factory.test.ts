import { ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, createMockedFunction, describe, test } from "matchstick-as";
import { handleV3PoolCreated } from "../../../../src/v3-pools/mappings/factories/v3-factory";
import { createPoolCreatedEvent, PoolCreatedEventParams } from "../../../event-creators";

describe("", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called,
      and the pool token0 entity doesn't exist yet,
      it should create the token0 entity with decimals
      got from the token contract`, () => {
    let expectedToken0Decimals = 32;

    let event = createPoolCreatedEvent();

    createMockedFunction(event.params.token0, "decimals", "decimals():(uint8)").returns([
      ethereum.Value.fromI32(expectedToken0Decimals),
    ]);

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token0.toHexString(), "decimals", expectedToken0Decimals.toString());
  });

  test(`When the handler is called,
    and the pool token1 entity doesn't exist yet,
    it should create the token1 entity with decimals
    got from the token contract`, () => {
    let expectedToken1Decimals = 3;

    let event = createPoolCreatedEvent();

    createMockedFunction(event.params.token1, "decimals", "decimals():(uint8)").returns([
      ethereum.Value.fromI32(expectedToken1Decimals),
    ]);

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token1.toHexString(), "decimals", expectedToken1Decimals.toString());
  });

  test(`When the handler is called,
    and the pool token1 entity doesn't exist yet,
    it should create the token1 entity with usd price
    as zero`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token1.toHexString(), "usdPrice", "0");
  });

  test(`When the handler is called,
    and the pool token0 entity doesn't exist yet,
    it should create the token0 entity with usd price
    as zero`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token0.toHexString(), "usdPrice", "0");
  });

  test(`When getting token0 decimals and the contract call revert, it should set the decimals to 0`, () => {
    let event = createPoolCreatedEvent();

    createMockedFunction(event.params.token0, "decimals", "decimals():(uint8)").reverts();

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token0.toHexString(), "decimals", "0");
  });

  test(`When getting token1 decimals and the contract call revert, it should set the decimals to 0`, () => {
    let event = createPoolCreatedEvent();

    createMockedFunction(event.params.token1, "decimals", "decimals():(uint8)").reverts();

    handleV3PoolCreated(event);

    assert.fieldEquals("Token", event.params.token1.toHexString(), "decimals", "0");
  });

  test(`When creating the new pool entity, the token 9 should be the token 0 of the event`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "token0", event.params.token0.toHexString());
  });

  test(`When creating the new pool entity, the token 1 should be the token 1 of the event`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "token1", event.params.token1.toHexString());
  });

  test(`When creating the new pool entity, the feeTier should be the fee tier from the event`, () => {
    let expectedEventFeeTier = 1246;
    let eventParams = new PoolCreatedEventParams();

    eventParams.setFeeTier(expectedEventFeeTier);
    let event = createPoolCreatedEvent(eventParams);

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "feeTier", expectedEventFeeTier.toString());
  });

  test(`When creating the new pool entity, the tickSpacing should be the tickSpacing from the event`, () => {
    let expectedEventTickSpacing = 875;
    let eventParams = new PoolCreatedEventParams();

    eventParams.setTickSpacing(expectedEventTickSpacing);
    let event = createPoolCreatedEvent(eventParams);

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "tickSpacing", expectedEventTickSpacing.toString());
  });

  test(`When creating the new pool entity, the totalValueLockedUSD should be 0`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "totalValueLockedUSD", "0");
  });

  test(`When creating the new pool entity, the totalValueLockedToken0 should be 0`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "totalValueLockedToken0", "0");
  });

  test(`When creating the new pool entity, the totalValueLockedToken1 should be 0`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "totalValueLockedToken1", "0");
  });

  test(`When creating the new pool entity, the createdAtTimestamp should be the block timestamp`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "createdAtTimestamp", event.block.timestamp.toString());
  });

  test(`When creating the new pool entity, the protocol should be an empty string`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", "");
  });

  test(`When the handler is called, a V3Pool template should be created`, () => {
    let event = createPoolCreatedEvent();

    handleV3PoolCreated(event);

    assert.dataSourceCount("V3Pool", 1);
  });

  test(`the handler should return the newly created pool entity`, () => {
    let event = createPoolCreatedEvent();

    let result = handleV3PoolCreated(event);

    assert.fieldEquals("Pool", result.id.toHexString(), "id", event.params.pool.toHexString());
  });
});
