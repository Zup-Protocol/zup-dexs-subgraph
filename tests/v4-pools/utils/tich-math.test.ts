import { BigInt } from "@graphprotocol/graph-ts";
import { assert, describe, test } from "matchstick-as/assembly/index";
import { TickMath } from "../../../src/v4-pools/utils/tick-math";

describe("TickMath", () => {
  test("MIN_TICK and MAX_TICK are correct", () => {
    assert.i32Equals(TickMath.MIN_POOL_TICK as i32, -887272);
    assert.i32Equals(TickMath.MAX_POOL_TICK as i32, 887272);
  });

  describe("getSqrtRatioAtTick", () => {
    test("returns the correct value for tick 0", () => {
      const result = TickMath.getSqrtRatioAtTick(0);
      assert.bigIntEquals(result, BigInt.fromString("79228162514264337593543950336")); // 1.0000 in Q96
    });

    test("returns the correct value for tick 1", () => {
      const result = TickMath.getSqrtRatioAtTick(1);
      assert.bigIntEquals(result, BigInt.fromString("79232123823359799118286999568")); // ~1.0001 in Q96
    });

    test("returns the correct value for tick -1", () => {
      const result = TickMath.getSqrtRatioAtTick(-1);
      assert.bigIntEquals(result, BigInt.fromString("79224201403219477170569942574")); // ~0.9999 in Q96
    });

    test("returns the correct value for MIN_TICK", () => {
      const result = TickMath.getSqrtRatioAtTick(TickMath.MIN_POOL_TICK as i32);
      assert.bigIntEquals(result, TickMath.MIN_POOL_SQRT_RATIO);
    });

    test("returns the correct value for MAX_TICK", () => {
      const result = TickMath.getSqrtRatioAtTick(TickMath.MAX_POOL_TICK as i32);
      assert.bigIntEquals(result, TickMath.MAX_POOL_SQRT_RATIO);
    });

    test("returns the correct value for a large positive tick", () => {
      const result = TickMath.getSqrtRatioAtTick(887000);
      assert.bigIntEquals(result, BigInt.fromString("1441706552580435738372324372445843561633831752204"));
    });

    test("returns the correct value for a large negative tick", () => {
      const result = TickMath.getSqrtRatioAtTick(-887000);
      assert.bigIntEquals(result, BigInt.fromString("4353938549"));
    });
  });
});
