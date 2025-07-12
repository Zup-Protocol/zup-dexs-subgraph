import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { FeeAdjustment } from "../../../../../../generated/templates/NuriExchangeV3Pool/NuriExchangeV3Pool";
import { handleNuriExchangeV3PoolFeeAdjustment } from "../../../../../../src/v3-pools/mappings/pool/dexs/nuri-exchange";
import { PoolMock } from "../../../../../mocks";

function createEvent(pool: Address, newFee: i32 = 3): FeeAdjustment {
  let mockEvent = newMockEvent();

  let params = [
    new ethereum.EventParam("oldFee", ethereum.Value.fromI32(2)),
    new ethereum.EventParam("newFee", ethereum.Value.fromI32(newFee)),
  ];

  let event = new FeeAdjustment(
    pool,
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

test(`When the handler is called, it should modify the 'currentFeeTier'
  variable, and remain the 'initialFeeTier' unchanged`, () => {
  let oldFee = 909;
  let expectedNewFee = 1245;
  let pool = new PoolMock();
  pool.currentFeeTier = oldFee;

  let event = createEvent(Address.fromBytes(pool.id), expectedNewFee);

  handleNuriExchangeV3PoolFeeAdjustment(event);

  assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", expectedNewFee.toString());
  assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
});
