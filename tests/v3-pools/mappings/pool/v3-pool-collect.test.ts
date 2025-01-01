import { Address, BigDecimal, BigInt, ethereum } from "@graphprotocol/graph-ts";

import { assert, newMockEvent, test } from "matchstick-as";
import { Pool, Token as TokenEntity } from "../../../../generated/schema";
import { Collect as CollectEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { getPoolDailyDataId } from "../../../../src/utils/pool-utils";
import { handleV3PoolCollect } from "../../../../src/v3-pools/mappings/pool";
import { PoolMock, TokenMock } from "../../../mocks";

export class CollectEventParams {
  pool: Address;
  owner: Address;
  recipient: Address;
  tickLower: i32;
  tickUpper: i32;
  amount0: BigInt;
  amount1: BigInt;

  constructor() {
    this.pool = Address.fromBytes(new PoolMock().id);
    this.owner = Address.fromString("0x0000000000000000000000000000000000000001");
    this.recipient = Address.fromString("0x0000000000000000000000000000000000000002");
    this.tickLower = 100;
    this.tickUpper = 200;
    this.amount0 = BigInt.fromI32(100);
    this.amount1 = BigInt.fromI32(200);
  }
}

function createCollectEvent(params: CollectEventParams = new CollectEventParams()): CollectEvent {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("owner", ethereum.Value.fromAddress(params.owner)),
    new ethereum.EventParam("recipient", ethereum.Value.fromAddress(params.recipient)),
    new ethereum.EventParam("tickLower", ethereum.Value.fromI32(params.tickLower)),
    new ethereum.EventParam("tickUpper", ethereum.Value.fromI32(params.tickUpper)),
    new ethereum.EventParam("amount0", ethereum.Value.fromUnsignedBigInt(params.amount0)),
    new ethereum.EventParam("amount1", ethereum.Value.fromUnsignedBigInt(params.amount1)),
  ];

  let event = new CollectEvent(
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

test(`When the handler is called, it should deduct the pool token0 tvl
    with the amount passed in the event`, () => {
  let eventParams = new CollectEventParams();

  let expectedAmount0Out = BigDecimal.fromString("9.325");
  let expectedPoolToken0TvlAfterDeduction = BigDecimal.fromString("21.3");

  let pool = PoolMock.load(eventParams.pool)!;
  let token0 = TokenEntity.load(pool.token0)!;

  pool.totalValueLockedToken0 = expectedAmount0Out.plus(expectedPoolToken0TvlAfterDeduction);
  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount0 = BigInt.fromString(
    expectedAmount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "Pool",
    event.address.toHexString(),
    "totalValueLockedToken0",
    expectedPoolToken0TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should deduct the pool token1 tvl
    with the amount passed in the event`, () => {
  let eventParams = new CollectEventParams();

  let expectedAmount1Out = BigDecimal.fromString("7.325");
  let expectedPoolToken1TvlAfterDeduction = BigDecimal.fromString("12.3");

  let pool = PoolMock.load(eventParams.pool)!;
  let token0 = TokenEntity.load(pool.token0)!;

  pool.totalValueLockedToken1 = expectedAmount1Out.plus(expectedPoolToken1TvlAfterDeduction);
  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount1 = BigInt.fromString(
    expectedAmount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "Pool",
    event.address.toHexString(),
    "totalValueLockedToken1",
    expectedPoolToken1TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should update the pool
    usd tvl after deducting the token amounts from the pool`, () => {
  let eventParams = new CollectEventParams();

  let amount0Out = BigDecimal.fromString("12.3");
  let amount1Out = BigDecimal.fromString("7.325");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.3");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("1.325");
  let token0USDPrice = BigDecimal.fromString("1200");
  let token1USDPrice = BigDecimal.fromString("10");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = PoolMock.load(eventParams.pool)!;

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  eventParams.amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "Pool",
    event.address.toHexString(),
    "totalValueLockedUSD",
    poolToken0TVLAfterDeduction
      .times(token0USDPrice)
      .plus(poolToken1TVLAfterDeduction.times(token1USDPrice))
      .toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl usd data`, () => {
  let eventParams = new CollectEventParams();

  let amount0Out = BigDecimal.fromString("12.3");
  let amount1Out = BigDecimal.fromString("7.325");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.3");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("1.325");
  let token0USDPrice = BigDecimal.fromString("1200");
  let token1USDPrice = BigDecimal.fromString("10");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = PoolMock.load(eventParams.pool)!;

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  eventParams.amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedUSD",
    Pool.load(event.address)!.totalValueLockedUSD.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token0 data`, () => {
  let eventParams = new CollectEventParams();

  let amount0Out = BigDecimal.fromString("12.3");
  let amount1Out = BigDecimal.fromString("7.325");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.3");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("1.325");
  let token0USDPrice = BigDecimal.fromString("1200");
  let token1USDPrice = BigDecimal.fromString("10");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = PoolMock.load(eventParams.pool)!;

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  eventParams.amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken0",
    Pool.load(event.address)!.totalValueLockedToken0.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token1 data`, () => {
  let eventParams = new CollectEventParams();

  let amount0Out = BigDecimal.fromString("12.3");
  let amount1Out = BigDecimal.fromString("7.325");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.3");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("1.325");
  let token0USDPrice = BigDecimal.fromString("1200");
  let token1USDPrice = BigDecimal.fromString("10");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = PoolMock.load(eventParams.pool)!;

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  eventParams.pool = Address.fromBytes(pool.id);
  eventParams.amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  eventParams.amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  let event = createCollectEvent(eventParams);
  handleV3PoolCollect(event);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken1",
    Pool.load(event.address)!.totalValueLockedToken1.toString(),
  );
});
