import { Address, BigDecimal, BigInt, Bytes } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
import { Pool } from "../../../../generated/schema";
import { ONE_HOUR_IN_SECONDS } from "../../../../src/utils/constants";
import { getPoolDailyDataId, getPoolHourlyDataId } from "../../../../src/utils/pool-utils";
import { formatFromTokenAmount } from "../../../../src/utils/token-utils";

import { handleV3PoolSwap, handleV3PoolSwapImpl } from "../../../../src/v3-pools/mappings/pool/v3-pool-swap";
import { PoolDailyDataMock, PoolHourlyDataMock, PoolMock, TokenMock, V3PoolSettersMock } from "../../../mocks";

describe("v3-pool-swap", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`The handler should call 'setPricesForV3PoolWhitelistedTokens' with the correct parameters to update the pool assets prices`, () => {
    let pool = new PoolMock();
    let sqrtPriceX96 = BigInt.fromI32(3432);

    let amount0 = BigInt.fromI32(100);
    let amount1 = BigInt.fromI32(200);

    let event = newMockEvent();
    let v3PoolSetters = new V3PoolSettersMock();

    handleV3PoolSwapImpl(event, pool, new TokenMock(), new TokenMock(), amount0, amount1, sqrtPriceX96, v3PoolSetters);

    assert.assertTrue(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls.length > 0,
      "setPricesForV3PoolWhitelistedTokens have not been called",
    );

    assert.bigIntEquals(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolSqrtPriceX96,
      sqrtPriceX96,
      "sqrtPriceX96 is not the same",
    );

    assert.bytesEquals(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolEntity.id,
      pool.id,
      "Pool is not the same",
    );

    assert.bytesEquals(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolToken0Entity.id,
      pool.token0,
      "Token0 is not the same",
    );

    assert.bytesEquals(
      v3PoolSetters.setPricesForV3PoolWhitelistedTokensCalls[0].poolToken1Entity.id,
      pool.token1,
      "Token1 is not the same",
    );
  });

  test(`When the handler is called, and the token0 amount is a positive number,
    it should increase pool token0 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let poolToken0TVLBefore = BigDecimal.fromString("325672.43");
    let amount0 = BigInt.fromI32(200).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1 = BigInt.fromI32(0);
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.token0 = token0.id;
    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.save();

    let event = newMockEvent();

    handleV3PoolSwap(event, pool, token0, new TokenMock(), amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken0",
      poolToken0TVLBefore.plus(formatFromTokenAmount(amount0, token0)).toString(),
    );
  });

  test(`When the handler is called, and the token0 amount is a negative number,
    it should decrease pool token0 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let poolToken0TVLBefore = BigDecimal.fromString("325672.43");
    let amount0 = BigInt.fromI32(200)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();
    let amount1 = BigInt.fromI32(0);
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.token0 = token0.id;
    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.save();

    let event = newMockEvent();

    handleV3PoolSwap(event, pool, token0, new TokenMock(), amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken0",
      poolToken0TVLBefore.minus(formatFromTokenAmount(amount0.abs(), token0)).toString(),
    );
  });

  test(`When the handler is called, and the token1 amount is a positive number,
    it should increase pool token1 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");
    let amount0 = BigInt.fromI32(0);
    let amount1 = BigInt.fromI32(98762).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    let event = newMockEvent();

    handleV3PoolSwap(event, pool, new TokenMock(), token1, amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken1",
      poolToken1TVLBefore.plus(formatFromTokenAmount(amount1, token1)).toString(),
    );
  });

  test(`When the handler is called, and the token1 amount is a negative number,
    it should decrease the pool token1 tvl by the amount passed in the event`, () => {
    let pool = PoolMock.loadMock();
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");
    let amount0 = BigInt.fromI32(0);
    let amount1 = BigInt.fromI32(98762)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    let event = newMockEvent();

    handleV3PoolSwap(event, pool, new TokenMock(), token1, amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken1",
      poolToken1TVLBefore.minus(formatFromTokenAmount(amount1.abs(), token1)).toString(),
    );
  });

  test(`When the handler is called, it should update the pool usd tvl after changing the tokens tvls`, () => {
    let pool = new PoolMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
    token0.usdPrice = BigDecimal.fromString("3278");
    token1.usdPrice = BigDecimal.fromString("91");

    token0.save();
    token1.save();

    let poolToken0TVLBefore = BigDecimal.fromString("91821.43");
    let poolToken1TVLBefore = BigDecimal.fromString("121320.43");

    let amount0 = BigInt.fromI32(123).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1 = BigInt.fromI32(87532)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.token1 = token1.id;
    pool.token0 = token0.id;

    pool.totalValueLockedToken0 = poolToken0TVLBefore;
    pool.totalValueLockedToken1 = poolToken1TVLBefore;
    pool.save();

    let event = newMockEvent();

    handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedUSD",
      poolToken0TVLBefore
        .plus(formatFromTokenAmount(amount0, token1))
        .times(token0.usdPrice)
        .plus(poolToken1TVLBefore.minus(formatFromTokenAmount(amount1.abs(), token1)).times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When the user swap token0 by token1,
    the feesToken0 field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let amount0 = BigInt.fromI32(32).times(BigInt.fromI32(10).pow(token0.decimals as u8));
    let amount1 = BigInt.fromI32(199)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg(); // by making this negative, we can simulate a swap of token0 by token1, as token1 have benn removed from the pool

    let sqrtPriceX96 = BigInt.fromI32(3432);
    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFees = BigDecimal.fromString("12.3");

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFees;
    poolHourlyData.save();

    handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesToken0",
      currentFees
        .plus(formatFromTokenAmount(amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token0))
        .toString(),
    );
  });

  test(`When the user swap token1 by token0,
    the feesToken1 field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    let amount1 = BigInt.fromI32(21785).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let amount0 = BigInt.fromI32(199)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg(); // by making this negative, we can simulate a swap of token1 by token0, as token0 have benn removed from the pool

    let sqrtPriceX96 = BigInt.fromI32(3432);

    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFees = BigDecimal.fromString("1832.3");

    pool.feeTier = 100;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken1 = currentFees;
    poolHourlyData.save();

    handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

    assert.fieldEquals(
      "PoolHourlyData",
      getPoolHourlyDataId(event.block.timestamp, pool).toHexString(),
      "feesToken1",
      currentFees
        .plus(formatFromTokenAmount(amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token1))
        .toString(),
    );
  });

  test(`When the user swap token0 by token1,
    the feesUSD field in the pool hourly data
    should be updated, suming up the swap fee`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("18.32");
    token1.usdPrice = BigDecimal.fromString("18271.97");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(190).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    let amount1 = BigInt.fromI32(2)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("2112.3");
    let currentFeesToken1 = BigDecimal.fromString("2.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.feeTier = 1000;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

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
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(189269)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    let amount1 = BigInt.fromI32(198621).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let sqrtPriceX96 = BigInt.fromI32(3432);

    pool.feeTier = 50;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token1,
    );

    handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

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
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(189269)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    let amount1 = BigInt.fromI32(198621).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 4;
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    pool.feeTier = 50;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token1,
    );

    for (let i = 0; i < swapTimes; i++) {
      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);
    }

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesToken1",
      currentFeesToken1
        .plus(
          formatFromTokenAmount(amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token0).times(
            BigDecimal.fromString(swapTimes.toString()),
          ),
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
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    let amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = newMockEvent();
    let poolHourlyData = new PoolHourlyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("21023896.3");
    let currentFeesToken1 = BigDecimal.fromString("32987.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentHourlyId = getPoolHourlyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 5;
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolHourlyData.feesToken0 = currentFeesToken0;
    poolHourlyData.feesToken1 = currentFeesToken1;
    poolHourlyData.feesUSD = currentUSDFees;
    poolHourlyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);
    }

    assert.fieldEquals(
      "PoolHourlyData",
      currentHourlyId,
      "feesToken0",
      currentFeesToken0
        .plus(
          formatFromTokenAmount(amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token0).times(
            BigDecimal.fromString(swapTimes.toString()),
          ),
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
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    let amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = newMockEvent();

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

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

      assert.fieldEquals(
        "PoolHourlyData",
        currentHourlyId,
        "feesToken0",
        formatFromTokenAmount(
          amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token0,
        ).toString(),
      );
    }
  });

  test(`When the user swaps token1 by token0 multiple times with more than 1 hour from
    each other, it should update differents pool hourly data entities(as it
    is a new hour, it should create a new entity for each hour and update it)`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("97918.32");
    token1.usdPrice = BigDecimal.fromString("0.997");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    let amount1 = BigInt.fromI32(89632).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let event = newMockEvent();
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));
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

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

      assert.fieldEquals(
        "PoolHourlyData",
        currentHourlyId,
        "feesToken1",
        formatFromTokenAmount(
          amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token1,
        ).toString(),
      );
    }
  });

  test(`When the handler is called, it should call 'setPoolDailyDataTVL'
    to update the pool daily tvl with the correct params`, () => {
    let event = newMockEvent();
    let pool = PoolMock.loadMock();
    let sqrtPriceX96 = BigInt.fromI32(3432);
    let amount0 = BigInt.fromI32(200);
    let amount1 = BigInt.fromI32(100);
    let v3PoolSetters = new V3PoolSettersMock();

    handleV3PoolSwapImpl(event, pool, new TokenMock(), new TokenMock(), amount0, amount1, sqrtPriceX96, v3PoolSetters);

    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls.length > 0, "setPoolDailyDataTVL not called");

    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls[0].poolEntity.id == pool.id, "pool is not the same");
    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls[0].event == event, "timestamp is not the same");
  });

  test(`When the user swaps token0 by token1 multiple times with less than 1 day from
    each other, it should update the same pool daily data entity`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    let amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = newMockEvent();
    let poolDailyData = new PoolDailyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("1898.3");
    let currentFeesToken1 = BigDecimal.fromString("1.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentDailyId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 8;
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolDailyData.feesToken0 = currentFeesToken0;
    poolDailyData.feesToken1 = currentFeesToken1;
    poolDailyData.feesUSD = currentUSDFees;
    poolDailyData.save();

    let token0ExpectedSwapFee = formatFromTokenAmount(
      amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 2));

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);
    }

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesToken0",
      currentFeesToken0
        .plus(
          formatFromTokenAmount(amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token0).times(
            BigDecimal.fromString(swapTimes.toString()),
          ),
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
      Pool.load(pool.id)!.totalValueLockedToken0.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken1",
      Pool.load(pool.id)!.totalValueLockedToken1.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedUSD",
      Pool.load(pool.id)!.totalValueLockedUSD.toString(),
    );
  });

  test(`When the user swaps token1 by token0 multiple times with less than 1 day from
    each other, it should update the same pool daily data entity`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    let amount1 = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = newMockEvent();
    let poolDailyData = new PoolDailyDataMock();
    let currentFeesToken0 = BigDecimal.fromString("1898.3");
    let currentFeesToken1 = BigDecimal.fromString("1.3");
    let currentUSDFees = currentFeesToken0.times(token0.usdPrice).plus(currentFeesToken1.times(token1.usdPrice));
    let currentDailyId = getPoolDailyDataId(event.block.timestamp, pool).toHexString();
    let swapTimes = 8;
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    pool.feeTier = 500;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    poolDailyData.feesToken0 = currentFeesToken0;
    poolDailyData.feesToken1 = currentFeesToken1;
    poolDailyData.feesUSD = currentUSDFees;
    poolDailyData.save();

    let token1ExpectedSwapFee = formatFromTokenAmount(
      amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
      token0,
    );

    for (let i = 0; i < swapTimes; i++) {
      event.block.timestamp = event.block.timestamp.plus(BigInt.fromU32(ONE_HOUR_IN_SECONDS * 2));

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);
    }

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "feesToken1",
      currentFeesToken1
        .plus(
          formatFromTokenAmount(amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)), token1).times(
            BigDecimal.fromString(swapTimes.toString()),
          ),
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
      Pool.load(pool.id)!.totalValueLockedToken0.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedToken1",
      Pool.load(pool.id)!.totalValueLockedToken1.toString(),
    );

    assert.fieldEquals(
      "PoolDailyData",
      currentDailyId,
      "totalValueLockedUSD",
      Pool.load(pool.id)!.totalValueLockedUSD.toString(),
    );
  });

  test(`When the user swaps token0 by token1 multiple times with more than 1 day from
    each other, it should update differents pool daily data entities(as it
    is a new day, it should create a new entity for each day and update it)`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    let amount1 = BigInt.fromI32(12)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();

    let event = newMockEvent();
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));
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

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "feesToken0",
        formatFromTokenAmount(
          amount0.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token0,
        ).toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken0",
        Pool.load(pool.id)!.totalValueLockedToken0.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken1",
        Pool.load(pool.id)!.totalValueLockedToken1.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedUSD",
        Pool.load(pool.id)!.totalValueLockedUSD.toString(),
      );
    }
  });

  test(`When the user swaps token1 by token0 multiple times with more than 1 day from
    each other, it should update differents pool daily data entities(as it
    is a new day, it should create a new entity for each day and update it)`, () => {
    let pool = PoolMock.loadMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

    token0.usdPrice = BigDecimal.fromString("12.32");
    token1.usdPrice = BigDecimal.fromString("981.1");

    token0.save();
    token1.save();

    let amount0 = BigInt.fromI32(1765)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();

    let amount1 = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));

    let event = newMockEvent();

    let dayIds: Bytes[] = [];
    let swapTimes = 5;
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

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

      handleV3PoolSwap(event, pool, token0, token1, amount0, amount1, sqrtPriceX96);

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "feesToken1",
        formatFromTokenAmount(
          amount1.times(BigInt.fromI32(pool.feeTier)).div(BigInt.fromU32(1000000)),
          token1,
        ).toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken0",
        Pool.load(pool.id)!.totalValueLockedToken0.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedToken1",
        Pool.load(pool.id)!.totalValueLockedToken1.toString(),
      );

      assert.fieldEquals(
        "PoolDailyData",
        currentDayId,
        "totalValueLockedUSD",
        Pool.load(pool.id)!.totalValueLockedUSD.toString(),
      );
    }
  });

  test(`when the user swaps token1 for token0, the token0 pooled usd amount should decrease
   by the amount swapped, as it is taken from the pool`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
    let currentPooledTokenAmount = BigDecimal.fromString("321.7");
    let token0UsdPrice = BigDecimal.fromString("12.32");
    let currentToken0PooledUsdAmount = currentPooledTokenAmount.times(token0UsdPrice);

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    token0.usdPrice = token0UsdPrice;
    token0.totalValuePooledUsd = currentToken0PooledUsdAmount;
    token0.totalTokenPooledAmount = currentPooledTokenAmount;
    token0.save();

    let amount0BigInt = BigInt.fromI32(1765)
      .times(BigInt.fromI32(10).pow(token0.decimals as u8))
      .neg();
    let amount1BigInt = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    handleV3PoolSwap(event, pool, token0, token1, amount0BigInt, amount1BigInt, sqrtPriceX96);

    assert.fieldEquals(
      "Token",
      token0.id.toHexString(),
      "totalValuePooledUsd",
      currentToken0PooledUsdAmount
        .minus(formatFromTokenAmount(amount0BigInt, token0).times(token0.usdPrice!).neg())
        .toString(),
    );
  });

  test(`when the user swaps token0 for token1, the token1 pooled usd amount should decrease
    by the amount swapped, as it is taken from the pool`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000012"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
    let token1UsdPrice = BigDecimal.fromString("1200.32");
    let currentPooledTokenAmount = BigDecimal.fromString("321.7");
    let currentToken1PooledUsdAmount = currentPooledTokenAmount.times(token1UsdPrice);

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    token1.usdPrice = token1UsdPrice;
    token1.totalValuePooledUsd = currentToken1PooledUsdAmount;
    token1.totalTokenPooledAmount = currentPooledTokenAmount;
    token0.save();

    let amount1BigInt = BigInt.fromI32(3134)
      .times(BigInt.fromI32(10).pow(token1.decimals as u8))
      .neg();
    let amount0BigInt = BigInt.fromI32(12).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let sqrtPriceX96 = BigInt.fromI32(100).times(BigInt.fromI32(10).pow(96));

    handleV3PoolSwap(event, pool, token0, token1, amount0BigInt, amount1BigInt, sqrtPriceX96);

    assert.fieldEquals(
      "Token",
      token1.id.toHexString(),
      "totalValuePooledUsd",
      currentToken1PooledUsdAmount
        .minus(formatFromTokenAmount(amount1BigInt, token0).times(token1.usdPrice!).neg())
        .toString(),
    );
  });
});
