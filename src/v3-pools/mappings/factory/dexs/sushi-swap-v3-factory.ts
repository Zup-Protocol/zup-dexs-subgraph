import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/SushiSwapV3Factory/UniswapV3Factory";
import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleSushiSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.sushiSwapV3,
    "SushiSwap V3",
    "https://sushi.com/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.sushi.com.png",
    V3PositionManagerAddress.sushiSwap,
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
