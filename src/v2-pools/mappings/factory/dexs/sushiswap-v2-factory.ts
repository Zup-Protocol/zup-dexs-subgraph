import { PairCreated as PoolCreatedEvent } from "../../../../../generated/SushiSwapV2Factory/UniswapV2Factory";
import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleSushiSwapV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.sushiSwapV2,
    "SushiSwap V2",
    "https://sushi.com/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.sushi.com.png",
    V2PositionManagerAddress.sushiSwap,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 3000, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
