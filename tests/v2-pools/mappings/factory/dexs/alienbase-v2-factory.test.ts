import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, dataSourceMock, describe, newMockEvent, test } from "matchstick-as";
import { PairCreated } from "../../../../../generated/AlienBaseV2Factory/UniswapV2Factory";
import { BASE_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleAlienBaseV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/alienbase-v2-factory";
import { V2PositionManagerAddress } from "../../../../../src/v2-pools/utils/v2-position-manager-address";

class PairCreatedEventParams {
  token0: Address;
  token1: Address;
  pair: Address;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.pair = Address.fromString("0x0000000000000000000000000000000000000000");
  }

  setPair(pair: Address): void {
    this.pair = pair;
  }
}

function createEvent(customParams: PairCreatedEventParams = new PairCreatedEventParams()): PairCreated {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(customParams.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(customParams.token1)),
    new ethereum.EventParam("pair", ethereum.Value.fromAddress(customParams.pair)),
  ];

  let event = new PairCreated(
    mockEvent.address,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    eventParams,
    mockEvent.receipt,
  );

  return event;
}

describe("AlienBaseV2Factory", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  });

  test("When calling the handler, it should create the right protocol entity (alienbase v2)", () => {
    handleAlienBaseV2PoolCreated(createEvent());

    assert.fieldEquals("Protocol", ProtocolId.alienBaseV2, "id", "alien-base-v2");
    assert.fieldEquals("Protocol", ProtocolId.alienBaseV2, "name", "Alien Base V2");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.alienBaseV2,
      "logo",
      "https://s2.coinmarketcap.com/static/img/coins/200x200/30543.png",
    );
    assert.fieldEquals("Protocol", ProtocolId.alienBaseV2, "url", "https://app.alienbase.xyz/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.alienBaseV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.alienBase).toHexString(),
    );
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    handleAlienBaseV2PoolCreated(createEvent());
    handleAlienBaseV2PoolCreated(createEvent());
    handleAlienBaseV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });

  test("When calling the handler, it should assign the correct pair address to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PairCreatedEventParams();
    customParams.setPair(Address.fromString(poolId));

    handleAlienBaseV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "id", poolId);
  });
});
