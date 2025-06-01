import { BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { handleV3PoolInitializeImpl } from "../../../../src/v3-pools/mappings/pool/v3-pool-initialize";
import { PoolMock, TokenMock, V3V4PoolSettersMock } from "../../../mocks";

test(`When the handler is called, it should call 'setPricesForV3PoolWhitelistedTokens'
    with the correct params`, () => {
  let v3PoolSetters = new V3V4PoolSettersMock();

  let pool = new PoolMock();
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let tick = BigInt.fromI32(989756545);

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
    v3PoolSetters.setPricesForPoolWhitelistedTokensCalls[0].poolSqrtPriceX96 == sqrtPriceX96,
    "sqrtPriceX96 is not the same",
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
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let tick = BigInt.fromI32(989756545);

  handleV3PoolInitializeImpl(pool, new TokenMock(), new TokenMock(), sqrtPriceX96, tick, new V3V4PoolSettersMock());

  assert.fieldEquals("Pool", pool.id.toHexString(), "sqrtPriceX96", sqrtPriceX96.toString());
});

test("When the handler is called, it should assign the tick to the pool", () => {
  let pool = new PoolMock();
  let sqrtPriceX96 = BigInt.fromI32(1000);
  let tick = BigInt.fromI32(989756545);

  handleV3PoolInitializeImpl(pool, new TokenMock(), new TokenMock(), sqrtPriceX96, tick, new V3V4PoolSettersMock());

  assert.fieldEquals("Pool", pool.id.toHexString(), "tick", tick.toString());
});
