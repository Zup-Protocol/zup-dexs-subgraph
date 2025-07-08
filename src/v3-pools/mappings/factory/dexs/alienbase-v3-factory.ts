import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";

import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleAlienBaseV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.alienBaseV3,
    "Alien Base V3",
    "https://app.alienbase.xyz/",
    "https://s2.coinmarketcap.com/static/img/coins/200x200/30543.png",
    V3PositionManagerAddress.alienBase,
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
