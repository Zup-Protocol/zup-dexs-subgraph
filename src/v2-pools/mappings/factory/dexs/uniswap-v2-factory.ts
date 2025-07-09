import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { PairCreated as PoolCreatedEvent } from "../../../../../generated/UniswapV2Factory/UniswapV2Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleUniswapV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.uniswapV2,
    "Uniswap V2",
    "https://uniswap.org/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
    V2PositionManagerAddress.uniswap,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 3000, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
