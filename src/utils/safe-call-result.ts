import { ethereum } from "@graphprotocol/graph-ts";

export abstract class SafeCallResult {
  static fromNumber(result: ethereum.CallResult<i32>): i32 {
    if (result.reverted) return 0;

    return result.value;
  }
}
