import { assert, beforeEach, clearStore, describe, test } from "matchstick-as";
import { PANCAKE_SWAP_ID } from "../../../../src/utils/constants";
import { handlePancakeSwapV3PoolCreated } from "../../../../src/v3-pools/mappings/factories";
import { createPoolCreatedEvent } from "../../../event-creators";

describe("pancakeswap-v3-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already PancakeSwap created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    let event = createPoolCreatedEvent();
    handlePancakeSwapV3PoolCreated(event);

    assert.fieldEquals("Protocol", PANCAKE_SWAP_ID, "name", "PancakeSwap");
    assert.fieldEquals("Protocol", PANCAKE_SWAP_ID, "url", "https://pancakeswap.finance");
    assert.fieldEquals(
      "Protocol",
      PANCAKE_SWAP_ID,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png",
    );

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", PANCAKE_SWAP_ID);
  });

  test(`When the handler is called and the pool assigned protocol id
    is not the PancakeSwap one, it should be updated to the pancakeswap one`, () => {
    let event = createPoolCreatedEvent(); // assuming it will assign an empty string to the protocol

    handlePancakeSwapV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", PANCAKE_SWAP_ID);
  });
});
