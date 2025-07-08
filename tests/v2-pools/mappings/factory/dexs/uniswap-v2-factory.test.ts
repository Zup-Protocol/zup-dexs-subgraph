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

import { PairCreated as PoolCreated } from "../../../../../generated/UniswapV2Factory/UniswapV2Factory";
import { UNICHAIN_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleUniswapV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/uniswap/uniswap-v2-factory";

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

function createEvent(params: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreated {
  let mockEvent = newMockEvent();

  let token0Decimals: i32 = 6;
  let token1Decimals: i32 = 18;

  let eventparams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(params.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(params.token1)),
    new ethereum.EventParam("pair", ethereum.Value.fromAddress(params.pool)),
    new ethereum.EventParam("param3", ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(0))),
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

  createMockedFunction(params.token0, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
  createMockedFunction(params.token1, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
  createMockedFunction(params.token0, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
  createMockedFunction(params.token1, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);

  return event;
}

describe("uniswap-v2-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already Uniswap created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    let event = createEvent();
    handleUniswapV2PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.uniswapV2, "name", "Uniswap V2");
    assert.fieldEquals("Protocol", ProtocolId.uniswapV2, "url", "https://uniswap.org/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.uniswapV2,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
    );

    assert.fieldEquals("Pool", event.params.pair.toHexString(), "protocol", ProtocolId.uniswapV2);
  });

  test(`When the handler is called and the network is unichain, the position manager address should be correct`, () => {
    dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

    let event = createEvent();
    handleUniswapV2PoolCreated(event);

    assert.fieldEquals(
      "Protocol",
      ProtocolId.uniswapV2,
      "positionManager",
      Address.fromString("0x284f11109359a7e1306c3e447ef14d38400063ff").toHexString(),
    );
  });
});
