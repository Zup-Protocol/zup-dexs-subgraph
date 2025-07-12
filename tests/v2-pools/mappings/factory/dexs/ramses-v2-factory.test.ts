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
import { PairCreated } from "../../../../../generated/RamsesV2Factory/RamsesV2Factory";
import { ARBITRUM_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleRamsesV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/ramses-v2-factory";
import { V2PositionManagerAddress } from "../../../../../src/v2-pools/utils/v2-position-manager-address";

class PairCreatedEventParams {
  token0: Address;
  token1: Address;
  pair: Address;
  stable: boolean;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.pair = Address.fromString("0x0000000000000000000000000000000000000000");
    this.stable = false;
  }

  setPair(pair: Address): void {
    this.pair = pair;
  }

  setStable(stable: boolean): void {
    this.stable = stable;
  }
}

function createEvent(customParams: PairCreatedEventParams = new PairCreatedEventParams()): PairCreated {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(customParams.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(customParams.token1)),
    new ethereum.EventParam("stable", ethereum.Value.fromBoolean(customParams.stable)),
    new ethereum.EventParam("pair", ethereum.Value.fromAddress(customParams.pair)),
    new ethereum.EventParam("param4", ethereum.Value.fromSignedBigInt(BigInt.fromI32(0))),
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

describe("RamsesV2Factory", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(ARBITRUM_NETWORK_NAME);

    createMockedFunction(
      Address.fromString(createEvent().address.toHexString()),
      "pairFee",
      "pairFee(address):(uint256)",
    )
      .withArgs([ethereum.Value.fromAddress(Address.fromString("0x0000000000000000000000000000000000000000"))])
      .returns([ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(25))]);
  });

  test("When calling the handler, it should create the right protocol entity (ramses v2)", () => {
    handleRamsesV2PoolCreated(createEvent());

    assert.fieldEquals("Protocol", ProtocolId.ramsesV2, "id", "ramses-v2");
    assert.fieldEquals("Protocol", ProtocolId.ramsesV2, "name", "Ramses V2");
    assert.fieldEquals("Protocol", ProtocolId.ramsesV2, "logo", "https://app.ramses.exchange/favicon/favicon.ico");
    assert.fieldEquals("Protocol", ProtocolId.ramsesV2, "url", "https://ramses.exchange/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.ramsesV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.ramses).toHexString(),
    );
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    handleRamsesV2PoolCreated(createEvent());
    handleRamsesV2PoolCreated(createEvent());
    handleRamsesV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });

  test("When calling the handler, it should assign the correct pair address to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PairCreatedEventParams();
    customParams.setPair(Address.fromString(poolId));

    createMockedFunction(
      Address.fromString(createEvent().address.toHexString()),
      "pairFee",
      "pairFee(address):(uint256)",
    )
      .withArgs([ethereum.Value.fromAddress(Address.fromString(poolId))])
      .returns([ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(25))]);

    handleRamsesV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "id", poolId);
  });

  test("When calling the handler, it should set the pool fee got from the factory contract in Uniswap fee decimals", () => {
    let poolId = "0x0000000000000000000000000000000000000200";
    let customParams = new PairCreatedEventParams();
    let ramsesFeeTier = 19; // means 0.25% in ramses decimals, and 0.0025% in uniswap decimals
    customParams.setPair(Address.fromString(poolId));

    createMockedFunction(
      Address.fromString(createEvent().address.toHexString()),
      "pairFee",
      "pairFee(address):(uint256)",
    )
      .withArgs([ethereum.Value.fromAddress(Address.fromString(poolId))])
      .returns([ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(ramsesFeeTier))]);

    handleRamsesV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "initialFeeTier", (ramsesFeeTier * 100).toString());
  });

  test("When calling the handler and the pool is stable, it should set isStablePool correctly got from the event", () => {
    let customParams = new PairCreatedEventParams();
    customParams.setStable(true);

    handleRamsesV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", customParams.pair.toHexString(), "isStablePool", "true");
  });

  test("When calling the handler and the pool is not stable, it should set isStablePool correctly got from the event", () => {
    let customParams = new PairCreatedEventParams();
    customParams.setStable(false);

    handleRamsesV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", customParams.pair.toHexString(), "isStablePool", "false");
  });
});
