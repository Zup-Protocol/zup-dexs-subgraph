import { Address, BigInt } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { Pool, Token } from "../../generated/schema";
import { CurrentNetwork } from "../../src/common/current-network";
import {
  findNativeToken,
  findStableToken,
  findWrappedNative,
  getPoolDailyDataId,
  getPoolHourlyDataId,
  isNativePool,
  isStablePool,
  isVariableWithStablePool,
  isWrappedNativePool,
} from "../../src/common/pool-utils";
import { PoolMock, TokenMock } from "../mocks";

test(`When a pool has the token 0 as stablecoin,
    and token 1 as not-stablecoin,
    'isVariableWithStablePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.token0 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[1])).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;

  assert.assertTrue(isVariableWithStablePool(pool));
});

test(`When a pool has the token 0 as non-stablecoin,
    and token 1 as stablecoin,
    'isVariableWithStablePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[1])).id;

  assert.assertTrue(isVariableWithStablePool(pool));
});

test(`When a pool has the token 0 as non-stablecoin,
    and token 1 as non-stablecoin,
    'isVariableWithStablePool' should return false
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000003")).id;

  assert.assertTrue(!isVariableWithStablePool(pool));
});

test(`When a pool has the token 0 as stablecoin,
    and token 1 as stablecoin,
    'isVariableWithStablePool' should return false
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[0])).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[1])).id;

  assert.assertTrue(!isVariableWithStablePool(pool));
});

test(`when a pool has the token 0 as stablecoin and token 1 as stablecoin,
    'isStablePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[0])).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[1])).id;

  assert.assertTrue(isStablePool(pool));
});

test(`when a pool has the token 0 as stablecoin and token 1 as non-stablecoin,
    'isStablePool' should return false
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[0])).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;

  assert.assertTrue(!isStablePool(pool));
});

test(`when a pool has the token 0 as non-stablecoin and token 1 as stablecoin,
    'isStablePool' should return false
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[0])).id;

  assert.assertTrue(!isStablePool(pool));
});

test(`when a pool has the token 0 as non-stablecoin and token 1 as non-stablecoin,
    'isStablePool' should return false
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000003")).id;

  assert.assertTrue(!isStablePool(pool));
});

test(`when a pool has the token 0 as wrapped native,
    'isWrappedNativePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.wrappedNativeAddress)).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;

  assert.assertTrue(isWrappedNativePool(pool));
});

test(`when a pool has the token 1 as wrapped native,
    'isWrappedNativePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.wrappedNativeAddress)).id;

  assert.assertTrue(isWrappedNativePool(pool));
});

test(`when a pool has the token 0 as non-wrapped native,
    and token 1 as non-wrapped native,
    'isWrappedNativePool' should return true
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000003")).id;

  assert.assertTrue(!isWrappedNativePool(pool));
});

test(`when a pool has the token 1 as stablecoin,
    and 'findStableToken' is called, it should
    return the token 1`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[1])).id;

  assert.bytesEquals(findStableToken(pool).id, pool.token1);
});

test(`when a pool has the token 0 as stablecoin,
    and 'findStableToken' is called, it should
    return the token 0`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.stablecoinsAddresses[0])).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;

  assert.bytesEquals(findStableToken(pool).id, pool.token0);
});

test(
  `when a pool has the token 0 as non-stablecoin,
    and token 1 also as non-stablecoin, 'findStableToken' should
    throw an error`,
  () => {
    let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

    pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
    pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000003")).id;

    findStableToken(pool);
  },
  true, // expected to fail flag
);

test(`When a pool has the token0 as wrapped native, 
    'findWrappedNative' should return the token 0
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString(CurrentNetwork.wrappedNativeAddress)).id;
  pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;

  assert.bytesEquals(findWrappedNative(pool).id, pool.token0);
});

test(`When a pool has the token1 as wrapped native, 
    'findWrappedNative' should return the token 1
    `, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

  pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
  pool.token1 = new Token(Address.fromString(CurrentNetwork.wrappedNativeAddress)).id;

  assert.bytesEquals(findWrappedNative(pool).id, pool.token1);
});

test(
  `when a pool has the token 0 as non-wrapped native,
    and token 1 as non-wrapped native,
    'findWrappedNative' should throw an error
    `,
  () => {
    let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));

    pool.token0 = new Token(Address.fromString("0x0000000000000000000000000000000000000002")).id;
    pool.token1 = new Token(Address.fromString("0x0000000000000000000000000000000000000003")).id;

    findWrappedNative(pool);
  },
  true, // expected to fail flag
);

test(`'getPoolHourlyDataId' should return the same id for passed timestamps within 1 hour of each other`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.createdAtTimestamp = BigInt.fromI32(1735139990);

  let timestamp1 = BigInt.fromU32(1735139990); // Wednesday, December 25, 2024 3:19:50 PM
  let timestamp2 = BigInt.fromU32(1735143350); // Wednesday, December 25, 2024 4:15:50 PM
  let timestamp3 = BigInt.fromU32(1735142150); // Wednesday, December 25, 2024 3:55:50 PM;
  let timestamp4 = BigInt.fromU32(1735142612); // Wednesday, December 25, 2024 4:03:32 PM

  let id1 = getPoolHourlyDataId(timestamp1, pool);
  let id2 = getPoolHourlyDataId(timestamp2, pool);
  let id3 = getPoolHourlyDataId(timestamp3, pool);
  let id4 = getPoolHourlyDataId(timestamp4, pool);

  assert.bytesEquals(id1, id2, "id1 and id2 should be equal");
  assert.bytesEquals(id3, id4, "id3 and id4 should be equal");
  assert.bytesEquals(id1, id3, "id1 and id3 should be equal");
  assert.bytesEquals(id1, id4, "id1 and id4 should be equal");
  assert.bytesEquals(id2, id4, "id2 and id4 should be equal");
});

