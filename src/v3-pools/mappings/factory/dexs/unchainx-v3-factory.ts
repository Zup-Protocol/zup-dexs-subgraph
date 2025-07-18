import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/UnchainXV3Factory/UniswapV3Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";

import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleUnchainXV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.unchainXV3,
    "Unchain X V3",
    "https://unchainx.io/",
    "https://icons.llamao.fi/icons/protocols/unchain-x",
    V3PositionManagerAddress.unchainX,
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
