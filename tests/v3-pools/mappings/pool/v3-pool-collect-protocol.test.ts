import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
import { Token } from "../../../../generated/schema";
import { formatFromTokenAmount } from "../../../../src/utils/token-utils";
import {
  handleV3PoolProtocolCollect,
  handleV3PoolProtocolCollectImpl,
} from "../../../../src/v3-pools/mappings/pool/v3-pool-protocol-collect";
import { PoolMock, TokenMock, V3PoolSettersMock } from "../../../mocks";

describe("v3-pool-collect-protocol", () => {
  beforeEach(() => {
    clearStore();
  });

  test("When the handler is called, ir should decrease the totalValueLockedToken0 by the amount0 from the event", () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let amount0 = BigInt.fromI32(100);
    let currentTotalValueLockedToken0 = BigInt.fromI32(128715276).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    pool.totalValueLockedToken0 = currentTotalValueLockedToken0.toBigDecimal();
    pool.save();

    handleV3PoolProtocolCollect(event, pool, token0, token1, amount0, BigInt.fromI32(200));

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken0",
      currentTotalValueLockedToken0.toBigDecimal().minus(formatFromTokenAmount(amount0, token0)).toString(),
    );
  });

  test("When the handler is called, ir should decrease the totalValueLockedToken1 by the amount1 from the event", () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let amount1 = BigInt.fromI32(98216);
    let currentTotalValueLockedToken1 = BigInt.fromI32(128715276).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    pool.totalValueLockedToken1 = currentTotalValueLockedToken1.toBigDecimal();
    pool.save();

    handleV3PoolProtocolCollect(event, pool, token0, token1, BigInt.fromI32(0), amount1);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken1",
      currentTotalValueLockedToken1.toBigDecimal().minus(formatFromTokenAmount(amount1, token1)).toString(),
    );
  });

  test(`When the handler is called, it should recalculate the totalValueLockedUSD based
    on the totalValueLockedToken0 and totalValueLockedToken1 that have been modified
    by the event amounts`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();

    let amount1 = BigInt.fromI32(98216);
    let amount0 = BigInt.fromI32(1552);
    let currentTotalValueLockedToken1 = BigInt.fromI32(128715276).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let currentTotalValueLockedToken0 = BigInt.fromI32(1867).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");
    pool.totalValueLockedToken1 = currentTotalValueLockedToken1.toBigDecimal();
    pool.totalValueLockedToken0 = currentTotalValueLockedToken0.toBigDecimal();

    pool.save();
    token0.save();
    token1.save();

    handleV3PoolProtocolCollect(event, pool, token0, token1, amount0, amount1);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedUSD",
      currentTotalValueLockedToken0
        .toBigDecimal()
        .minus(formatFromTokenAmount(amount0, token0))
        .times(token0.usdPrice)
        .plus(
          currentTotalValueLockedToken1
            .toBigDecimal()
            .minus(formatFromTokenAmount(amount1, token1))
            .times(token1.usdPrice),
        )
        .toString(),
    );
  });

  test(`When the handler is called, it should call 'setPoolDailyDataTVL' to update the pool daily tvl`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let v3PoolSetters = new V3PoolSettersMock();
    let amount1 = BigInt.fromI32(98216);
    let amount0 = BigInt.fromI32(1552);
    let currentTotalValueLockedToken1 = BigInt.fromI32(128715276).times(BigInt.fromI32(10).pow(token1.decimals as u8));
    let currentTotalValueLockedToken0 = BigInt.fromI32(1867).times(BigInt.fromI32(10).pow(token0.decimals as u8));

    token0.usdPrice = BigDecimal.fromString("0.022");
    token1.usdPrice = BigDecimal.fromString("1.21");
    pool.totalValueLockedToken1 = currentTotalValueLockedToken1.toBigDecimal();
    pool.totalValueLockedToken0 = currentTotalValueLockedToken0.toBigDecimal();

    pool.save();
    token0.save();
    token1.save();

    handleV3PoolProtocolCollectImpl(event, pool, token0, token1, amount0, amount1, v3PoolSetters);

    assert.assertTrue(v3PoolSetters.setPoolDailyDataTVLCalls.length > 0, "setPoolDailyDataTVL not called");
    assert.bytesEquals(v3PoolSetters.setPoolDailyDataTVLCalls[0].poolEntity.id, pool.id, "pool is not the same");
    assert.bytesEquals(v3PoolSetters.setPoolDailyDataTVLCalls[0].event.address, event.address, "event is not the same");
  });

  test(`When the handler is called, it should deduct the token0 pooled usd value by the
    amount passed in the event`, () => {
    let currentPooledToken0USD = BigDecimal.fromString("98.2");
    let amount0Out = BigDecimal.fromString("12.3");
    let token0UsdPrice = BigDecimal.fromString("1200");
    let event = newMockEvent();
    let pool = new PoolMock();

    let token0 = Token.load(pool.token0)!;
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));

    token0.usdPrice = token0UsdPrice;
    token0.totalValuePooledUsd = currentPooledToken0USD;
    token0.save();

    let amount0OutBigInt = BigInt.fromString(
      amount0Out.times(BigDecimal.fromString((10 ** token0.decimals).toString())).toString(),
    );

    pool.token0 = token0.id;
    pool.token1 = token1.id;

    pool.save();

    handleV3PoolProtocolCollect(event, pool, token0, token1, amount0OutBigInt, BigInt.fromI32(0));

    assert.fieldEquals(
      "Token",
      token0.id.toHexString(),
      "totalValuePooledUsd",
      currentPooledToken0USD.minus(amount0Out.times(token0UsdPrice)).toString(),
    );
  });

  test(`When the handler is called, it should deduct the token1 pooled usd value by the
    amount passed in the event`, () => {
    let currentPooledToken1USD = BigDecimal.fromString("7212.2");
    let amount1Out = BigDecimal.fromString("942.75");
    let token1UsdPrice = BigDecimal.fromString("10");

    let event = newMockEvent();
    let pool = new PoolMock();

    let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000221"));
    let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000122"));

    token1.usdPrice = token1UsdPrice;
    token1.totalValuePooledUsd = currentPooledToken1USD;
    token1.save();

    let amount1OutBigInt = BigInt.fromString(
      amount1Out.times(BigDecimal.fromString((10 ** token1.decimals).toString())).toString(),
    );

    pool.token0 = token0.id;
    pool.token1 = token1.id;

    pool.save();

    handleV3PoolProtocolCollect(event, pool, token0, token1, BigInt.fromI32(0), amount1OutBigInt);

    assert.fieldEquals(
      "Token",
      token1.id.toHexString(),
      "totalValuePooledUsd",
      currentPooledToken1USD.minus(amount1Out.times(token1UsdPrice)).toString(),
    );
  });
});
