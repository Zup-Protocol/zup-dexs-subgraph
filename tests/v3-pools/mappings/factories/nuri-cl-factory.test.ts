import { assert, beforeEach, clearStore, describe, test } from "matchstick-as";
import { NURI_EXCHANGE_ID } from "../../../../src/utils/constants";
import { handleNuriCLPoolCreated } from "../../../../src/v3-pools/mappings/factories";
import { createPoolCreatedEvent } from "../../../event-creators";

describe("nuri-cl-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already Nuri Exchange created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    let event = createPoolCreatedEvent();
    handleNuriCLPoolCreated(event);

    assert.fieldEquals("Protocol", NURI_EXCHANGE_ID, "name", "Nuri Exchange");
    assert.fieldEquals("Protocol", NURI_EXCHANGE_ID, "url", "https://www.nuri.exchange/");
    assert.fieldEquals(
      "Protocol",
      NURI_EXCHANGE_ID,
      "logo",
      "https://www.nuri.exchange/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Femission.081c7921.png&w=64&q=75",
    );

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", NURI_EXCHANGE_ID);
  });

  test(`When the handler is called and the pool assigned protocol id
    is not the Nuri Exchange one, it should be updated to the Nuri Exchange one`, () => {
    let event = createPoolCreatedEvent(); // assuming it will assign an empty string to the protocol

    handleNuriCLPoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", NURI_EXCHANGE_ID);
  });
});
