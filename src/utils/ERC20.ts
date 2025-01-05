import { Address, ethereum, log } from "@graphprotocol/graph-ts";

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

    return result.value[0].toI32();
  }
}
