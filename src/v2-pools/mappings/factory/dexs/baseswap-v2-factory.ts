import { PairCreated as PoolCreatedEvent } from "../../../../../generated/BaseSwapV2Factory/UniswapV2Factory";
import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleBaseSwapV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.baseSwapV2,
    "BaseSwap V2",
    "https://baseswap.fi/",
    "https://avatars.githubusercontent.com/u/141787576?s=280&v=4",
    V2PositionManagerAddress.baseSwap,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 1700, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
