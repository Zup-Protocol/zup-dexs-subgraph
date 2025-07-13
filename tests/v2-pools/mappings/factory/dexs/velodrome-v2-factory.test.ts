import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, beforeEach, clearStore, dataSourceMock, describe, newMockEvent, test } from "matchstick-as";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/VelodromeV2Factory/VelodromeV2Factory";
import { OP_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleVelodromeV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/velodrome-v2-factory";
import { V2PositionManagerAddress } from "../../../../../src/v2-pools/utils/v2-position-manager-address";

class PoolCreatedEventParams {
  token0: Address;
  token1: Address;
  stable: boolean;
  pool: Address;
  param4: BigInt;

  constructor() {
    this.token0 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.token1 = Address.fromString("0x0000000000000000000000000000000000000000");
    this.stable = false;
    this.pool = Address.fromString("0x0000000000000000000000000000000000000000");
    this.param4 = BigInt.fromI32(0);
  }

  setStable(stable: boolean): void {
    this.stable = stable;
  }

  setPool(pool: Address): void {
    this.pool = pool;
  }
}

function createEvent(customParams: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreatedEvent {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(customParams.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(customParams.token1)),
    new ethereum.EventParam("stable", ethereum.Value.fromBoolean(customParams.stable)),
    new ethereum.EventParam("pool", ethereum.Value.fromAddress(customParams.pool)),
    new ethereum.EventParam("param4", ethereum.Value.fromSignedBigInt(customParams.param4)),
  ];

  let event = new PoolCreatedEvent(
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

describe("Velodrome V2 Factory", () => {
  beforeEach(() => {
    clearStore();

    dataSourceMock.setNetwork(OP_NETWORK_NAME);
  });

  test("When calling the handler, it should create the right protocol entity (velodrome v2)", () => {
    handleVelodromeV2PoolCreated(createEvent());

    assert.fieldEquals("Protocol", ProtocolId.velodromeV2, "id", "velodrome-v2");
    assert.fieldEquals("Protocol", ProtocolId.velodromeV2, "name", "Velodrome V2");
    assert.fieldEquals("Protocol", ProtocolId.velodromeV2, "logo", "https://icons.llamao.fi/icons/protocols/velodrome");
    assert.fieldEquals("Protocol", ProtocolId.velodromeV2, "url", "https://velodrome.finance/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.velodromeV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.velodrome).toHexString(),
    );
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    handleVelodromeV2PoolCreated(createEvent());
    handleVelodromeV2PoolCreated(createEvent());
    handleVelodromeV2PoolCreated(createEvent());
    handleVelodromeV2PoolCreated(createEvent());
    handleVelodromeV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });

  test("When calling the handler with the stable param true, it should assign it to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PoolCreatedEventParams();
    customParams.setStable(true);
    customParams.setPool(Address.fromString(poolId));

    handleVelodromeV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "isStablePool", "true");
  });

  test("When calling the handler with the stable param false, it should assign it to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PoolCreatedEventParams();
    customParams.setStable(false);
    customParams.setPool(Address.fromString(poolId));

    handleVelodromeV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "isStablePool", "false");
  });
});
