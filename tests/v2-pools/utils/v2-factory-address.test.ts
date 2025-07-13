import { Address } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, dataSourceMock, describe, test } from "matchstick-as";
import { ARBITRUM_NETWORK_NAME, BASE_NETWORK_NAME, OP_NETWORK_NAME } from "../../../src/common/constants";
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

  test("When calling `ramses` in arbitrum network it should return the correct address", () => {
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    const expectedAddress = "0xAAA20D08e59F6561f242b08513D36266C5A29415";
    const actualAddress = V2FactoryAddress.ramses;

    assert.addressEquals(Address.fromString(expectedAddress), Address.fromString(actualAddress));
  });

  test("When calling `velodrome` in op network it should return the correct address", () => {
    dataSourceMock.setNetwork(OP_NETWORK_NAME);

    const expectedAddress = "0xF1046053aa5682b4F9a81b5481394DA16BE5FF5a";
    const actualAddress = V2FactoryAddress.velodrome;

    assert.addressEquals(Address.fromString(expectedAddress), Address.fromString(actualAddress));
  });
});
