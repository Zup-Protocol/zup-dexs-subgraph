import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
import { Token } from "../../../../generated/schema";
import { getPoolDailyDataId } from "../../../../src/utils/pool-utils";
import { formatFromTokenAmount } from "../../../../src/utils/token-utils";
import { handleV3PoolMint } from "../../../../src/v3-pools/mappings/pool/v3-pool-mint";
import { PoolMock, TokenMock } from "../../../mocks";

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

    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();

    handleV3PoolMint(event, pool, token0, token1, amount0In, BigInt.fromI32(0));

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken0",
      initialPoolToken0Tvl.plus(formatFromTokenAmount(amount0In, token0)).toString(),
    );
  });

  test(`When the handler is called, it should sum the token0 pooled usd value by the
    amount passed in the event`, () => {
    let currentPoooledTokenAmount = BigDecimal.fromString("321.7");
    let amount0In = BigDecimal.fromString("12.3");
    let token0UsdPrice = BigDecimal.fromString("1200");
    let event = newMockEvent();
    let pool = new PoolMock();
    let currentPooledToken0USD = currentPoooledTokenAmount.times(token0UsdPrice);

    let token0 = Token.load(pool.token0)!;
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));

    token0.usdPrice = token0UsdPrice;
    token0.totalValuePooledUsd = currentPooledToken0USD;
    token0.totalTokenPooledAmount = currentPoooledTokenAmount;
    token0.save();

    let amount0InBigInt = BigInt.fromString(
      amount0In.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
    );

    pool.token0 = token0.id;
    pool.token1 = token1.id;

    pool.save();

    handleV3PoolMint(event, pool, token0, token1, amount0InBigInt, BigInt.fromI32(0));

    assert.fieldEquals(
      "Token",
      token0.id.toHexString(),
      "totalValuePooledUsd",
      currentPooledToken0USD.plus(amount0In.times(token0UsdPrice)).toString(),
    );
  });

  test(`When the handler is called, it should deduct the token1 pooled usd value by the
    amount passed in the event`, () => {
    let currentPooledToken1Amount = BigDecimal.fromString("100.2");
    let amount1In = BigDecimal.fromString("942.75");
    let token1UsdPrice = BigDecimal.fromString("10");
    let currentPooledToken1USD = currentPooledToken1Amount.times(token1UsdPrice);
    let event = newMockEvent();
    let pool = new PoolMock();

    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

    token1.usdPrice = token1UsdPrice;
    token1.totalValuePooledUsd = currentPooledToken1USD;
    token1.totalTokenPooledAmount = currentPooledToken1Amount;
    token1.save();

    let amount1InBigInt = BigInt.fromString(
      amount1In.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
    );

    pool.token0 = token0.id;
    pool.token1 = token1.id;

    pool.save();

    handleV3PoolMint(event, pool, token0, token1, BigInt.fromI32(0), amount1InBigInt);

    assert.fieldEquals(
      "Token",
      token1.id.toHexString(),
      "totalValuePooledUsd",
      currentPooledToken1USD.plus(amount1In.times(token1UsdPrice)).toString(),
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

    pool.totalValueLockedToken1 = initialPoolToken1Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();

    handleV3PoolMint(event, pool, token0, token1, BigInt.fromI32(0), amount1In);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
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

    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();

    handleV3PoolMint(event, pool, token0, token1, amount0In, amount1In);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
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
    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.totalValueLockedToken1 = initialPoolToken1Tvl;

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();

    handleV3PoolMint(event, pool, token0, token1, amount0In, amount1In);

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

    pool.totalValueLockedToken0 = initialPoolToken0Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();

    handleV3PoolMint(event, pool, token0, token1, amount0In, BigInt.fromI32(0));

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

    pool.totalValueLockedToken1 = initialPoolToken1Tvl;
    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    let event = newMockEvent();
    handleV3PoolMint(event, pool, token0, token1, BigInt.fromI32(0), amount1In);

    assert.fieldEquals(
      "PoolDailyData",
      getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
      "totalValueLockedToken1",
      initialPoolToken1Tvl.plus(formatFromTokenAmount(amount1In, token0)).toString(),
    );
  });
});
