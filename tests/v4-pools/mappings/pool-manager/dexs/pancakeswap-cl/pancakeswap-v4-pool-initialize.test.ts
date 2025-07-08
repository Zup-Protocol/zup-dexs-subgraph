import { Address, BigInt, Bytes, ethereum } from "@graphprotocol/graph-ts";
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
import { Initialize as InitializeEvent } from "../../../../../../generated/PancakeSwapV4CLPoolManager/PancakeSwapV4CLPoolManager";
import { BNB_NETWORK_NAME } from "../../../../../../src/common/constants";
import { Permit2Address } from "../../../../../../src/common/permit2-address";
import { ProtocolId } from "../../../../../../src/common/protocol-id";
import { handlePancakeSwapV4CLPoolInitialize } from "../../../../../../src/v4-pools/mappings/pool-manager/dexs/pancakeswap-cl/pancakeswap-v4-cl-pool-initialize";
import { getPoolTickSpacingFromParameters } from "../../../../../../src/v4-pools/mappings/pool-manager/dexs/pancakeswap-cl/pancakeswap-v4-cl-utils";
import { V4PositionManagerAddress } from "../../../../../../src/v4-pools/utils/v4-position-manager-address";

function createEvent(
  poolId: Bytes = Bytes.fromI32(1),
  token0: Address = Address.fromString("0x0000000000000000000000000000000000000001"),
  token1: Address = Address.fromString("0x0000000000000000000000000000000000000002"),
  hooks: Address = Address.fromString("0x0000000000000000000000000000000000000003"),
  parameters: Bytes = Bytes.fromHexString("0x00000000000000000000000000000000000000000000000000000000000a00c2"),
): InitializeEvent {
  let mockEvent = newMockEvent();
  let eventParams = [
    new ethereum.EventParam("id", ethereum.Value.fromBytes(poolId)),
    new ethereum.EventParam("currency0", ethereum.Value.fromAddress(token0)),
    new ethereum.EventParam("currency1", ethereum.Value.fromAddress(token1)),
    new ethereum.EventParam("hooks", ethereum.Value.fromAddress(hooks)),
    new ethereum.EventParam("fee", ethereum.Value.fromI32(1)),
    new ethereum.EventParam("parameters", ethereum.Value.fromBytes(parameters)),
    new ethereum.EventParam("sqrtPriceX96", ethereum.Value.fromSignedBigInt(BigInt.fromI32(1))),
    new ethereum.EventParam("tick", ethereum.Value.fromI32(1)),
  ];

  let event = new InitializeEvent(
    mockEvent.address,
    mockEvent.logIndex,
    mockEvent.transactionLogIndex,
    mockEvent.logType,
    mockEvent.block,
    mockEvent.transaction,
    eventParams,
    mockEvent.receipt,
  );

  createMockedFunction(token0, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
  createMockedFunction(token1, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
  createMockedFunction(token0, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
  createMockedFunction(token1, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);
  createMockedFunction(token0, "decimals", "decimals():(uint8)").returns([ethereum.Value.fromI32(21)]);
  createMockedFunction(token1, "decimals", "decimals():(uint8)").returns([ethereum.Value.fromI32(21)]);

  return event;
}

describe("pancakeswap-v4-cl-pool-initialize", () => {
  beforeEach(() => {
    clearStore();
  });

  test("When calling the handler, it should correctly assign the protocol to the pool", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    let poolId = Bytes.fromI32(871);
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000001");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000002");
    let event = createEvent(poolId, token0Address, token1Address);

    handlePancakeSwapV4CLPoolInitialize(event);

    assert.fieldEquals("Pool", poolId.toHexString(), "protocol", ProtocolId.pancakeSwapV4CL);
    assert.fieldEquals("Protocol", ProtocolId.pancakeSwapV4CL, "name", "PancakeSwap Infinity CL");
    assert.fieldEquals("Protocol", ProtocolId.pancakeSwapV4CL, "url", "https://pancakeswap.finance/");
    assert.fieldEquals(
      "Protocol",
      ProtocolId.pancakeSwapV4CL,
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/pancakeswap.finance.png",
    );
    assert.fieldEquals(
      "Protocol",
      ProtocolId.pancakeSwapV4CL,
      "positionManager",
      V4PositionManagerAddress.pancakeSwap.toLowerCase(),
    );
    assert.fieldEquals("Protocol", ProtocolId.pancakeSwapV4CL, "permit2", Permit2Address.pancakeSwap.toLowerCase());
    assert.fieldEquals("Protocol", ProtocolId.pancakeSwapV4CL, "v4StateView", "null");
  });

  test("When calling the handler, it should correctly pass the hooks from the event", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    let poolId = Bytes.fromI32(871);
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000001");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000002");
    let hooks = Address.fromString("0x0000000000000000000000000000000000000023");
    let event = createEvent(poolId, token0Address, token1Address, hooks);

    handlePancakeSwapV4CLPoolInitialize(event);

    assert.fieldEquals("V4Pool", poolId.toHexString(), "hooks", hooks.toHexString());
  });

  test("When calling the handler, it should correctly pass the pool tick spacing, converting from the event parameters param", () => {
    dataSourceMock.setNetwork(BNB_NETWORK_NAME);
    let poolId = Bytes.fromI32(871);
    let token0Address = Address.fromString("0x0000000000000000000000000000000000000001");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000002");
    let tickspacingParamaters = Bytes.fromHexString(
      "0x00000000000000000000000000000000000000000000000000000000000100c2",
    );
    let hooks = Address.fromString("0x0000000000000000000000000000000000000023");
    let event = createEvent(poolId, token0Address, token1Address, hooks, tickspacingParamaters);

    handlePancakeSwapV4CLPoolInitialize(event);

    assert.fieldEquals(
      "V4Pool",
      poolId.toHexString(),
      "tickSpacing",
      getPoolTickSpacingFromParameters(tickspacingParamaters).toString(),
    );
  });
});
