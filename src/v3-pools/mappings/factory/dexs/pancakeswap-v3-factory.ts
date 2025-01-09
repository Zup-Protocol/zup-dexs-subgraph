import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/PancakeSwapV3Factory/PancakeSwapV3Factory";
import { PancakeSwapV3Pool as PancakeSwapV3PoolTemplate } from "../../../../../generated/templates";
import { PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handlePancakeSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.pancakeSwap,
    "PancakeSwap",
    "https://pancakeswap.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png",
    PositionManagerAddress.pancakeSwap,
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
