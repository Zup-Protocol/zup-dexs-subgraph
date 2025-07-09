import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, createMockedFunction, describe, newMockEvent, test } from "matchstick-as";
import { Swap as SwapEvent } from "../../../../../../generated/templates/AerodromeV3Pool/AerodromeV3Pool";
import { handleAerodromeV3PoolSwap } from "../../../../../../src/v3-pools/mappings/pool/dexs/aerodrome/aerodrome-v3-pool-swap";
import { PoolMock, V3PoolMock } from "../../../../../mocks";

// Helper to create a mock SwapEvent
function createSwapEvent(
  poolAddress: Address,
  amount0: BigInt = BigInt.fromI32(100),
  amount1: BigInt = BigInt.fromI32(200),
  sqrtPriceX96: BigInt = BigInt.fromI32(1),
  tick: i32 = 1,
): SwapEvent {
  let mockEvent = newMockEvent();
  let params = [
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(Address.zero())),
    new ethereum.EventParam("recipient", ethereum.Value.fromAddress(Address.zero())),
    new ethereum.EventParam("amount0", ethereum.Value.fromSignedBigInt(amount0)),
    new ethereum.EventParam("amount1", ethereum.Value.fromSignedBigInt(amount1)),
    new ethereum.EventParam("sqrtPriceX96", ethereum.Value.fromUnsignedBigInt(sqrtPriceX96)),
    new ethereum.EventParam("tick", ethereum.Value.fromI32(tick)),
    new ethereum.EventParam("liquidity", ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(1))),
  ];
  let event = new SwapEvent(
    poolAddress,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    params,
    mockEvent.receipt,
  );
  return event;
}

describe("AerodromeV3PoolSwap", () => {
  test("When calling the handler, it should get the pool fee from the pool contract and pass it to handleV3PoolSwap", () => {
    let poolId = Address.fromString("0x0000000000000000000000000000000000000a00");

    let pool = new PoolMock(poolId);

    let aerodromeFeeTier: i32 = 3000;

    createMockedFunction(poolId, "fee", "fee():(uint24)").returns([
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(aerodromeFeeTier)),
    ]);

    let event = createSwapEvent(poolId);
    new V3PoolMock(pool.id);

    handleAerodromeV3PoolSwap(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "feeTier", aerodromeFeeTier.toString());
  });
});
