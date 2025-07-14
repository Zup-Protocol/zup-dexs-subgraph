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
import { Swap as SwapEvent } from "../../../../../../generated/templates/VelodromeV2Pool/VelodromeV2Pool";
import { OP_NETWORK_NAME } from "../../../../../../src/common/constants";
import { handleVelodromeV2PoolSwap } from "../../../../../../src/v2-pools/mappings/pool/dexs/velodrome/velodrome-v2-pool-swap";
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
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(eventParams.sender)),
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

describe("Velodrome V2 Swap", () => {
  beforeEach(() => {
    clearStore();

    dataSourceMock.setNetwork(OP_NETWORK_NAME);
  });

  test(`When calling the handler, it should get the pool fee from the factory and pass
    it converted to uniswap fee tier decimals to the handleV2PoolSwap function`, () => {
    let velodromeFeeTier: i32 = 12 as i32; // e.g., 12 represents 0.12% fee
    let pool = new PoolMock();

    let eventParams = new SwapEventParams();
    eventParams.setEventAddress(pool.id);

    let event = createEvent(eventParams);

    createMockedFunction(Address.fromString(V2FactoryAddress.velodrome), "getFee", "getFee(address,bool):(uint256)")
      .withArgs([ethereum.Value.fromAddress(pool.id), ethereum.Value.fromBoolean(pool.isStablePool)])
      .returns([ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(velodromeFeeTier))]);

    handleVelodromeV2PoolSwap(event);

    assert.fieldEquals("Pool", pool.id.toHexString(), "currentFeeTier", (velodromeFeeTier * 100).toString()); // Convert to uniswap fee tier decimals (0.12% - > 1200)
  });
});
