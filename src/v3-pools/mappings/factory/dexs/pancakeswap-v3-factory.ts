import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/PancakeSwapV3Factory/PancakeSwapV3Factory";
import { PancakeSwapV3Pool as PancakeSwapV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "./../v3-factory";

export function handlePancakeSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.pancakeSwapV3,
    "PancakeSwap V3",
    "https://pancakeswap.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png",
    V3PositionManagerAddress.pancakeSwap,
  );

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    event.params.fee,
    event.params.tickSpacing,
    protocolEntity,
  );

  PancakeSwapV3PoolTemplate.create(event.params.pool);
}
