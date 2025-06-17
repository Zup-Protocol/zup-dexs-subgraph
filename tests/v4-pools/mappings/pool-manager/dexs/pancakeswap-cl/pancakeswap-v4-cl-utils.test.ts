import { Bytes } from "@graphprotocol/graph-ts";
import { assert, test } from "matchstick-as";
import { getPoolTickSpacingFromParameters } from "../../../../../../src/v4-pools/mappings/pool-manager/dexs/pancakeswap-cl/pancakeswap-v4-cl-utils";

test(`'getPoolTickSpacingFromParameters' should return the right tick spacing
    from the parameters (starting at 16 byte and ending at 39)`, () => {
  let tickSpacing = getPoolTickSpacingFromParameters(
    Bytes.fromHexString("0x00000000000000000000000000000000000000000000000000000000000a0040"),
  );

  assert.i32Equals(tickSpacing, 10);
});
