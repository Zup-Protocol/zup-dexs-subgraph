import { PairCreated as PoolCreatedEvent } from "../../../../../generated/PancakeSwapV2Factory/UniswapV2Factory";
import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handlePancakeSwapV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.pancakeSwapV2,
    "PancakeSwap V2",
    "https://pancakeswap.finance",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/exchange.pancakeswap.finance.png",
    V2PositionManagerAddress.pancakeSwap,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 1700, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
