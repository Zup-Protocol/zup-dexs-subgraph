import { Address } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, dataSourceMock, describe, test } from "matchstick-as";
import { BASE_NETWORK_NAME } from "../../../src/common/constants";
import { V2FactoryAddress } from "../../../src/v2-pools/utils/v2-factory-address";

describe("V2 Factory Address Tests", () => {
  beforeEach(() => {
    clearStore();
  });

  test("When calling `aerodrome` in base network it should return the correct address", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    const expectedAddress = "0x420DD381b31aEf6683db6B902084cB0FFECe40Da";
    const actualAddress = V2FactoryAddress.aerodrome;

    assert.addressEquals(Address.fromString(expectedAddress), Address.fromString(actualAddress));
  });
});
