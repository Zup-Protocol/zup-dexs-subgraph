import { BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { handleV3PoolInitializeImpl } from "../../../../src/v3-pools/mappings/pool/v3-pool-initialize";
import { sqrtPriceX96toPrice } from "../../../../src/v3-pools/utils/v3-v4-pool-converters";
import { PoolMock, PoolSettersMock, TokenMock, V3PoolMock } from "../../../mocks";

test(`When the handler is called, it should call 'setPricesForV3PoolWhitelistedTokens'
    with the correct params`, () => {
  let v3PoolSetters = new PoolSettersMock();

  let pool = new PoolMock();
  let token0 = new TokenMock();
  let token1 = new TokenMock();
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let poolPrices = sqrtPriceX96toPrice(sqrtPriceX96, token0, token1);
  let tick = BigInt.fromI32(989756545);

  new V3PoolMock(pool.id);
  handleV3PoolInitializeImpl(pool, new TokenMock(), new TokenMock(), sqrtPriceX96, tick, v3PoolSetters);

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls.length > 0,
    "setPricesForV3PoolWhitelistedTokens have not been called",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolEntity.id == pool.id,
    "pool is not the same",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolPrices.token0PerToken1.toString() ==
      poolPrices.token0PerToken1.toString(),
    "Pool prices token0 per token1 is not correct",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolPrices.token1PerToken0.toString() ==
      poolPrices.token1PerToken0.toString(),
    "Pool prices token1 per token0 is not correct",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolToken0Entity.id == pool.token0,
    "token0 is not the same",
  );

  assert.assertTrue(
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolToken1Entity.id == pool.token1,
    "token1 is not the same",
  );
});

test("When the handler is called, it should assign the sqrtPriceX96 to the pool", () => {
  let pool = new PoolMock();
  let v3pool = new V3PoolMock(pool.id);
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let tick = BigInt.fromI32(989756545);

  handleV3PoolInitializeImpl(pool, new TokenMock(), new TokenMock(), sqrtPriceX96, tick, new PoolSettersMock());

  assert.fieldEquals("V3Pool", v3pool.id.toHexString(), "sqrtPriceX96", sqrtPriceX96.toString());
});

test("When the handler is called, it should assign the tick to the pool", () => {
  let pool = new PoolMock();
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let tick = BigInt.fromI32(989756545);

  handleV3PoolInitializeImpl(pool, new TokenMock(), new TokenMock(), sqrtPriceX96, tick, new PoolSettersMock());

  assert.fieldEquals("V3Pool", pool.id.toHexString(), "tick", tick.toString());
});
