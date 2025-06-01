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
import { Initialize as InitializeEvent } from "../../../../../../generated/UniswapV4PoolManager/UniswapV4PoolManager";
import { V4PositionManagerAddress } from "../../../../../../src/utils/position-manager-address";
import { handleUniswapV4PoolInitialize } from "../../../../../../src/v4-pools/mappings/pool-manager/dexs/uniswap";

describe("uniswap-v4-pool-initialize", () => {
  beforeEach(() => {
    clearStore();
  });

  test("When calling the handler, it should correclty assign the protocol to the pool", () => {
    dataSourceMock.setNetwork("sepolia");
    let poolId = Bytes.fromI32(871);

    let token0Address = Address.fromString("0x0000000000000000000000000000000000000001");
    let token1Address = Address.fromString("0x0000000000000000000000000000000000000002");

    createMockedFunction(token0Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 1")]);
    createMockedFunction(token1Address, "name", "name():(string)").returns([ethereum.Value.fromString("Token Mock 0")]);
    createMockedFunction(token0Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK0")]);
    createMockedFunction(token1Address, "symbol", "symbol():(string)").returns([ethereum.Value.fromString("MOCK1")]);
    createMockedFunction(token0Address, "decimals", "decimals():(uint8)").returns([ethereum.Value.fromI32(21)]);
    createMockedFunction(token1Address, "decimals", "decimals():(uint8)").returns([ethereum.Value.fromI32(21)]);

    let mockEvent = newMockEvent();
    let eventParams = [
      new ethereum.EventParam("id", ethereum.Value.fromBytes(poolId)),
      new ethereum.EventParam("currency0", ethereum.Value.fromAddress(token0Address)),
      new ethereum.EventParam("currency1", ethereum.Value.fromAddress(token1Address)),
      new ethereum.EventParam("fee", ethereum.Value.fromI32(1)),
      new ethereum.EventParam("tickSpacing", ethereum.Value.fromI32(1)),
      new ethereum.EventParam(
        "hooks",
        ethereum.Value.fromAddress(Address.fromString("0x0000000000000000000000000000000000000003")),
      ),
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

    handleUniswapV4PoolInitialize(event);

    assert.fieldEquals("Pool", poolId.toHexString(), "protocol", "uniswap-v4");
    assert.fieldEquals("Protocol", "uniswap-v4", "name", "Uniswap V4");
    assert.fieldEquals("Protocol", "uniswap-v4", "url", "https://uniswap.org");
    assert.fieldEquals(
      "Protocol",
      "uniswap-v4",
      "logo",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
    );
    assert.fieldEquals("Protocol", "uniswap-v4", "positionManager", V4PositionManagerAddress.uniswap.toLowerCase());
  });
});
