import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";

import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleBaseSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.baseSwapV3,
    "BaseSwap V3",
    "https://baseswap.fi/",
    "https://avatars.githubusercontent.com/u/141787576?s=280&v=4",
    V3PositionManagerAddress.baseSwap,
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

  UniswapV3PoolTemplate.create(event.params.pool);
}
