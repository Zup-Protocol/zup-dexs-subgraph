import { Address, BigDecimal, BigInt, Bytes, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
import { Pool } from "../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../generated/templates/UniswapV3Pool/UniswapV3Pool";
import { ONE_HOUR_IN_SECONDS } from "../../../../src/utils/constants";
import { getPoolDailyDataId, getPoolHourlyDataId } from "../../../../src/utils/pool-utils";
import { formatFromTokenAmount } from "../../../../src/utils/token-utils";
import { handleV3PoolSwap } from "../../../../src/v3-pools/mappings/pool";
import { PoolDailyDataMock, PoolHourlyDataMock, PoolMock, TokenMock, V3PoolSettersMock } from "../../../mocks";

class SwapEventParams {
  pool: Address;
  sender: Address;
  recipient: Address;
  amount0: BigInt;
  amount1: BigInt;
  sqrtPriceX96: BigInt;
  liquidity: BigInt;
  tick: i32;

  constructor() {
    this.pool = Address.fromBytes(new PoolMock().id);
    this.sender = Address.fromString("0x0000000000000000000000000000000000000001");
    this.recipient = Address.fromString("0x0000000000000000000000000000000000000002");
    this.amount0 = BigInt.fromI32(0);
    this.amount1 = BigInt.fromI32(0);
    this.sqrtPriceX96 = BigInt.fromI32(0);
    this.liquidity = BigInt.fromI32(0);
    this.tick = 0;
  }
}

function createEvent(params: SwapEventParams = new SwapEventParams()): SwapEvent {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(params.sender)),
    new ethereum.EventParam("recipient", ethereum.Value.fromAddress(params.recipient)),
    new ethereum.EventParam("amount0", ethereum.Value.fromUnsignedBigInt(params.amount0)),
    new ethereum.EventParam("amount1", ethereum.Value.fromUnsignedBigInt(params.amount1)),
    new ethereum.EventParam("sqrtPriceX96", ethereum.Value.fromUnsignedBigInt(params.sqrtPriceX96)),
    new ethereum.EventParam("liquidity", ethereum.Value.fromUnsignedBigInt(params.liquidity)),
    new ethereum.EventParam("tick", ethereum.Value.fromI32(params.tick)),
  ];

  let event = new SwapEvent(
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

describe("v3-pool-swap", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`The handler should call 'setPricesForV3PoolWhitelistedTokens' with the correct parameters to update the pool assets prices`, () => {
    let eventParams = new SwapEventParams();
    let pool = new PoolMock();
    eventParams.sqrtPriceX96 = BigInt.fromI32(3432);
    eventParams.tick = 132;
    eventParams.pool = pool.id;

    let event = createEvent(eventParams);
    let v3PoolSetters = new V3PoolSettersMock();

    handleV3PoolSwap(event, v3PoolSetters);

    assert.assertTrue(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls.length > 0,
      "setPricesForV3PoolWhitelistedTokens have not been called",
    );

    assert.assertTrue(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolSqrtPriceX96 == event.params.sqrtPriceX96,
      "sqrtPriceX96 is not the same",
    );

    assert.assertTrue(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolEntity.id == event.address,
      "tick is not the same",
    );
  });

  test(`When the handler is called, and the token0 amount is a positive number,
    it should increase pool token0 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let eventParams = new SwapEventParams();
    let poolToken0TVLBefore = BigDecimal.fromString("325672.43");
    let amount0 = BigInt.fromI32(200).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    pool.token0 = token0.id;
    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.save();

    eventParams.pool = Address.fromBytes(pool.id);
    eventParams.amount0 = amount0;

    let event = createEvent(eventParams);

    handleV3PoolSwap(createEvent(eventParams));

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken0",
      poolToken0TVLBefore.plus(formatFromTokenAmount(eventParams.amount0, token0)).toString(),
    );
  });

  test(`When the handler is called, and the token0 amount is a negative number,
    it should decrease pool token0 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let eventParams = new SwapEventParams();
    let poolToken0TVLBefore = BigDecimal.fromString("325672.43");
    let amount0 = BigInt.fromI32(200)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    pool.token0 = token0.id;
    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.save();

    eventParams.pool = Address.fromBytes(pool.id);
    eventParams.amount0 = amount0;

    let event = createEvent(eventParams);

    handleV3PoolSwap(createEvent(eventParams));

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken0",
      poolToken0TVLBefore.minus(formatFromTokenAmount(eventParams.amount0.abs(), token0)).toString(),
    );
  });

  test(`When the handler is called, and the token1 amount is a positive number,
    it should increase pool token1 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let eventParams = new SwapEventParams();
    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");
    let amount1 = BigInt.fromI32(98762).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    eventParams.pool = Address.fromBytes(pool.id);
    eventParams.amount1 = amount1;

    let event = createEvent(eventParams);

    handleV3PoolSwap(createEvent(eventParams));

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken1",
      poolToken1TVLBefore.plus(formatFromTokenAmount(eventParams.amount1, token1)).toString(),
    );
  });

  test(`When the handler is called, and the token1 amount is a negative number,
    it should decrease the pool token1 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let eventParams = new SwapEventParams();
    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");
    let amount1 = BigInt.fromI32(98762)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    eventParams.pool = Address.fromBytes(pool.id);
    eventParams.amount1 = amount1;

    let event = createEvent(eventParams);

    handleV3PoolSwap(createEvent(eventParams));

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedToken1",
      poolToken1TVLBefore.minus(formatFromTokenAmount(eventParams.amount1.abs(), token1)).toString(),
    );
  });

  test(`When the handler is called, it should update the pool usd tvl after changing the tokens tvls`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
    token0.usdPrice = BigDecimal.fromString("3278");
    token1.usdPrice = BigDecimal.fromString("91");

    token0.save();
    token1.save();

    let eventParams = new SwapEventParams();
    let poolToken0TVLBefore = BigDecimal.fromString("91821.43");
    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");

    let amount0 = BigInt.fromI32(123).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1 = BigInt.fromI32(87532)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    pool.token1 = token1.id;
    pool.token0 = token0.id;

    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    eventParams.pool = Address.fromBytes(pool.id);
    eventParams.amount1 = amount1;
    eventParams.amount0 = amount0;

    let event = createEvent(eventParams);

    handleV3PoolSwap(createEvent(eventParams));

    assert.fieldEquals(
      "Pool",
      event.address.toHexString(),
      "totalValueLockedUSD",
      poolToken0TVLBefore
        .plus(formatFromTokenAmount(eventParams.amount0, token1))
        .times(token0.usdPrice)
        .plus(
          poolToken1TVLBefore.minus(formatFromTokenAmount(eventParams.amount1.abs(), token1)).times(token1.usdPrice),
        )
        .toString(),
    );
  });

  test(`When the user swap token0 by token1,
    the feesToken0 field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    eventParams.amount0 = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    eventParams.amount1 = BigInt.fromI32(199)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg(); // by making this negative, we can simulate a swap of token0 by token1, as token1 have benn removed from the pool

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFees = BigDecimal.fromString("12.3");

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFees;
    poolHourlyData.save();

    handleV3PoolSwap(event);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesToken0",
      currentFees
        .plus(
          formatFromTokenAmount(
            eventParams.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token0,
          ),
        )
        .toString(),
    );
  });

  test(`When the user swap token1 by token0,
    the feesToken1 field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    eventParams.amount1 = BigInt.fromI32(21785).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    eventParams.amount0 = BigInt.fromI32(199)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg(); // by making this negative, we can simulate a swap of token1 by token0, as token0 have benn removed from the pool

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFees = BigDecimal.fromString("1832.3");

    pool.feeTier = 100;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken1 = currentFees;
    poolHourlyData.save();

    handleV3PoolSwap(event);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesToken1",
      currentFees
        .plus(
          formatFromTokenAmount(
            eventParams.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token1,
          ),
        )
        .toString(),
    );
  });

  test(`When the user swap token0 by token1,
    the feesUSD field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("18.32");
    token1.usdPrice = BigDecimal.fromString("18271.97");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(190).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    eventParams.amount1 = BigInt.fromI32(2)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("2112.3");
    let currentFeesToken1 = BigDecimal.fromString("2.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));

    pool.feeTier = 1000;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    handleV3PoolSwap(event);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesUSD",
      currentFeesToken0
        .plus(token0ExpectedSwapFee)
        .times(token0.usdPrice)
        .plus(currentFeesToken1.times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When the user swap token1 by token0,
    the feesUSD field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(189269)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    eventParams.amount1 = BigInt.fromI32(198621).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));

    pool.feeTier = 50;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token1,
    );

    handleV3PoolSwap(event);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesUSD",
      currentFeesToken0
        .times(token0.usdPrice)
        .plus(currentFeesToken1.plus(token1ExpectedSwapFee).times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When the user swaps token1 by token0 multiple times in less than 1 hour,
    it should update the same pool hourly data id`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(189269)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    eventParams.amount1 = BigInt.fromI32(198621).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 4;

    pool.feeTier = 50;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token1,
    );

    for (let i = 0; i < swapTimes; i++) {
      handleV3PoolSwap(event);
    }

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesToken1",
      currentFeesToken1
        .plus(
          formatFromTokenAmount(
            event.params.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token0,
          ).times(BigDecimal.fromString(swapTimes.toString())),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesUSD",
      currentFeesToken0
        .times(token0.usdPrice)
        .plus(
          currentFeesToken1
            .plus(token1ExpectedSwapFee.times(BigDecimal.fromString(swapTimes.toString())))
            .times(token1.usdPrice),
        )
        .toString(),
    );
  });

  test(`When the user swaps token0 by token1 multiple times in less than 1 hour,
    it should update the same pool hourly data id`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    eventParams.amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = createEvent(eventParams);
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 5;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      handleV3PoolSwap(event);
    }

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesToken0",
      currentFeesToken0
        .plus(
          formatFromTokenAmount(
            event.params.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token0,
          ).times(BigDecimal.fromString(swapTimes.toString())),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesUSD",
      currentFeesToken1
        .times(token1.usdPrice)
        .plus(
          currentFeesToken0
            .plus(token0ExpectedSwapFee.times(BigDecimal.fromString(swapTimes.toString())))
            .times(token0.usdPrice),
        )
        .toString(),
    );
  });

  test(`When the user swaps token0 by token1 multiple times with more than 1 hour from
      each other, it should update differents pool hourly data entities(as it
      is a new hour, it should create a new entity for each hour and update it)`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    eventParams.amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = createEvent(eventParams);

    let hourIds: Bytes[] = [];
    let swapTimes = 5;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS));
      let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();

      assert.assertTrue(
        !hourIds.includes(Bytes.fromHexString(currentHourlyId)),
        "Hour Id should be different for every hour",
      );

      hourIds.push(Bytes.fromHexString(currentHourlyId));
      handleV3PoolSwap(event);

      assert.fieldEquals(
        "PoolHourlyData",
        currentHourlyId,
        "feesToken0",
        formatFromTokenAmount(
          event.params.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token0,
        ).toString(),
      );
    }
  });

  test(`When the user swaps token1 by token0 multiple times with more than 1 hour from
    each other, it should update differents pool hourly data entities(as it
    is a new hour, it should create a new entity for each hour and update it)`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("97918.32");
    token1.usdPrice = BigDecimal.fromString("0.997");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    eventParams.amount1 = BigInt.fromI32(89632).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = createEvent(eventParams);

    let hourIds: Bytes[] = [];
    let swapTimes = 5;

    pool.feeTier = 100;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS));
      let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();

      assert.assertTrue(
        !hourIds.includes(Bytes.fromHexString(currentHourlyId)),
        "Hour Id should be different for every hour",
      );

      hourIds.push(Bytes.fromHexString(currentHourlyId));
      handleV3PoolSwap(event);

      assert.fieldEquals(
        "PoolHourlyData",
        currentHourlyId,
        "feesToken1",
        formatFromTokenAmount(
          event.params.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token1,
        ).toString(),
      );
    }
  });

  test(`When the handler is called, it should call 'setPoolDailyDataTVL'
    to update the pool daily tvl with the correct params`, () => {
    let event = createEvent();
    let pool = PoolMock.loadMock();
    let v3PoolSetters = new V3PoolSettersMock();

    handleV3PoolSwap(event, v3PoolSetters);

    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls.length > 0, "setPoolDailyDataTVL not called");

    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls[0].poolEntity.id == pool.id, "pool is not the same");
    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls[0].event == event, "timestamp is not the same");
  });

  test(`When the user swaps token0 by token1 multiple times with less than 1 day from
    each other, it should update the same pool daily data entity`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    eventParams.amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = createEvent(eventParams);
    let poolDailyData = new PoolDailyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("1898.3");
    let currentFeesToken1 = BigDecimal.fromString("1.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentDailyId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 8;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolDailyData.feesToken0 = currentFeesToken0;
    poolDailyData.feesToken1 = currentFeesToken1;
    poolDailyData.feesUSD = currentUSDFees;
    poolDailyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 2));
      handleV3PoolSwap(event);
    }

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesToken0",
      currentFeesToken0
        .plus(
          formatFromTokenAmount(
            event.params.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token0,
          ).times(BigDecimal.fromString(swapTimes.toString())),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesUSD",
      currentFeesToken1
        .times(token1.usdPrice)
        .plus(
          currentFeesToken0
            .plus(token0ExpectedSwapFee.times(BigDecimal.fromString(swapTimes.toString())))
            .times(token0.usdPrice),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken0",
      Pool.load(event.address)!.totalValueLockedToken0.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken1",
      Pool.load(event.address)!.totalValueLockedToken1.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedUSD",
      Pool.load(event.address)!.totalValueLockedUSD.toString(),
    );
  });

  test(`When the user swaps token1 by token0 multiple times with less than 1 day from
    each other, it should update the same pool daily data entity`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    eventParams.amount1 = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = createEvent(eventParams);
    let poolDailyData = new PoolDailyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("1898.3");
    let currentFeesToken1 = BigDecimal.fromString("1.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentDailyId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 8;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolDailyData.feesToken0 = currentFeesToken0;
    poolDailyData.feesToken1 = currentFeesToken1;
    poolDailyData.feesUSD = currentUSDFees;
    poolDailyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      eventParams.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 2));
      handleV3PoolSwap(event);
    }

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesToken1",
      currentFeesToken1
        .plus(
          formatFromTokenAmount(
            event.params.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
            token1,
          ).times(BigDecimal.fromString(swapTimes.toString())),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesUSD",
      currentFeesToken0
        .times(token0.usdPrice)
        .plus(
          currentFeesToken1
            .plus(token1ExpectedSwapFee.times(BigDecimal.fromString(swapTimes.toString())))
            .times(token1.usdPrice),
        )
        .toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken0",
      Pool.load(event.address)!.totalValueLockedToken0.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken1",
      Pool.load(event.address)!.totalValueLockedToken1.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedUSD",
      Pool.load(event.address)!.totalValueLockedUSD.toString(),
    );
  });

  test(`When the user swaps token0 by token1 multiple times with more than 1 day from
    each other, it should update differents pool daily data entities(as it
    is a new day, it should create a new entity for each day and update it)`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    eventParams.amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = createEvent(eventParams);

    let dayIds: Bytes[] = [];
    let swapTimes = 5;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 24));
      let currentDayId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();

      assert.assertTrue(
        !dayIds.includes(Bytes.fromHexString(currentDayId)),
        "Day Id should be different for every hour",
      );

      dayIds.push(Bytes.fromHexString(currentDayId));
      handleV3PoolSwap(event);

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "feesToken0",
        formatFromTokenAmount(
          event.params.amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token0,
        ).toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken0",
        Pool.load(event.address)!.totalValueLockedToken0.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken1",
        Pool.load(event.address)!.totalValueLockedToken1.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedUSD",
        Pool.load(event.address)!.totalValueLockedUSD.toString(),
      );
    }
  });

  test(`When the user swaps token1 by token0 multiple times with more than 1 day from
    each other, it should update differents pool daily data entities(as it
    is a new day, it should create a new entity for each day and update it)`, () => {
    let eventParams = new SwapEventParams();
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    eventParams.amount0 = BigInt.fromI32(1765)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    eventParams.amount1 = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = createEvent(eventParams);

    let dayIds: Bytes[] = [];
    let swapTimes = 5;

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 24));
      let currentDayId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();

      assert.assertTrue(
        !dayIds.includes(Bytes.fromHexString(currentDayId)),
        "Day Id should be different for every hour",
      );

      dayIds.push(Bytes.fromHexString(currentDayId));
      handleV3PoolSwap(event);

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "feesToken1",
        formatFromTokenAmount(
          event.params.amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token1,
        ).toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken0",
        Pool.load(event.address)!.totalValueLockedToken0.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken1",
        Pool.load(event.address)!.totalValueLockedToken1.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedUSD",
        Pool.load(event.address)!.totalValueLockedUSD.toString(),
      );
    }
  });
});
