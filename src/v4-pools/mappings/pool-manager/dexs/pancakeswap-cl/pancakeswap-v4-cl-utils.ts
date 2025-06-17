import { Bytes } from "@graphprotocol/graph-ts";

export function getPoolTickSpacingFromParameters(parameters: Bytes): i32 {
  const tickSpacingBytes = parameters.slice(27, 30);
  tickSpacingBytes.reverse();

  return Bytes.fromUint8Array(tickSpacingBytes).toI32();
}
