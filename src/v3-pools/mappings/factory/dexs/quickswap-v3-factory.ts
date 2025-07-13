import { Pool as PoolCreatedEvent } from "../../../../../generated/QuickSwapV3Factory/QuickSwapV3Factory";
import { QuickSwapV3Pool as QuickSwapV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleQuickSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.quickSwapV3,
    "QuickSwap V3",
    "https://quickswap.exchange/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/quickswap.exchange.png",
    V3PositionManagerAddress.quickSwap,
  );

  let baseFeeTier = 100;
  let baseTickSpacing = 60;

  handleV3PoolCreated(
    event,
    event.params.pool,
    event.params.token0,
    event.params.token1,
    baseFeeTier,
    baseTickSpacing,
    protocolEntity,
  );

  QuickSwapV3PoolTemplate.create(event.params.pool);
}
