import { Address } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, describe, test } from "matchstick-as";
import { Protocol } from "../../generated/schema";
import { getOrCreateProtocol } from "../../src/utils/protocol-utils";

describe("Protocol Utils", () => {
  beforeEach(() => {
    clearStore();
  });
  test(`When calling 'getOrCreateProtocol' and there is not a created protocol entity
      with the given id, it should create a new one with the given values`, () => {
    let protocolId = "1";
    let protocolName = "protocolName";
    let protocolUrl = "protocolUrl";
    let protocolLogo = "protocolLogo";
    let protocolPositionManager = "0x0000000000000000000000000000000000000000";
    let permit2 = "0x0000000000000000000000000000000000000001";
    let v4StateView = "0x0000000000000000000000000000000000000002";
    let v4PoolManager = "0x0000000000000000000000000000000000000003";

    getOrCreateProtocol(
      protocolId,
      protocolName,
      protocolUrl,
      protocolLogo,
      protocolPositionManager,
      permit2,
      v4StateView,
      v4PoolManager,
    );

    assert.fieldEquals("Protocol", protocolId, "name", protocolName);
    assert.fieldEquals("Protocol", protocolId, "url", protocolUrl);
    assert.fieldEquals("Protocol", protocolId, "logo", protocolLogo);
    assert.fieldEquals("Protocol", protocolId, "positionManager", protocolPositionManager);
    assert.fieldEquals("Protocol", protocolId, "permit2", permit2);
    assert.fieldEquals("Protocol", protocolId, "v4StateView", v4StateView);
    assert.fieldEquals("Protocol", protocolId, "v4PoolManager", v4PoolManager);
  });

  test(`When calling 'getOrCreateProtocol' with nullable values not passed and there is not a created protocol entity
      with the given id, it should create a new one with the given values, keeping nulls`, () => {
    let protocolId = "1";
    let protocolName = "protocolName";
    let protocolUrl = "protocolUrl";
    let protocolLogo = "protocolLogo";
    let protocolPositionManager = "0x0000000000000000000000000000000000000000";

    getOrCreateProtocol(protocolId, protocolName, protocolUrl, protocolLogo, protocolPositionManager);

    assert.fieldEquals("Protocol", protocolId, "name", protocolName);
    assert.fieldEquals("Protocol", protocolId, "url", protocolUrl);
    assert.fieldEquals("Protocol", protocolId, "logo", protocolLogo);
    assert.fieldEquals("Protocol", protocolId, "positionManager", protocolPositionManager);
    assert.fieldEquals("Protocol", protocolId, "permit2", "null");
    assert.fieldEquals("Protocol", protocolId, "v4StateView", "null");
    assert.fieldEquals("Protocol", protocolId, "v4PoolManager", "null");
  });

  test(`When calling 'getOrCreateProtocol' and there is a created protocol entity
      with the given id, it should return the existing one`, () => {
    let protocolId = "1";
    let protocolName = "protocolName";
    let protocolUrl = "protocolUrl";
    let protocolLogo = "protocolLogo";
    let protocolPositionManager = "0x0000000000000000000000000000000000000000";

    let protocol = new Protocol(protocolId);
    protocol.name = protocolName;
    protocol.url = protocolUrl;
    protocol.logo = protocolLogo;
    protocol.positionManager = Address.fromString(protocolPositionManager);
    protocol.save();

    let result = getOrCreateProtocol(protocolId, "", "", "", "0x0000000000000000000000000000000000000001");

    assert.stringEquals(result.id, protocolId);
    assert.stringEquals(result.name, protocolName);
    assert.stringEquals(result.url, protocolUrl);
    assert.stringEquals(result.logo, protocolLogo);
    assert.stringEquals(result.positionManager.toHexString(), protocolPositionManager);
  });
});
