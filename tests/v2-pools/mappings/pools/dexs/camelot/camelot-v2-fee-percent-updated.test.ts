import { ethereum } from "@graphprotocol/graph-ts";
import { assert, describe, newMockEvent, test } from "matchstick-as";
import { FeePercentUpdated } from "../../../../../../generated/templates/CamelotV2Pool/CamelotV2Pool";
import { handleCamelotV2PoolFeePercentUpdated } from "../../../../../../src/v2-pools/mappings/pool/dexs/camelot";
import { PoolMock } from "../../../../../mocks";

class FeePercentUpdatedEventParams {
  token0FeePercent: i32;
  token1FeePercent: i32;

  constructor() {
    this.token0FeePercent = 1;
    this.token1FeePercent = 2;
  }

  setToken0FeePercent(token0FeePercent: i32): void {
    this.token0FeePercent = token0FeePercent;
  }

  setToken1FeePercent(token1FeePercent: i32): void {
    this.token1FeePercent = token1FeePercent;
  }
}
function createEvent(
  eventParams: FeePercentUpdatedEventParams = new FeePercentUpdatedEventParams(),
): FeePercentUpdated {
  let mockEvent = newMockEvent();

  let params = [
    new ethereum.EventParam("token0FeePercent", ethereum.Value.fromI32(eventParams.token0FeePercent)),
    new ethereum.EventParam("token1FeePercent", ethereum.Value.fromI32(eventParams.token1FeePercent)),
  ];

  let event = new FeePercentUpdated(
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

describe("camelot-v2-fee-percent-updated", () => {
  test(`When calling the handler, and the token0 fee percent
    is different from the token1 fee percent,
    it should get the average of the two and set the currentFeeTier
    in the uniswap fee decimals. The initialFeeTier should remain unchanged`, () => {
    let token0FeeTier = 500; // 0.5% in camelot fee decimals
    let token1FeeTier = 1000; // 1% in camelot fee decimals
    let pool = new PoolMock();
    let eventParams = new FeePercentUpdatedEventParams();
    eventParams.setToken0FeePercent(token0FeeTier);
    eventParams.setToken1FeePercent(token1FeeTier);
    let event = createEvent(eventParams);
    let feeTierAverageAsUniswapFeeTier = ((token0FeeTier + token1FeeTier) / 2) * 10;

    handleCamelotV2PoolFeePercentUpdated(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", feeTierAverageAsUniswapFeeTier.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });

  test(`When calling the handler, and the token0 fee percent
    is the same as the token1 fee percent, it should set the
    currentFeeTier with the token0 fee percent in the uniswap
    fee deicimals, and the initialFeeTier should remain unchanged`, () => {
    let token0FeeTier = 2000; // 2% in camelot fee decimals
    let token1FeeTier = 2000;
    let pool = new PoolMock();
    let eventParams = new FeePercentUpdatedEventParams();
    eventParams.setToken0FeePercent(token0FeeTier);
    eventParams.setToken1FeePercent(token1FeeTier);
    let event = createEvent(eventParams);
    let feeTierAsUniswapFeeTier = token0FeeTier * 10;

    handleCamelotV2PoolFeePercentUpdated(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", feeTierAsUniswapFeeTier.toString());
    assert.fieldEquals("Pool", pool.id.toHexString(), "initialFeeTier", pool.initialFeeTier.toString());
  });
});
