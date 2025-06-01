import { Address, BigInt, Bytes } from "@graphprotocol/graph-ts";
import { Pool, Token } from "../../generated/schema";

import { ONE_HOUR_IN_SECONDS, ZERO_ADDRESS } from "./constants";
import { CurrentNetwork } from "./current-network";
import { areEqual } from "./string-utils";

export function isVariableWithStablePool(pool: Pool): boolean {
  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());
  let isToken1Stable = stablecoinsAddressesLowercased.includes(pool.token1.toHexString().toLowerCase());

  if ((isToken0Stable && !isToken1Stable) || (!isToken0Stable && isToken1Stable)) return true;

  return false;
}

export function isStablePool(pool: Pool): boolean {
  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());
  let isToken1Stable = stablecoinsAddressesLowercased.includes(pool.token1.toHexString().toLowerCase());

  if (isToken0Stable && isToken1Stable) return true;

  return false;
}

export function isWrappedNativePool(pool: Pool): boolean {
  let isToken0WrappedNative = areEqual(pool.token0.toHexString(), CurrentNetwork.wrappedNativeAddress);
  let isToken1WrappedNative = areEqual(pool.token1.toHexString(), CurrentNetwork.wrappedNativeAddress);

  if (isToken0WrappedNative || isToken1WrappedNative) return true;

  return false;
}

export function isNativePool(pool: Pool): boolean {
  let isToken0Native = areEqual(pool.token0.toHexString(), ZERO_ADDRESS);
  let isToken1Native = areEqual(pool.token1.toHexString(), ZERO_ADDRESS);

  if (isToken0Native || isToken1Native) return true;

  return false;
}

export function findStableToken(pool: Pool): Token {
  assert(
    isStablePool(pool) || isVariableWithStablePool(pool),
    `No mapped stablecoin token found in the pool; 
    maybe it's a bug?;
    maybe the stablecoin have not been added at the network whitelisted stablecoins list?`,
  );

  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());

  if (isToken0Stable) return new Token(pool.token0);
  return new Token(pool.token1);
}

export function findWrappedNative(pool: Pool): Token {
  assert(isWrappedNativePool(pool), "Pool does not have an wrapped native asset, no wrapped native token can be found");

  let isToken0WrappedNative = areEqual(pool.token0.toHexString(), CurrentNetwork.wrappedNativeAddress);

  if (isToken0WrappedNative) return new Token(pool.token0);

  return new Token(pool.token1);
}

export function findNativeToken(pool: Pool): Token {
  assert(isNativePool(pool), "Pool does not have an native asset, no native token can be found");

  let isToken0Native = areEqual(pool.token0.toHexString(), ZERO_ADDRESS);

  if (isToken0Native) return new Token(pool.token0);

  return new Token(pool.token1);
}

export function getPoolHourlyDataId(blockTimestampInSeconds: BigInt, pool: Pool): Bytes {
  let secondsPerHour = BigInt.fromU32(ONE_HOUR_IN_SECONDS);
  let hourId = blockTimestampInSeconds.minus(pool.createdAtTimestamp).div(secondsPerHour);

  let hourIdAddress = Address.fromBigInt(hourId).toHexString();
  let id = pool.id.concat(Bytes.fromHexString(hourIdAddress));

  return id;
}

export function getPoolDailyDataId(blockTimestamp: BigInt, pool: Pool): Bytes {
  let secondsPerDay = BigInt.fromU32(86_400);
  let dayId = blockTimestamp.minus(pool.createdAtTimestamp).div(secondsPerDay);

  let dayIdAddress = Address.fromBigInt(dayId).toHexString();
  let id = pool.id.concat(Bytes.fromHexString(dayIdAddress));

  return id;
}
