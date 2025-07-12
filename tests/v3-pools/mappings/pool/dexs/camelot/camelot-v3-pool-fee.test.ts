import { ethereum } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { Fee as FeeEvent } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";
import { handleCamelotV3PoolFee } from "../../../../../../src/v3-pools/mappings/pool/dexs/camelot/camelot-v3-pool-fee";
import { PoolMock } from "../../../../../mocks";

class FeeEventParams {
  feeOtz: i32;
  feeZto: i32;

  constructor() {
    this.feeOtz = 1;
    this.feeZto = 2;
  }

  setFeeOtz(feeOtz: i32): void {
    this.feeOtz = feeOtz;
  }

  setFeeZto(feeZto: i32): void {
    this.feeZto = feeZto;
  }
}

function createEvent(eventParams: FeeEventParams = new FeeEventParams()): FeeEvent {
  let mockEvent = newMockEvent();

  let params = [
    new ethereum.EventParam("feeOtz", ethereum.Value.fromI32(eventParams.feeOtz)),
    new ethereum.EventParam("feeZto", ethereum.Value.fromI32(eventParams.feeZto)),
  ];

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

describe("camelot-v3-pool-fee", () => {
  test(`When calling the handler, and feeOtz is different from feeZto,
    it should set currentFeeTier to the average of both.
    The initialFeeTier should remain unchanged`, () => {
    let feeOtz = 100;
    let feeZto = 500;
    let pool = new PoolMock();
    let eventParams = new FeeEventParams();
    eventParams.setFeeOtz(feeOtz);
    eventParams.setFeeZto(feeZto);
    let event = createEvent(eventParams);
    let expectedFeeTier = (feeOtz + feeZto) / 2;

    handleCamelotV3PoolFee(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", expectedFeeTier.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });

  test(`When calling the handler, and feeOtz is the same as feeZto,
    it should set currentFeeTier to feeOtz. The initialFeeTier should remain unchanged`, () => {
    let feeOtz = 300;
    let feeZto = 300;
    let pool = new PoolMock();
    let eventParams = new FeeEventParams();
    eventParams.setFeeOtz(feeOtz);
    eventParams.setFeeZto(feeZto);
    let event = createEvent(eventParams);

    handleCamelotV3PoolFee(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", feeOtz.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });
});
