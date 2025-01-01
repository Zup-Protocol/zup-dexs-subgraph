import { Address, BigDecimal, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
import { Mint as MintEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { getPoolDailyDataId } from "../../../../src/utils/pool-utils";
import { formatFromTokenAmount } from "../../../../src/utils/token-utils";
import { handleV3PoolMint } from "../../../../src/v3-pools/mappings/pool";
import { PoolMock, TokenMock } from "../../../mocks";

class MintEventParams {
  pool: Address;
  sender: Address;
  owner: Address;
  tickLower: i32;
  tickUpper: i32;
  amount: BigInt;
  amount0: BigInt;
  amount1: BigInt;

  constructor() {
    this.pool = Address.fromBytes(new PoolMock().id);
    this.sender = Address.fromString("0x0000000000000000000000000000000000000001");
    this.owner = Address.fromString("0x0000000000000000000000000000000000000001");
    this.tickLower = 0;
    this.tickUpper = 0;
    this.amount = BigInt.fromI32(0);
    this.amount0 = BigInt.fromI32(0);
    this.amount1 = BigInt.fromI32(0);
  }
}

function createEvent(params: MintEventParams = new MintEventParams()): MintEvent {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(params.sender)),
    new ethereum.EventParam("owner", ethereum.Value.fromAddress(params.owner)),
    new ethereum.EventParam("tickLower", ethereum.Value.fromI32(params.tickLower)),
    new ethereum.EventParam("tickUpper", ethereum.Value.fromI32(params.tickUpper)),
    new ethereum.EventParam("amount", ethereum.Value.fromUnsignedBigInt(params.amount)),
    new ethereum.EventParam("amount0", ethereum.Value.fromUnsignedBigInt(params.amount0)),
    new ethereum.EventParam("amount1", ethereum.Value.fromUnsignedBigInt(params.amount1)),
  ];

  let event = new MintEvent(
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

describe("v3-pool-mint", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called, it should increase the token0 tvl with the event amount`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token1.decimals = 18;

    token0.save();
    token1.save();

    let amount0In = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let initialPoolToken0Tvl = BigDecimal.fromString("24");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount0 = amount0In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken0",
      initialPoolToken0Tvl.plus(formatFromTokenAmount(amount0In, token0)).toString(),
    );
  });

  test(`When the handler is called, it should increase the token1 tvl with the event amount`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token1.decimals = 18;

    token0.save();
    token1.save();

    let amount1In = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let initialPoolToken1Tvl = BigDecimal.fromString("98");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount1 = amount1In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken1",
      initialPoolToken1Tvl.plus(formatFromTokenAmount(amount1In, token0)).toString(),
    );
  });

  test(`When the handler is called, it should update the pool usd tvl with the new tokens amounts`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token0.usdPrice = BigDecimal.fromString("3400");

    token1.decimals = 18;
    token1.usdPrice = BigDecimal.fromString("10");

    token0.save();
    token1.save();

    let amount0In = BigInt.fromI32(1).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1In = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let initialPoolToken0Tvl = BigDecimal.fromString("982");
    let initialPoolToken1Tvl = BigDecimal.fromString("12");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount0 = amount0In;
    eventParams.amount1 = amount1In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedUSD",
      initialPoolToken0Tvl
        .plus(formatFromTokenAmount(amount0In, token0))
        .times(token0.usdPrice)
        .plus(initialPoolToken1Tvl.plus(formatFromTokenAmount(amount1In, token1)).times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When the handler is called, it should update the pool daily usd tvl data with the new tokens amounts`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token0.usdPrice = BigDecimal.fromString("3400");

    token1.decimals = 18;
    token1.usdPrice = BigDecimal.fromString("10");

    token0.save();
    token1.save();

    let amount0In = BigInt.fromI32(1).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1In = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let initialPoolToken0Tvl = BigDecimal.fromString("982");
    let initialPoolToken1Tvl = BigDecimal.fromString("12");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount0 = amount0In;
    eventParams.amount1 = amount1In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "PoolDailyData",
      getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
      "totalValueLockedUSD",
      initialPoolToken0Tvl
        .plus(formatFromTokenAmount(amount0In, token0))
        .times(token0.usdPrice)
        .plus(initialPoolToken1Tvl.plus(formatFromTokenAmount(amount1In, token1)).times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When the handler is called, it should update the pool daily token0 tvl data with the event amount`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token1.decimals = 18;

    token0.save();
    token1.save();

    let amount0In = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let initialPoolToken0Tvl = BigDecimal.fromString("24");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount0 = amount0In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "PoolDailyData",
      getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
      "totalValueLockedToken0",
      initialPoolToken0Tvl.plus(formatFromTokenAmount(amount0In, token0)).toString(),
    );
  });

  test(`When the handler is called, it should update the daily pool token1 tvl data with the event amount`, () => {
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.decimals = 18;
    token1.decimals = 18;

    token0.save();
    token1.save();

    let amount1In = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let initialPoolToken1Tvl = BigDecimal.fromString("98");

    let pool = PoolMock.loadMock();
    let eventParams = new MintEventParams();
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    eventParams.amount1 = amount1In;
    eventParams.pool = Address.fromBytes(pool.id);

    let event = createEvent(eventParams);

    handleV3PoolMint(event);

    assert.fieldEquals(
      "PoolDailyData",
      getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
      "totalValueLockedToken1",
      initialPoolToken1Tvl.plus(formatFromTokenAmount(amount1In, token0)).toString(),
    );
  });
});
