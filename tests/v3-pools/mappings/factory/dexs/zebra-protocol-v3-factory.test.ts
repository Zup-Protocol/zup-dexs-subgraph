import { Address, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, createMockedFunction, describe, newMockEvent, test } from "matchstick-as";
import { PoolCreated } from "../../../../../generated/ZebraProtocolV3Factory/UniswapV3Factory";

import { ProtocolId } from "../../../../../src/utils/protocol-id";
import { handleZebraProtocolV3PoolCreated } from "../../../../../src/v3-pools/mappings/factory/dexs/zebra-protocol-v3-factory";

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

describe("zebra-v3-factory", () => {
  beforeEach(() => {
    clearStore();
  });

  test(`When the handler is called and there
        isn't an already zebra created protocol, it
        should create one with the correct values
        and assign it to the pool`, () => {
    let event = createEvent();
    handleZebraProtocolV3PoolCreated(event);

    assert.fieldEquals("Protocol", ProtocolId.zebra, "name", "Zebra");
    assert.fieldEquals("Protocol", ProtocolId.zebra, "url", "https://zebra.xyz");
    assert.fieldEquals("Protocol", ProtocolId.zebra, "logo", "https://icons.llamao.fi/icons/protocols/zebra");

    assert.fieldEquals("Pool", event.params.pool.toHexString(), "protocol", ProtocolId.zebra);
  });
});
