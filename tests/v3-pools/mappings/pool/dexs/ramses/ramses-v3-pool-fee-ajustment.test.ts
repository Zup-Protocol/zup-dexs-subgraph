import { ethereum } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { FeeAdjustment } from "../../../../../../generated/templates/RamsesV3Pool/RamsesV3Pool";
import { handleRamsesV3PoolFeeAdjustment } from "../../../../../../src/v3-pools/mappings/pool/dexs/ramses";
import { PoolMock } from "../../../../../mocks";

describe("Ramses V3 Pool fee adjustment", () => {
  test(`When the handler is called, it should update the pool current fee tier.
        the initial fee tier should remain unchanged`, () => {
    let mockEvent = newMockEvent();
    let pool = new PoolMock();
    let newFeeTier = 43567;
    let params = [
      new ethereum.EventParam("oldFee", ethereum.Value.fromI32(pool.initialFeeTier)),
      new ethereum.EventParam("newFee", ethereum.Value.fromI32(newFeeTier)),
    ];

    let event = new FeeAdjustment(
      pool.id,
      mockEvent.logIndex,
      mockEvent.transactionLogIndex,
      mockEvent.logType,
      mockEvent.block,
      mockEvent.transaction,
      params,
      mockEvent.receipt,
    );

    handleRamsesV3PoolFeeAdjustment(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", newFeeTier.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });
});
