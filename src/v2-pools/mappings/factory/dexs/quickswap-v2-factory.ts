import { PairCreated as PairCreatedEvent } from "../../../../../generated/QuickSwapV2Factory/UniswapV2Factory";
import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleQuickSwapV2PoolCreated(event: PairCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.quickSwapV2,
    "QuickSwap V2",
    "https://quickswap.exchange/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/quickswap.exchange.png",
    V2PositionManagerAddress.quickSwap,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 3000, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
