import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { Pool, Token, Token as TokenEntity } from "../../../../generated/schema";
import { getPoolDailyDataId } from "../../../../src/common/pool-utils";
import { handleV2PoolClaimFees } from "../../../../src/v2-pools/mappings/pool/v2-pool-claim-fees";
import { PoolMock, TokenMock } from "../../../mocks";

test(`When the handler is called, it should deduct the pool token0 tvl with the claimed amount`, () => {
  let expectedAmount0Claimed = BigDecimal.fromString("5.25");
  let expectedPoolToken0TvlAfterDeduction = BigDecimal.fromString("10.75");
  let event = newMockEvent();

  let pool = new PoolMock();
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  pool.totalValueLockedToken0 = expectedAmount0Claimed.plus(expectedPoolToken0TvlAfterDeduction);
  pool.save();

  let amount0 = BigInt.fromString(
    expectedAmount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, amount0, BigInt.fromI32(0));

  assert.fieldEquals(
    "Pool",
    pool.id.toHexString(),
    "totalValueLockedToken0",
    expectedPoolToken0TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should deduct the pool token1 tvl with the claimed amount`, () => {
  let expectedAmount1Claimed = BigDecimal.fromString("3.5");
  let expectedPoolToken1TvlAfterDeduction = BigDecimal.fromString("8.5");

  let event = newMockEvent();
  let pool = new PoolMock();
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  pool.totalValueLockedToken1 = expectedAmount1Claimed.plus(expectedPoolToken1TvlAfterDeduction);
  pool.save();

  let amount1 = BigInt.fromString(
    expectedAmount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, BigInt.fromI32(0), amount1);

  assert.fieldEquals(
    "Pool",
    pool.id.toHexString(),
    "totalValueLockedToken1",
    expectedPoolToken1TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should update the pool usd tvl after deducting the claimed token amounts`, () => {
  let event = newMockEvent();

  let amount0Claimed = BigDecimal.fromString("2.3");
  let amount1Claimed = BigDecimal.fromString("1.25");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.7");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("2.75");
  let token0USDPrice = BigDecimal.fromString("1000");
  let token1USDPrice = BigDecimal.fromString("20");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Claimed.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Claimed.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "Pool",
    pool.id.toHexString(),
    "totalValueLockedUSD",
    poolToken0TVLAfterDeduction
      .times(token0USDPrice)
      .plus(poolToken1TVLAfterDeduction.times(token1USDPrice))
      .toString(),
  );
});

test(`When the handler is called, it should deduct the token0 pooled usd value by the claimed amount`, () => {
  let currentPooledTokenAmount = BigDecimal.fromString("50.7");
  let amount0Claimed = BigDecimal.fromString("10.2");
  let token0UsdPrice = BigDecimal.fromString("900");
  let event = newMockEvent();
  let pool = new PoolMock();
  let currentPooledToken0USD = currentPooledTokenAmount.times(token0UsdPrice);

  let token0 = Token.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));

  token0.totalValuePooledUsd = currentPooledToken0USD;
  token0.totalTokenPooledAmount = currentPooledTokenAmount;
  token0.usdPrice = token0UsdPrice;
  token0.save();

  let amount0ClaimedBigInt = BigInt.fromString(
    amount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  handleV2PoolClaimFees(event, pool, token0, token1, amount0ClaimedBigInt, BigInt.fromI32(0));

  assert.fieldEquals(
    "Token",
    token0.id.toHexString(),
    "totalValuePooledUsd",
    currentPooledToken0USD.minus(amount0Claimed.times(token0UsdPrice)).toString(),
  );
});

test(`When the handler is called, it should deduct the token1 pooled usd value by the claimed amount`, () => {
  let currentTokenAmountPooled = BigDecimal.fromString("80.5");
  let amount1Claimed = BigDecimal.fromString("5.75");
  let token1UsdPrice = BigDecimal.fromString("15");
  let event = newMockEvent();
  let pool = new PoolMock();
  let currentPooledToken1USD = currentTokenAmountPooled.times(token1UsdPrice);

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  token1.usdPrice = token1UsdPrice;
  token1.totalValuePooledUsd = currentPooledToken1USD;
  token1.totalTokenPooledAmount = currentTokenAmountPooled;
  token1.save();

  let amount1ClaimedBigInt = BigInt.fromString(
    amount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );

  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  handleV2PoolClaimFees(event, pool, token0, token1, BigInt.fromI32(0), amount1ClaimedBigInt);

  assert.fieldEquals(
    "Token",
    token1.id.toHexString(),
    "totalValuePooledUsd",
    currentPooledToken1USD.minus(amount1Claimed.times(token1UsdPrice)).toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl usd data`, () => {
  let event = newMockEvent();

  let amount0Claimed = BigDecimal.fromString("2.3");
  let amount1Claimed = BigDecimal.fromString("1.25");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.7");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("2.75");
  let token0USDPrice = BigDecimal.fromString("1000");
  let token1USDPrice = BigDecimal.fromString("20");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Claimed.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Claimed.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedUSD",
    Pool.load(pool.id)!.totalValueLockedUSD.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token0 data`, () => {
  let event = newMockEvent();

  let amount0Claimed = BigDecimal.fromString("2.3");
  let amount1Claimed = BigDecimal.fromString("1.25");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.7");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("2.75");
  let token0USDPrice = BigDecimal.fromString("1000");
  let token1USDPrice = BigDecimal.fromString("20");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Claimed.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Claimed.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken0",
    Pool.load(pool.id)!.totalValueLockedToken0.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token1 data`, () => {
  let event = newMockEvent();

  let amount0Claimed = BigDecimal.fromString("2.3");
  let amount1Claimed = BigDecimal.fromString("1.25");
  let poolToken0TVLAfterDeduction = BigDecimal.fromString("7.7");
  let poolToken1TVLAfterDeduction = BigDecimal.fromString("2.75");
  let token0USDPrice = BigDecimal.fromString("1000");
  let token1USDPrice = BigDecimal.fromString("20");

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));

  token0.usdPrice = token0USDPrice;
  token1.usdPrice = token1USDPrice;

  token0.save();
  token1.save();

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Claimed.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Claimed.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Claimed.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Claimed.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolClaimFees(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken1",
    Pool.load(pool.id)!.totalValueLockedToken1.toString(),
  );
});
