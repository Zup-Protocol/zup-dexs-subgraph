import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, dataSourceMock, describe, newMockEvent, test } from "matchstick-as";
import { PairCreated } from "../../../../../generated/BaseSwapV2Factory/UniswapV2Factory";
import { BASE_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleBaseSwapV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/baseswap-v2-factory";
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

describe("BaseSwapV2Factory", () => {
  beforeEach(() => {
    clearStore();

    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  });

  test("When calling the handler, it should create the right protocol entity (baseswap v2)", () => {
    handleBaseSwapV2PoolCreated(createEvent());

    assert.fieldEquals("Protocol", ProtocolId.baseSwapV2, "id", "base-swap-v2");
    assert.fieldEquals("Protocol", ProtocolId.baseSwapV2, "name", "BaseSwap V2");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.baseSwapV2,
      "logo",
      "https://avatars.githubusercontent.com/u/141787576?s=280&v=4",
    );
    assert.fieldEquals("Protocol", ProtocolId.baseSwapV2, "url", "https://baseswap.fi/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.baseSwapV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.baseSwap).toHexString(),
    );
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    handleBaseSwapV2PoolCreated(createEvent());
    handleBaseSwapV2PoolCreated(createEvent());
    handleBaseSwapV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });

  test("When calling the handler it should set the correct fee for the protocol", () => {
    let event = createEvent();
    handleBaseSwapV2PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pair.toHexString(), "initialFeeTier", "1700");
    assert.fieldEquals("Pool", event.params.pair.toHexString(), "currentFeeTier", "1700");
  });

  test("When calling the handler, it should assign the correct pair address to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PairCreatedEventParams();
    customParams.setPair(Address.fromString(poolId));

    handleBaseSwapV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "id", poolId);
  });
});
