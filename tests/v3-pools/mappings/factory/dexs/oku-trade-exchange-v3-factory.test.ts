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
import { PoolCreated } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { ProtocolId } from "../../../../../src/utils/protocol-id";
import { handleOkuTradeV3PoolCreated } from "../../../../../src/v3-pools/mappings/factory/dexs/oku-trade-v3-factory";

export class PoolCreatedEventParams {
  token0: Address;
  token1: Address;
  feeTier: i32;
  tickSpacing: i32;
  pool: Address;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.feeTier = 500;
    this.tickSpacing = 875;
    this.pool = Address.fromString("0x0000000000000000000000000000000000000000");
  }

  setFeeTier(feeTier: i32): void {
    this.feeTier = feeTier;
  }

  setTickSpacing(tickSpacing: i32): void {
    this.tickSpacing = tickSpacing;
  }
}

export function createEvent(params: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreated {
  let mockEvent = newMockEvent();

  let token0Decimals: i32 = 6;
  let token1Decimals: i32 = 18;

  let eventparams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(params.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(params.token1)),
    new ethereum.EventParam("fee", ethereum.Value.fromI32(params.feeTier)),
    new ethereum.EventParam("tickSpacing", ethereum.Value.fromI32(params.tickSpacing)),
    new ethereum.EventParam("pool", ethereum.Value.fromAddress(params.pool)),
  ];

  let event = new PoolCreated(
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

  return event;
}

describe("oku-trade-v3-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already Oku created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    let event = createEvent();
    handleOkuTradeV3PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.okuTrade, "name", "Oku");
    assert.fieldEquals("Protocol", ProtocolId.okuTrade, "url", "https://oku.trade/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.okuTrade,
      "logo",
      "https://img.cryptorank.io/coins/oku_trade1715355283566.png",
    );

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", ProtocolId.okuTrade);
  });

  test(`When the handler is called and the network is scroll, the position manager address should be correct`, () => {
    dataSourceMock.setNetwork("scroll");

    let event = createEvent();
    handleOkuTradeV3PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.okuTrade,
      "positionManager",
      Address.fromString("0xB39002E4033b162fAc607fc3471E205FA2aE5967").toHexString(),
    );
  });

  test(`When the handler is called and the network is mainnet, the position manager address should be correct`, () => {
    dataSourceMock.setNetwork("mainnet");

    let event = createEvent();
    handleOkuTradeV3PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.okuTrade,
      "positionManager",
      Address.fromString("0xC36442b4a4522E871399CD717aBDD847Ab11FE88").toHexString(),
    );
  });

  test(`When the handler is called and the network is sepolia, the position manager address should be correct`, () => {
    dataSourceMock.setNetwork("sepolia");

    let event = createEvent();
    handleOkuTradeV3PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.okuTrade,
      "positionManager",
      Address.fromString("0x1238536071E1c677A632429e3655c799b22cDA52").toHexString(),
    );
  });
});
