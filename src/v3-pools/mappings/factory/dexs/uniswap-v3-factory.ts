import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { UNISWAP_ID } from "../../../../utils/constants";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";

import { handleV3PoolCreated } from "./../v3-factory";

export function handleUniswapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    UNISWAP_ID,
    "Uniswap",
    "https://uniswap.org",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
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
