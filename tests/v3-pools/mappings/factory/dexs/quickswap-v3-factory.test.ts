import { Address, ethereum } from "@graphprotocol/graph-ts";
import {
  assert,
  beforeEach,
  clearStore,
  createMockedFunction,
  dataSourceMock,
  describe,
  newMockEvent,
  test,
} from "matchstick-as";
import { Pool as PoolCreatedEvent } from "../../../../../generated/QuickSwapV3Factory/QuickSwapV3Factory";
import { POLYGON_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleQuickSwapV3PoolCreated } from "../../../../../src/v3-pools/mappings/factory/dexs/quickswap-v3-factory";
import { V3PositionManagerAddress } from "../../../../../src/v3-pools/utils/v3-position-manager-address";

export class PoolCreatedEventParams {
  token0: Address;
  token1: Address;
  pool: Address;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.pool = Address.fromString("0x0000000000000000000000000000000000000000");
  }
}

function createEvent(params: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreatedEvent {
  let mockEvent = newMockEvent();

  let token0Decimals: i32 = 6;
  let token1Decimals: i32 = 18;

  let eventparams = [
    new ethereum.EventParam("pool", ethereum.Value.fromAddress(params.pool)),
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(params.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(params.token1)),
  ];

  let event = new PoolCreatedEvent(
    mockEvent.address,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    eventparams,
    mockEvent.receipt,
  );

  createMockedFunction(params.token0, "decimals", "decimals():(uint8)").returns([
    ethereum.Value.fromI32(token0Decimals),
  ]);

  createMockedFunction(params.token1, "decimals", "decimals():(uint8)").returns([
    ethereum.Value.fromI32(token1Decimals),
  ]);

  createMockedFunction(params.token0, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
  createMockedFunction(params.token1, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
  createMockedFunction(params.token0, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
  createMockedFunction(params.token1, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);

  return event;
}

describe("quickswap-v3-factory", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);
  });

  test("When the handler is called and there isn't an already QuickSwap V3 created protocol, it should create one with the correct values and assign it to the pool", () => {
    let event = createEvent();
    handleQuickSwapV3PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.quickSwapV3, "name", "QuickSwap V3");
    assert.fieldEquals("Protocol", ProtocolId.quickSwapV3, "url", "https://quickswap.exchange/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.quickSwapV3,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/quickswap.exchange.png",
    );

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", ProtocolId.quickSwapV3);
  });

  test("When the handler is called and the network is polygon, the position manager address should be correct", () => {
    let event = createEvent();
    handleQuickSwapV3PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.quickSwapV3,
      "positionManager",
      Address.fromString(V3PositionManagerAddress.quickSwap).toHexString(),
    );
  });

  test("When the handler is called multiple times, only one protocol entity should exist", () => {
    let event = createEvent();
    handleQuickSwapV3PoolCreated(event);
    handleQuickSwapV3PoolCreated(event);
    handleQuickSwapV3PoolCreated(event);

    assert.entityCount("Protocol", 1);
  });
});
