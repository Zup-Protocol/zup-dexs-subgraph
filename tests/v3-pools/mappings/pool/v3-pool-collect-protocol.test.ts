import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, newMockEvent, test } from "matchstick-as";
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
});
