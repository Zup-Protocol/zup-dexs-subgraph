import { assert, beforeEach, clearStore, describe, test } from "matchstick-as";
import { UNISWAP_ID } from "../../../../src/utils/constants";
import { handleUniswapV3PoolCreated } from "../../../../src/v3-pools/mappings/factories";
import { createPoolCreatedEvent } from "../../../event-creators";

describe("uniswap-v3-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already Uniswap created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    let event = createPoolCreatedEvent();
    handleUniswapV3PoolCreated(event);

    assert.fieldEquals("Protocol", UNISWAP_ID, "name", "Uniswap");
    assert.fieldEquals("Protocol", UNISWAP_ID, "url", "https://uniswap.org");
    assert.fieldEquals(
      "Protocol",
      UNISWAP_ID,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
    );

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", UNISWAP_ID);
  });

  test(`When the handler is called and the pool assigned protocol id
    is not the Uniswap one, it should be updated to the Uniswap one`, () => {
    let event = createPoolCreatedEvent(); // assuming it will assign an empty string to the protocol

    handleUniswapV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", UNISWAP_ID);
  });
});
