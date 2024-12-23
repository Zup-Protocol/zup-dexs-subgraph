import { Address, BigInt, Bytes } from "@graphprotocol/graph-ts";
import { Pool, Token } from "../../generated/schema";

import { CurrentNetwork } from "./current-network";
import { areEqual } from "./string-utils";

export function isVariableWithStablePool(pool: Pool): bool {
  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());
  let isToken1Stable = stablecoinsAddressesLowercased.includes(pool.token1.toHexString().toLowerCase());

  if ((isToken0Stable && !isToken1Stable) || (!isToken0Stable && isToken1Stable)) return true;

  return false;
}

export function isStablePool(pool: Pool): bool {
  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());
  let isToken1Stable = stablecoinsAddressesLowercased.includes(pool.token1.toHexString().toLowerCase());

  if (isToken0Stable && isToken1Stable) return true;

  return false;
}

export function isWrappedNativePool(pool: Pool): bool {
  let isToken0WrappedNative = areEqual(pool.token0.toHexString(), CurrentNetwork.wrappedNativeAddress);
  let isToken1WrappedNative = areEqual(pool.token1.toHexString(), CurrentNetwork.wrappedNativeAddress);

  if (isToken0WrappedNative || isToken1WrappedNative) return true;

  return false;
}

export function findStableToken(pool: Pool): Token {
  let stablecoinsAddressesLowercased = CurrentNetwork.stablecoinsAddresses.map<string>((address) =>
    address.toLowerCase(),
  );

  let isToken0Stable = stablecoinsAddressesLowercased.includes(pool.token0.toHexString().toLowerCase());

  if (isToken0Stable) return new Token(pool.token0);
  return new Token(pool.token1);
}

export function findWrappedNative(pool: Pool): Token {
  assert(isWrappedNativePool(pool), "Pool does not have an wrapped native asset, no wrapped native token can be found");

  if (areEqual(pool.token1.toHexString(), CurrentNetwork.wrappedNativeAddress)) return new Token(pool.token0);

  return new Token(pool.token1);
}

export function getPoolHourlyDataId(blockTimestamp: BigInt, poolCreationTimestamp: BigInt, poolAddress: Bytes): Bytes {
  let secondsPerHour = BigInt.fromU32(3_600);
  let hourId = blockTimestamp.minus(poolCreationTimestamp).div(secondsPerHour);

  let id = Address.fromHexString(Bytes.fromUTF8(`${poolAddress.toHexString()}-${hourId}`).toHex());

  return id;
}

export function getPoolDailyDataId(blockTimestamp: BigInt, poolCreationTimestamp: BigInt, poolAddress: Bytes): Bytes {
  let secondsPerDay = BigInt.fromU32(86_400);
  let dayId = blockTimestamp.minus(poolCreationTimestamp).div(secondsPerDay);

  let id = Address.fromHexString(Bytes.fromUTF8(`${poolAddress.toHexString()}-${dayId}`).toHex());

  return id;
}
