import { PoolCreated as PoolCreatedEvent } from "../../../../../generated/SquadSwapV3Factory/PancakeSwapV3Factory";
import { PancakeSwapV3Pool as PancakeSwapV3PoolTemplate } from "../../../../../generated/templates";
import { V3PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
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
