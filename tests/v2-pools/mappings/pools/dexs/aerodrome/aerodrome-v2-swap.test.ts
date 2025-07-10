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
import { Swap as SwapEvent } from "../../../../../../generated/templates/AerodromeV2Pool/AerodromeV2Pool";
import { BASE_NETWORK_NAME } from "../../../../../../src/common/constants";
import { handleAerodromeV2Swap } from "../../../../../../src/v2-pools/mappings/pool/dexs/aerodrome";
import { V2FactoryAddress } from "../../../../../../src/v2-pools/utils/v2-factory-address";
import { PoolMock } from "../../../../../mocks";

class SwapEventParams {
  eventAddress: Address;
  sender: Address;
  to: Address;
  amount0In: BigInt;
  amount1In: BigInt;
  amount0Out: BigInt;
  amount1Out: BigInt;
  constructor() {
    this.eventAddress = Address.fromString("0x0000000000000000000000000000000000000001");
    this.sender = Address.fromString("0x0000000000000000000000000000000000000001");
    this.to = Address.fromString("0x0000000000000000000000000000000000000002");
    this.amount0In = BigInt.fromI32(1000);
    this.amount1In = BigInt.fromI32(2000);
    this.amount0Out = BigInt.fromI32(3000);
    this.amount1Out = BigInt.fromI32(4000);
  }

  setEventAddress(eventAddress: Address): void {
    this.eventAddress = eventAddress;
  }
}

function createEvent(eventParams: SwapEventParams = new SwapEventParams()): SwapEvent {
  let mockEvent = newMockEvent();

  let params = [
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(eventParams.eventAddress)),
    new ethereum.EventParam("to", ethereum.Value.fromAddress(eventParams.to)),
    new ethereum.EventParam("amount0In", ethereum.Value.fromUnsignedBigInt(eventParams.amount0In)),
    new ethereum.EventParam("amount1In", ethereum.Value.fromUnsignedBigInt(eventParams.amount1In)),
    new ethereum.EventParam("amount0Out", ethereum.Value.fromUnsignedBigInt(eventParams.amount0Out)),
    new ethereum.EventParam("amount1Out", ethereum.Value.fromUnsignedBigInt(eventParams.amount1Out)),
  ];

  let event = new SwapEvent(
    eventParams.eventAddress,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    params,
    mockEvent.receipt,
  );

  return event;
}

describe("Aerodrome V2 Swap", () => {
  beforeEach(() => {
    clearStore();
    dataSourceMock.setNetwork(BASE_NETWORK_NAME);
  });

  test("When calling the handler, it should get the pool fee from the factory and pass it converted to uniswap fee tier decimals to the handleV2PoolSwap function", () => {
    let aerodromeFeeTier: i32 = 30 as i32; // in case of aerodrome, 30 represents 0.3% fee
    let pool = new PoolMock();

    let eventParams = new SwapEventParams();
    eventParams.setEventAddress(pool.id);

    let event = createEvent(eventParams);

    createMockedFunction(Address.fromString(V2FactoryAddress.aerodrome), "getFee", "getFee(address,bool):(uint256)")
      .withArgs([ethereum.Value.fromAddress(pool.id), ethereum.Value.fromBoolean(pool._aerodromeV2StablePool)])
      .returns([ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(aerodromeFeeTier))]);

    handleAerodromeV2Swap(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "feeTier", (aerodromeFeeTier * 100).toString()); // Convert to uniswap fee tier decimals (0.3% -> 3000)
  });
});
