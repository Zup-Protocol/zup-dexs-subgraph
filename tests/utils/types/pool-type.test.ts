import { assert, test } from "matchstick-as";
import { PoolType } from "../../../src/utils/types/pool-type";

test("When selecting v3, it should be of the right value", () => {
  assert.stringEquals(PoolType.V3, "V3");
});

test("When selecting v4, it should be of the right value", () => {
  assert.stringEquals(PoolType.V4, "V4");
});
