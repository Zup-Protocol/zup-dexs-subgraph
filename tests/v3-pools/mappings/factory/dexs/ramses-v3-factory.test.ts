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
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/RamsesV3Factory/RamsesV3Factory";
import { ARBITRUM_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleRamsesV3PoolCreated } from "../../../../../src/v3-pools/mappings/factory/dexs/ramses-v3-factory";
import { V3PositionManagerAddress } from "../../../../../src/v3-pools/utils/v3-position-manager-address";
import { V3PoolMock } from "../../../../mocks";

export class PoolCreatedEventParams {
  token0: Address;
  token1: Address;
  pool: Address;
  fee: i32;
  tickSpacing: i32;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.pool = Address.fromString("0x0000000000000000000000000000000000000000");
    this.fee = 500;
    this.tickSpacing = 10;
  }

  setFee(fee: i32): void {
    this.fee = fee;
  }

  setTickSpacing(tickSpacing: i32): void {
    this.tickSpacing = tickSpacing;
  }
}

function createEvent(params: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreatedEvent {
  let mockEvent = newMockEvent();

  let token0Decimals: i32 = 6;
  let token1Decimals: i32 = 18;

  let eventparams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(params.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(params.token1)),
    new ethereum.EventParam("fee", ethereum.Value.fromI32(params.fee)),
    new ethereum.EventParam("tickSpacing", ethereum.Value.fromI32(params.tickSpacing)),
    new ethereum.EventParam("pool", ethereum.Value.fromAddress(params.pool)),
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

describe("ramses-v3-factory", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);
  });

  test("When the handler is called and there isn't an already Ramses V3 created protocol, it should create one with the correct values and assign it to the pool", () => {
    let event = createEvent();
    handleRamsesV3PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.ramsesV3, "name", "Ramses V3");
    assert.fieldEquals("Protocol", ProtocolId.ramsesV3, "url", "https://ramses.exchange/");
    assert.fieldEquals("Protocol", ProtocolId.ramsesV3, "logo", "https://app.ramses.exchange/favicon/favicon.ico");

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", ProtocolId.ramsesV3);
  });

  test("When the handler is called, the position manager address should be correct", () => {
    let event = createEvent();
    handleRamsesV3PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.ramsesV3,
      "positionManager",
      Address.fromString(V3PositionManagerAddress.ramses).toHexString(),
    );
  });

  test("When calling the handler it should set the correct fee and tick spacing for the pool", () => {
    let params = new PoolCreatedEventParams();
    params.setFee(250);
    params.setTickSpacing(5);
    new V3PoolMock(Address.fromBytes(params.pool));
    let event = createEvent(params);
    handleRamsesV3PoolCreated(event);

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "initialFeeTier", "250");
    assert.fieldEquals("Pool", event.params.pool.toHexString(), "currentFeeTier", "250");
    assert.fieldEquals("V3Pool", event.params.pool.toHexString(), "tickSpacing", "5");
  });

  test("When the handler is called multiple times, only one protocol entity should exist", () => {
    let event = createEvent();
    handleRamsesV3PoolCreated(event);
    handleRamsesV3PoolCreated(event);
    handleRamsesV3PoolCreated(event);

    assert.entityCount("Protocol", 1);
  });
});
