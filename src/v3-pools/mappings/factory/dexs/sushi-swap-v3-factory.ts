import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/SushiSwapV3Factory/UniswapV3Factory";
import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "../v3-factory";

export function handleSushiSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.sushiSwapV3,
    "SushiSwap V3",
    "https://sushi.com/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.sushi.com.png",
    PositionManagerAddress.sushiSwap,
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
