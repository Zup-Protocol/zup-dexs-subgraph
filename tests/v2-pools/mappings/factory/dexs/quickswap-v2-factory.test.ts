import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts";
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

import { PairCreated as PairCreatedEvent } from "../../../../../generated/QuickSwapV2Factory/UniswapV2Factory";
import { POLYGON_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleQuickSwapV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/quickswap-v2-factory";
import { V2PositionManagerAddress } from "../../../../../src/v2-pools/utils/v2-position-manager-address";

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

function createEvent(params: PoolCreatedEventParams = new PoolCreatedEventParams()): PairCreatedEvent {
  let mockEvent = newMockEvent();

  let token0Decimals: i32 = 6;
  let token1Decimals: i32 = 18;

  let eventparams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(params.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(params.token1)),
    new ethereum.EventParam("pair", ethereum.Value.fromAddress(params.pool)),
    new ethereum.EventParam("param3", ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0))),
  ];

  let event = new PairCreatedEvent(
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

describe("quickswap-v2-factory", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(POLYGON_NETWORK_NAME);
  });

  test(`When the handler is called and there isn't an already QuickSwap created protocol, it should create one with the correct values and assign it to the pool`, () => {
    let event = createEvent();
    handleQuickSwapV2PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.quickSwapV2, "name", "QuickSwap V2");
    assert.fieldEquals("Protocol", ProtocolId.quickSwapV2, "url", "https://quickswap.exchange/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.quickSwapV2,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/quickswap.exchange.png",
    );

    assert.fieldEquals("Pool", event.params.pair.toHexString(), "protocol", ProtocolId.quickSwapV2);
  });

  test("When the handler is called, the position manager address should be correct", () => {
    let event = createEvent();
    handleQuickSwapV2PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.quickSwapV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.quickSwap).toHexString(),
    );
  });

  test("When calling the handler it should set the correct fee for the protocol", () => {
    let event = createEvent();
    handleQuickSwapV2PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pair.toHexString(), "initialFeeTier", "3000");
    assert.fieldEquals("Pool", event.params.pair.toHexString(), "currentFeeTier", "3000");
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    handleQuickSwapV2PoolCreated(createEvent());
    handleQuickSwapV2PoolCreated(createEvent());
    handleQuickSwapV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });
});
