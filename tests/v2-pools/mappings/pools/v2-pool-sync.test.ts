import { Address, BigDecimal, BigInt, Bytes } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { formatFromTokenAmount } from "../../../../src/common/token-utils";
import { handleV2PoolSync, handleV2PoolSyncImpl } from "../../../../src/v2-pools/mappings/pool/v2-pool-sync";
import { PoolMock, PoolSettersMock, TokenMock } from "../../../mocks";

describe("V2 Pool Sync", () => {
  test(`When calling the handler, it should correctly update the pool total
    value locked of the token 0 with the passed reserve 0`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let reserve0 = BigInt.fromI32(1000);
    let reserve1 = BigInt.fromI32(2000);

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    handleV2PoolSync(event, pool, token0, token1, reserve0, reserve1);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken0",
      formatFromTokenAmount(reserve0, token0).toString(),
    );
  });

  test(`When calling the handler, it should correctly update the pool total
    value locked of the token 1 with the passed reserve 1`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let reserve0 = BigInt.fromI32(1000);
    let reserve1 = BigInt.fromI32(2000);

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    handleV2PoolSync(event, pool, token0, token1, reserve0, reserve1);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedToken1",
      formatFromTokenAmount(reserve1, token1).toString(),
    );
  });

  test(`When calling the handler, it should correctly update the pool total
    value locked usd based on the reserve amounts passed`, () => {
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let reserve0 = BigInt.fromString("21697821");
    let reserve1 = BigInt.fromString("78926131286");

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.save();

    handleV2PoolSync(event, pool, token0, token1, reserve0, reserve1);

    assert.fieldEquals(
      "Pool",
      pool.id.toHexString(),
      "totalValueLockedUSD",
      formatFromTokenAmount(reserve0, token0)
        .times(token0.usdPrice)
        .plus(formatFromTokenAmount(reserve1, token1).times(token1.usdPrice))
        .toString(),
    );
  });

  test(`When calling the handler, it should correctly update the token0 total value pooled`, () => {
    let pooledAmountBefore = BigInt.fromString("386892387356625372");
    let poolReserve0Before = BigInt.fromString("291678721629");
    let token0Address = "0x0000000000000000000000000000000000111119";
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock(Address.fromString(token0Address));
    let token1 = new TokenMock();
    let newReserve0 = BigInt.fromString("21697821");
    let newReserve1 = BigInt.fromString("78926131286");

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.totalValueLockedToken0 = formatFromTokenAmount(poolReserve0Before, token0);
    token0.totalTokenPooledAmount = formatFromTokenAmount(pooledAmountBefore, token0);

    pool.save();
    token0.save();

    handleV2PoolSync(event, pool, token0, token1, newReserve0, newReserve1);

    assert.fieldEquals(
      "Token",
      token0.id.toHexString(),
      "totalTokenPooledAmount",
      formatFromTokenAmount(pooledAmountBefore, token0)
        .plus(formatFromTokenAmount(newReserve0.minus(poolReserve0Before), token0))
        .toString(),
    );
  });

  test(`When calling the handler, it should correctly update the token1 total value pooled`, () => {
    let pooledAmountBefore = BigInt.fromString("21567328392988");
    let poolReserve1Before = BigInt.fromString("918729817827186281");
    let token1Address = "0x0000000000000000000000000000000002111119";
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock(Address.fromString(token1Address));
    let newReserve0 = BigInt.fromString("21697821");
    let newReserve1 = BigInt.fromString("78926131286");

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = formatFromTokenAmount(poolReserve1Before, token1);
    token1.totalTokenPooledAmount = formatFromTokenAmount(pooledAmountBefore, token1);

    pool.save();
    token1.save();

    handleV2PoolSync(event, pool, token0, token1, newReserve0, newReserve1);

    assert.fieldEquals(
      "Token",
      token1.id.toHexString(),
      "totalTokenPooledAmount",
      formatFromTokenAmount(pooledAmountBefore, token1)
        .plus(formatFromTokenAmount(newReserve1.minus(poolReserve1Before), token1))
        .toString(),
    );
  });

  test(`When calling the handler, it should correctly update the token0 total value pooled in usd`, () => {
    let pooledAmountBefore = BigInt.fromString("386892387356625372");
    let poolReserve0Before = BigInt.fromString("291678721629");
    let token0Address = "0x0000000000000000000000000000000000111119";
    let token0UsdPrice = BigDecimal.fromString("2561.3277");
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock(Address.fromString(token0Address));
    let token1 = new TokenMock();
    let newReserve0 = BigInt.fromString("21697821");
    let newReserve1 = BigInt.fromString("78926131286");

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.totalValueLockedToken0 = formatFromTokenAmount(poolReserve0Before, token0);
    token0.totalTokenPooledAmount = formatFromTokenAmount(pooledAmountBefore, token0);
    token0.usdPrice = token0UsdPrice;

    pool.save();
    token0.save();

    handleV2PoolSync(event, pool, token0, token1, newReserve0, newReserve1);

    assert.fieldEquals(
      "Token",
      token0.id.toHexString(),
      "totalValuePooledUsd",
      formatFromTokenAmount(pooledAmountBefore, token0)
        .plus(formatFromTokenAmount(newReserve0.minus(poolReserve0Before), token0))
        .times(token0UsdPrice)
        .toString(),
    );
  });

  test(`When calling the handler, it should correctly update the token1 total value pooled in usd`, () => {
    let pooledAmountBefore = BigInt.fromString("21567328392988");
    let poolReserve1Before = BigInt.fromString("918729817827186281");
    let token1Address = "0x0000000000000000000000000000000002111119";
    let event = newMockEvent();
    let pool = new PoolMock();
    let token0 = new TokenMock();
    let token1 = new TokenMock(Address.fromString(token1Address));
    let newReserve0 = BigInt.fromString("21697821");
    let newReserve1 = BigInt.fromString("78926131286");
    let token1UsdPrice = BigDecimal.fromString("1");

    pool.token0 = token0.id;
    pool.token1 = token1.id;
    pool.totalValueLockedToken1 = formatFromTokenAmount(poolReserve1Before, token1);
    token1.totalTokenPooledAmount = formatFromTokenAmount(pooledAmountBefore, token1);
    token1.usdPrice = token1UsdPrice;

    pool.save();
    token1.save();

    handleV2PoolSync(event, pool, token0, token1, newReserve0, newReserve1);

    assert.fieldEquals(
      "Token",
      token1.id.toHexString(),
      "totalValuePooledUsd",
      formatFromTokenAmount(pooledAmountBefore, token1)
        .plus(formatFromTokenAmount(newReserve1.minus(poolReserve1Before), token1))
        .times(token1UsdPrice)
        .toString(),
    );
  });

  test(`When calling the handler, it should call the pool setters to set the daiy data tvl`, () => {
    let poolAddress = "0x1000000000000000000000000000000000111111";
    let event = newMockEvent();
    let pool = new PoolMock(Address.fromString(poolAddress));
    let token0 = new TokenMock();
    let token1 = new TokenMock();
    let newReserve0 = BigInt.fromString("21697821");
    let newReserve1 = BigInt.fromString("78926131286");
    let poolSetters = new PoolSettersMock();

    handleV2PoolSyncImpl(event, pool, token0, token1, newReserve0, newReserve1, poolSetters);

    assert.bytesEquals(poolSetters.setPoolDailyDataTVLCalls[0].poolEntity.id, Bytes.fromHexString(poolAddress));
  });
});
