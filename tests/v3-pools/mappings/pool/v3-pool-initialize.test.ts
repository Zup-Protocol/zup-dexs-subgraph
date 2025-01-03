import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { Initialize as InitializeEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { handleV3PoolInitializeImpl } from "../../../../src/v3-pools/mappings/pool/v3-pool-initialize";
import { PoolMock, V3PoolSettersMock } from "../../../mocks";

class InitializeEventParams {
  pool: Address;
  sqrtPriceX96: BigInt;
  tick: i32;

  constructor() {
    this.sqrtPriceX96 = BigInt.fromU32(12);
    this.tick = 0;
    this.pool = new PoolMock().id;
  }
}

function createEvent(params: InitializeEventParams = new InitializeEventParams()): InitializeEvent {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("sqrtPriceX96", ethereum.Value.fromUnsignedBigInt(params.sqrtPriceX96)),
    new ethereum.EventParam("tick", ethereum.Value.fromI32(params.tick)),
  ];

  let event = new InitializeEvent(
    params.pool,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    eventParams,
    mockEvent.receipt,
  );

  return event;
}

test(`When the handler is called, it should call 'setPricesForV3PoolWhitelistedTokens'
    with the correct params`, () => {
  let v3PoolSetters = new V3PoolSettersMock();
  let pool = new PoolMock();
  let eventParams = new InitializeEventParams();
  eventParams.pool = Address.fromBytes(pool.id);

  let event = createEvent(eventParams);

  handleV3PoolInitializeImpl(event, v3PoolSetters);

  assert.assertTrue(
    v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls.length > 0,
    "setPricesForV3PoolWhitelistedTokens have not been called",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolEntity.id == pool.id,
    "pool is not the same",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolSqrtPriceX96 == eventParams.sqrtPriceX96,
    "sqrtPriceX96 is not the same",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolToken0Entity.id == pool.token0,
    "token0 is not the same",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolToken1Entity.id == pool.token1,
    "token1 is not the same",
  );
});
