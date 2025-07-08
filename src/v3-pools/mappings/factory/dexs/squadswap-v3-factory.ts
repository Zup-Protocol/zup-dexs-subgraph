import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/SquadSwapV3Factory/PancakeSwapV3Factory";
import { PancakeSwapV3Pool as PancakeSwapV3PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "./../v3-factory";

export function handleSquadSwapV3PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.squadSwapV3,
    "SquadSwap V3",
    "https://squadswap.com/",
    "https://icons.llama.fi/squadswap.png",
    V3PositionManagerAddress.squadSwap,
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

  PancakeSwapV3PoolTemplate.create(event.params.pool);
}
