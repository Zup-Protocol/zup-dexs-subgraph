import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
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
