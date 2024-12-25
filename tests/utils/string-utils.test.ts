import { assert, test } from "matchstick-as";
import { areEqual } from "../../src/utils/string-utils";

test("when two strings are equal `areEqual` should return true", () => {
  const a = "a";
  const b = "a";

  assert.assertTrue(areEqual(a, b));
});

test("when two strings are not equal `areEqual` should return false", () => {
  const a = "a";
  const b = "b";

  assert.assertTrue(!areEqual(a, b));
});
