import { assert, test } from "matchstick-as";
import { Protocol } from "../../generated/schema";
import { getOrCreateProtocol } from "../../src/utils/protocol-utils";

test(`When calling 'getOrCreateProtocol' and there is not a created protocol entity
    with the given id, it should create a new one with the given values`, () => {
  let protocolId = "1";
  let protocolName = "protocolName";
  let protocolUrl = "protocolUrl";
  let protocolLogo = "protocolLogo";

  getOrCreateProtocol(protocolId, protocolName, protocolUrl, protocolLogo);

  assert.fieldEquals("Protocol", protocolId, "name", protocolName);
  assert.fieldEquals("Protocol", protocolId, "url", protocolUrl);
  assert.fieldEquals("Protocol", protocolId, "logo", protocolLogo);
});

test(`When calling 'getOrCreateProtocol' and there is a created protocol entity
    with the given id, it should return the existing one`, () => {
  let protocolId = "1";
  let protocolName = "protocolName";
  let protocolUrl = "protocolUrl";
  let protocolLogo = "protocolLogo";

  let protocol = new Protocol(protocolId);
  protocol.name = protocolName;
  protocol.url = protocolUrl;
  protocol.logo = protocolLogo;
  protocol.save();

  let result = getOrCreateProtocol(protocolId, "", "", "");

  assert.stringEquals(result.id, protocolId);
  assert.stringEquals(result.name, protocolName);
  assert.stringEquals(result.url, protocolUrl);
  assert.stringEquals(result.logo, protocolLogo);
});
