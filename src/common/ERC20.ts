import { Address, BigInt, ethereum, log } from "@graphprotocol/graph-ts";

export class ERC20 extends ethereum.SmartContract {
  static bind(address: Address): ERC20 {
    return new ERC20("ERC20", address);
  }

  safe_decimals(): i32 {
    let result = super.tryCall("decimals", "decimals():(uint8)", []);

    if (result.reverted) {
      log.error("Error getting decimals on ERC20 contract at address {}", [this._address.toHexString()]);

      return 0;
    }

    // handle tokens with very weird decimals that may not be possible be converted to i32
    if (result.value[0].toBigInt().gt(BigInt.fromI32(255))) {
      return 0;
    }

    return result.value[0].toI32();
  }

  safe_symbol(): string {
    let result = super.tryCall("symbol", "symbol():(string)", []);

    if (result.reverted) {
      log.error("Error getting symbol on ERC20 contract at address {}", [this._address.toHexString()]);

      return "";
    }

    return result.value[0].toString();
  }

  safe_name(): string {
    let result = super.tryCall("name", "name():(string)", []);

    if (result.reverted) {
      log.error("Error getting name on ERC20 contract at address {}", [this._address.toHexString()]);

      return "";
    }

    return result.value[0].toString();
  }
}
