import { ethereum } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { Fee as FeeEvent } from "../../../../../../generated/templates/QuickSwapV3Pool/QuickSwapV3Pool";
import { handleQuickSwapV3PoolFee } from "../../../../../../src/v3-pools/mappings/pool/dexs/quickswap/quickswap-v3-pool-fee";
import { PoolMock } from "../../../../../mocks";

class FeeEventParams {
  fee: i32;

  constructor() {
    this.fee = 100;
  }

  setFee(fee: i32): void {
    this.fee = fee;
  }
}

function createEvent(eventParams: FeeEventParams = new FeeEventParams()): FeeEvent {
  let mockEvent = newMockEvent();

  let params = [new ethereum.EventParam("fee", ethereum.Value.fromI32(eventParams.fee))];

  let event = new FeeEvent(
    new PoolMock().id,
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

describe("quickswap-v3-pool-fee", () => {
  test("When calling the handler, it should set currentFeeTier to the fee value. The initialFeeTier should remain unchanged", () => {
    let fee = 300;
    let pool = new PoolMock();
    let eventParams = new FeeEventParams();
    eventParams.setFee(fee);
    let event = createEvent(eventParams);

    handleQuickSwapV3PoolFee(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", fee.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });
});
