import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { V3PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";

import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleAlienBaseV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.alienBaseV3,
    "Alien Base V3",
    "https://app.alienbase.xyz/",
    "https://s2.coinmarketcap.com/static/img/coins/200x200/30543.png",
    V3PositionManagerAddress.AlienBase,
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
