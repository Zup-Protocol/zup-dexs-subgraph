import { Address, BigInt, ethereum } from "@graphprotocol/graph-ts";
import { assert, dataSourceMock, describe, newMockEvent, test } from "matchstick-as";
import { PoolCreated } from "../../../../../generated/AerodromeV2Factory/AerodromeV2Factory";
import { BASE_NETWORK_NAME } from "../../../../../src/common/constants";
import { ProtocolId } from "../../../../../src/common/protocol-id";
import { handleAerodromeV2PoolCreated } from "../../../../../src/v2-pools/mappings/factory/dexs/aerodrome-v2-factory";
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

function createEvent(customParams: PoolCreatedEventParams = new PoolCreatedEventParams()): PoolCreated {
  let mockEvent = newMockEvent();

  let eventParams = [
    new ethereum.EventParam("token0", ethereum.Value.fromAddress(customParams.token0)),
    new ethereum.EventParam("token1", ethereum.Value.fromAddress(customParams.token1)),
    new ethereum.EventParam("stable", ethereum.Value.fromBoolean(customParams.stable)),
    new ethereum.EventParam("pool", ethereum.Value.fromAddress(customParams.pool)),
    new ethereum.EventParam("param4", ethereum.Value.fromSignedBigInt(customParams.param4)),
  ];

  let event = new PoolCreated(
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

describe("", () => {
  test("When calling the handler, it should create the right protocol entity (aerodrome v2)", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    handleAerodromeV2PoolCreated(createEvent());

    assert.fieldEquals("Protocol", ProtocolId.aerodromeV2, "id", "aerodrome-v2");
    assert.fieldEquals("Protocol", ProtocolId.aerodromeV2, "name", "Aerodrome V2");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.aerodromeV2,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/aerodrome.finance.png",
    );
    assert.fieldEquals("Protocol", ProtocolId.aerodromeV2, "url", "https://aerodrome.finance");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.aerodromeV2,
      "positionManager",
      Address.fromString(V2PositionManagerAddress.aerodrome).toHexString(),
    );
  });

  test("When calling the handler multiple times, it should reuse the same protocol entity, instead of creating a new one", () => {
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);

    handleAerodromeV2PoolCreated(createEvent());
    handleAerodromeV2PoolCreated(createEvent());
    handleAerodromeV2PoolCreated(createEvent());
    handleAerodromeV2PoolCreated(createEvent());
    handleAerodromeV2PoolCreated(createEvent());

    assert.entityCount("Protocol", 1);
  });

  test("When calling the handler with the stable param true, it should assign it to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PoolCreatedEventParams();
    customParams.setStable(true);
    customParams.setPool(Address.fromString(poolId));

    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    handleAerodromeV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "_aerodromeV2StablePool", "true");
  });

  test("When calling the handler with the stable param false, it should assign it to the pool entity", () => {
    let poolId = "0x0000000000000000000000000000000000000100";
    let customParams = new PoolCreatedEventParams();
    customParams.setStable(false);
    customParams.setPool(Address.fromString(poolId));

    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
    handleAerodromeV2PoolCreated(createEvent(customParams));

    assert.fieldEquals("Pool", poolId, "_aerodromeV2StablePool", "false");
  });
});
