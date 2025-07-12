import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { TickSpacing } from "../../../../../../generated/templates/CamelotV3Pool/CamelotV3Pool";
import { handleCamelotV3PoolTickSpacing } from "../../../../../../src/v3-pools/mappings/pool/dexs/camelot";
import { PoolMock, V3PoolMock } from "../../../../../mocks";

describe("CamelotV3PoolTickSpacing", () => {
  test("When the handler is called, it should update the pool tick spacing", () => {
    let newTickSpacing = 32567;
    let mockEvent = newMockEvent();
    let params = [new ethereum.EventParam("tickSpacing", ethereum.Value.fromI32(newTickSpacing))];
    let pool = new PoolMock();
    new V3PoolMock(Address.fromBytes(pool.id));

    let event = new TickSpacing(
      pool.id,
      mockEvent.logIndex,
      mockEvent.transactionLogIndex,
      mockEvent.logType,
      mockEvent.block,
      mockEvent.transaction,
      params,
      mockEvent.receipt,
    );

    handleCamelotV3PoolTickSpacing(event);

    assert.fieldEquals("V3Pool", pool.id.toHexString(), "tickSpacing", newTickSpacing.toString());
  });
});
