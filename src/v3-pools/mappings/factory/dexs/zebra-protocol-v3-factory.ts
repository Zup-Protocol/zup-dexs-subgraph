import { UniswapV3Pool as UniswapV3PoolTemplate } from "../../../../../generated/templates";
import { PoolCreated } from "../../../../../generated/ZebraProtocolV3Factory/UniswapV3Factory";
import { V3PositionManagerAddress } from "../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../utils/protocol-utils";
import { handleV3PoolCreated } from "../v3-factory";

export function handleZebraProtocolV3PoolCreated(event: PoolCreated): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.zebraV3,
    "Zebra V3",
    "https://zebra.xyz",
    "https://icons.llamao.fi/icons/protocols/zebra",
    V3PositionManagerAddress.zebra,
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
