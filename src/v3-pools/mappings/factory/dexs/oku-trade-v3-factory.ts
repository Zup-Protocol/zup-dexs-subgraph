import { UniswapV3Pool as UniswapV3PoolFactory } from "../../../../../generated/templates";
import { PoolCreated } from "../../../../../generated/UniswapV3Factory/UniswapV3Factory";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V3PositionManagerAddress } from "../../../../v3-pools/utils/v3-position-manager-address";
import { handleV3PoolCreated } from "../v3-factory";

export function handleOkuTradeV3PoolCreated(event: PoolCreated): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.okuTradeV3,
    "Oku V3",
    "https://oku.trade/",
    "https://img.cryptorank.io/coins/oku_trade1715355283566.png",
    V3PositionManagerAddress.uniswap,
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

  UniswapV3PoolFactory.create(event.params.pool);
}
