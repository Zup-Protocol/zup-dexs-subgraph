import { BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { hexToBigInt } from "./math";

export const ZERO_BIG_DECIMAL = BigDecimal.fromString("0");

export const ZERO_BIG_INT = BigInt.fromI32(0);

export const MAX_UINT256 = hexToBigInt("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");

export const ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";

export const ONE_BIG_INT = BigInt.fromI32(1);

export const Q96 = BigInt.fromI32(2).pow(96);

export const ONE_HOUR_IN_SECONDS = 3_600;

export const MAINNET_NETWORK_NAME = "mainnet";

export const UNICHAIN_NETWORK_NAME = "unichain";

export const SCROLL_NETWORK_NAME = "scroll";

export const SEPOLIA_NETWORK_NAME = "sepolia";

export const BASE_NETWORK_NAME = "base";

export const BNB_NETWORK_NAME = "bsc";
