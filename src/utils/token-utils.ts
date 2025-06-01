import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { Token } from "../../generated/schema";
import { ERC20 } from "./ERC20";
import { ZERO_ADDRESS, ZERO_BIG_DECIMAL } from "./constants";
import { CurrentNetwork } from "./current-network";

export function tokenBaseAmount(token: Token): BigInt {
  return BigInt.fromU32(10).pow(token.decimals as u8);
}

export function formatFromTokenAmount(amount: BigInt, token: Token): BigDecimal {
  return amount.toBigDecimal().div(
    BigInt.fromU32(10)
      .pow(token.decimals as u8)
      .toBigDecimal(),
  );
}

export function getOrCreateTokenEntity(tokenAddress: Address): Token {
  let tokenEntity = Token.load(tokenAddress);
  const isNativeToken: bool = tokenAddress.toHexString() == ZERO_ADDRESS;

  if (tokenEntity == null) {
    tokenEntity = new Token(tokenAddress);

    if (isNativeToken) {
      let nativeToken = CurrentNetwork.nativeToken();

      tokenEntity.decimals = nativeToken.decimals;
      tokenEntity.symbol = nativeToken.symbol;
      tokenEntity.name = nativeToken.name;
      tokenEntity.usdPrice = ZERO_BIG_DECIMAL;
      tokenEntity.totalValuePooledUsd = ZERO_BIG_DECIMAL;
      tokenEntity.totalTokenPooledAmount = ZERO_BIG_DECIMAL;

      tokenEntity.save();
      return tokenEntity;
    }

    let tokenContract = ERC20.bind(tokenAddress);

    tokenEntity.decimals = tokenContract.safe_decimals();
    tokenEntity.symbol = tokenContract.safe_symbol();
    tokenEntity.name = tokenContract.safe_name();
    tokenEntity.usdPrice = ZERO_BIG_DECIMAL;
    tokenEntity.totalValuePooledUsd = ZERO_BIG_DECIMAL;
    tokenEntity.totalTokenPooledAmount = ZERO_BIG_DECIMAL;

    tokenEntity.save();
  }

  return tokenEntity;
}
