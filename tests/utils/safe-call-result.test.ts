import { ethereum } from "@graphprotocol/graph-ts";
import { test } from "matchstick-as";
import { SafeCallResult } from "../../src/utils/safe-call-result";

test("When passsing a reverted call result to `fromNumber` it should return 0", () => {
  const revertedCallResult = new ethereum.CallResult<i32>();

  const result = SafeCallResult.fromNumber(revertedCallResult);

  assert(result == 0);
});

test("When passsing a non-reverted call result to `fromNumber` it should return thr value", () => {
  let expectedValue = 124;
  const revertedCallResult = ethereum.CallResult.fromValue<i32>(expectedValue);

  const result = SafeCallResult.fromNumber(revertedCallResult);

  assert(result == expectedValue);
});
