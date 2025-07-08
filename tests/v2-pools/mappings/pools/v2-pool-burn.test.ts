import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { Pool, Token, Token as TokenEntity } from "../../../../generated/schema";
import { getPoolDailyDataId } from "../../../../src/common/pool-utils";
import { handleV2PoolBurn } from "../../../../src/v2-pools/mappings/pool/v2-pool-burn";
import { PoolMock, TokenMock } from "../../../mocks";

test(`When the handler is called, it should deduct the pool token0 tvl
    with the amount passed in the event`, () => {
  let expectedAmount0Out = BigDecimal.fromString("9.325");
  let expectedPoolToken0TvlAfterDeduction = BigDecimal.fromString("21.3");
  let event = newMockEvent();

  let pool = new PoolMock();
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  pool.totalValueLockedToken0 = expectedAmount0Out.plus(expectedPoolToken0TvlAfterDeduction);
  pool.save();

  let amount0 = BigInt.fromString(
    expectedAmount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, amount0, BigInt.fromI32(0));

  assert.fieldEquals(
    "Pool",
    pool.id.toHexString(),
    "totalValueLockedToken0",
    expectedPoolToken0TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should deduct the token0 pooled usd value by the
  amount passed in the event`, () => {
  let currentPooledTokenAmount = BigDecimal.fromString("321.7");
  let amount0Out = BigDecimal.fromString("12.3");
  let token0UsdPrice = BigDecimal.fromString("1200");
  let event = newMockEvent();
  let pool = new PoolMock();
  let currentPooledToken0USD = currentPooledTokenAmount.times(token0UsdPrice);

  let token0 = Token.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));

  token0.totalValuePooledUsd = currentPooledToken0USD;
  token0.totalTokenPooledAmount = currentPooledTokenAmount;
  token0.usdPrice = token0UsdPrice;
  token0.save();

  let amount0OutBigInt = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  handleV2PoolBurn(event, pool, token0, token1, amount0OutBigInt, BigInt.fromI32(0));

  assert.fieldEquals(
    "Token",
    token0.id.toHexString(),
    "totalValuePooledUsd",
    currentPooledToken0USD.minus(amount0Out.times(token0UsdPrice)).toString(),
  );
});

test(`When the handler is called, it should deduct the token1 pooled usd value by the
  amount passed in the event`, () => {
  let currentTokenAmountPooled = BigDecimal.fromString("321.7");
  let amount1Out = BigDecimal.fromString("942.75");
  let token1UsdPrice = BigDecimal.fromString("10");
  let event = newMockEvent();
  let pool = new PoolMock();
  let currentPooledToken1USD = currentTokenAmountPooled.times(token1UsdPrice);

  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  token1.usdPrice = token1UsdPrice;
  token1.totalValuePooledUsd = currentPooledToken1USD;
  token1.totalTokenPooledAmount = currentTokenAmountPooled;
  token1.save();

  let amount1OutBigInt = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
  );

  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  handleV2PoolBurn(event, pool, token0, token1, BigInt.fromI32(0), amount1OutBigInt);

  assert.fieldEquals(
    "Token",
    token1.id.toHexString(),
    "totalValuePooledUsd",
    currentPooledToken1USD.minus(amount1Out.times(token1UsdPrice)).toString(),
  );
});

test(`When the handler is called, it should deduct the pool token1 tvl
    with the amount passed in the event`, () => {
  let expectedAmount1Out = BigDecimal.fromString("7.325");
  let expectedPoolToken1TvlAfterDeduction = BigDecimal.fromString("12.3");

  let event = newMockEvent();
  let pool = new PoolMock();
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

  pool.totalValueLockedToken1 = expectedAmount1Out.plus(expectedPoolToken1TvlAfterDeduction);
  pool.save();

  let amount1 = BigInt.fromString(
    expectedAmount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, BigInt.fromI32(0), amount1);

  assert.fieldEquals(
    "Pool",
    pool.id.toHexString(),
    "totalValueLockedToken1",
    expectedPoolToken1TvlAfterDeduction.toString(),
  );
});

test(`When the handler is called, it should update the pool
    usd tvl after deducting the token amounts from the pool`, () => {
  let event = newMockEvent();

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

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, amount0, amount1);

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

test(`When the handler is called, it should update the pool daily tvl usd data`, () => {
  let event = newMockEvent();

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

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedUSD",
    Pool.load(pool.id)!.totalValueLockedUSD.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token0 data`, () => {
  let event = newMockEvent();

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

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken0",
    Pool.load(pool.id)!.totalValueLockedToken0.toString(),
  );
});

test(`When the handler is called, it should update the pool daily tvl token1 data`, () => {
  let event = newMockEvent();

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

  let pool = new PoolMock();

  pool.totalValueLockedToken0 = amount0Out.plus(poolToken0TVLAfterDeduction);
  pool.totalValueLockedToken1 = amount1Out.plus(poolToken1TVLAfterDeduction);
  pool.token0 = token0.id;
  pool.token1 = token1.id;

  pool.save();

  let amount1 = BigInt.fromString(
    amount1Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );
  let amount0 = BigInt.fromString(
    amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
  );

  handleV2PoolBurn(event, pool, token0, token1, amount0, amount1);

  assert.fieldEquals(
    "PoolDailyData",
    getPoolDailyDataId(event.block.timestamp, pool).toHexString(),
    "totalValueLockedToken1",
    Pool.load(pool.id)!.totalValueLockedToken1.toString(),
  );
});