test(`'getPoolHourlyDataId' should return different ids for passed timestamps more than 1 hour of each other`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.createdAtTimestamp = BigInt.fromI32(1735139990);

  let timestamp1 = BigInt.fromU32(1735140521); // Wednesday, December 25, 2024 3:28:41 PM
  let timestamp2 = BigInt.fromU32(1735147241); // Wednesday, December 25, 2024 5:20:41 PM

  let id1 = getPoolHourlyDataId(timestamp1, pool);
  let id2 = getPoolHourlyDataId(timestamp2, pool);

  assert.assertTrue(!(id1 == id2), "id1 and id2 should be different");
});

test(`'getPoolDailyDataId' should return the same id for passed timestamps within 1 day (24h) of each other`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.createdAtTimestamp = BigInt.fromI32(1735139990);

  let timestamp1 = BigInt.fromU32(1735141628); // Wednesday, December 25, 2024 3:47:08 PM
  let timestamp2 = BigInt.fromU32(1735224367); // Thursday, December 26, 2024 2:46:07 PM
  let timestamp3 = BigInt.fromU32(1735180957); // Thursday, December 26, 2024 2:42:37 AM
  let timestamp4 = BigInt.fromU32(1735152157); // Wednesday, December 25, 2024 6:42:37 PM

  let id1 = getPoolDailyDataId(timestamp1, pool);
  let id2 = getPoolDailyDataId(timestamp2, pool);
  let id3 = getPoolDailyDataId(timestamp3, pool);
  let id4 = getPoolDailyDataId(timestamp4, pool);

  assert.bytesEquals(id1, id2, "id1 and id2 should be equal");
  assert.bytesEquals(id3, id4, "id3 and id4 should be equal");
  assert.bytesEquals(id1, id3, "id1 and id3 should be equal");
  assert.bytesEquals(id1, id4, "id1 and id4 should be equal");
  assert.bytesEquals(id2, id4, "id2 and id4 should be equal");
});

test(`'getPoolDailyDataId' should return different ids for passed timestamps more than 1 day of each other`, () => {
  let pool = new Pool(Address.fromHexString("0x0000000000000000000000000000000000000001"));
  pool.createdAtTimestamp = BigInt.fromI32(1735139990);

  let timestamp1 = BigInt.fromU32(1735224367); // Thursday, December 26, 2024 2:46:07 PM
  let timestamp2 = BigInt.fromU32(1735310887); // Friday, December 27, 2024 2:48:07 PM

  let id1 = getPoolDailyDataId(timestamp1, pool);
  let id2 = getPoolDailyDataId(timestamp2, pool);

  assert.assertTrue(!(id1 == id2), "id1 and id2 should be different");
});

test("When calling 'isNativePool' and the pool token 0 is native(has zero address), it should return true", () => {
  let pool = new PoolMock();
  pool.token0 = Address.fromHexString("0x0000000000000000000000000000000000000000");
  pool.token1 = Address.fromHexString("0x0000000000000000000000000000000000000021");

  pool.save();

  let result = isNativePool(pool);

  assert.assertTrue(result);
});

test("When calling 'isNativePool' and the pool token 1 is native(has zero address), it should return true", () => {
  let pool = new PoolMock();
  pool.token1 = Address.fromHexString("0x0000000000000000000000000000000000000000");
  pool.token0 = Address.fromHexString("0x0000000000000000000000000000000000000021");

  pool.save();

  let result = isNativePool(pool);

  assert.assertTrue(result);
});

test("When calling 'isNativePool' and none of the tokens in the pool are native(has zero address), it should return false", () => {
  let pool = new PoolMock();
  pool.token1 = Address.fromHexString("0x0000000000000000000000000000000000000022");
  pool.token0 = Address.fromHexString("0x0000000000000000000000000000000000000021");

  pool.save();

  let result = isNativePool(pool);

  assert.assertTrue(!result, "isNativePool should return false");
});

test("When calling 'findNativeToken' and the token 1 is the native token(has zero address), it should return it", () => {
  let pool = new PoolMock();
  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000000"));

  token1.name = "NATIVE_TOKEN";
  pool.token1 = token1.id;
  pool.token0 = Address.fromHexString("0x0000000000000000000000000000000000000021");

  token1.save();
  pool.save();

  let result = findNativeToken(pool);

  assert.fieldEquals("Token", result.id.toHexString(), "name", token1.name);
});

test("When calling 'findNativeToken' and the token 0 is the native token(has zero address), it should return it", () => {
  let pool = new PoolMock();
  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000000"));

  token0.name = "NATIVE_TOKEN";
  pool.token0 = token0.id;
  pool.token1 = Address.fromHexString("0x0000000000000000000000000000000000000021");

  token0.save();
  pool.save();

  let result = findNativeToken(pool);

  assert.fieldEquals("Token", result.id.toHexString(), "name", token0.name);
});

test(
  "When calling `findNativeToken` but there are no native tokens in the pool, it should assert",
  () => {
    let pool = new PoolMock();
    pool.token0 = Address.fromHexString("0x0000000000000000000000000000000000000021");
    pool.token1 = Address.fromHexString("0x0000000000000000000000000000000000000022");

    pool.save();

    findNativeToken(pool);
  },
  true, // should throw flag
);
