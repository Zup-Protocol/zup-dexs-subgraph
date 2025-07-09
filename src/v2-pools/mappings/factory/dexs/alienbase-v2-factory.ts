import { PairCreated as PoolCreatedEvent } from "../../../../../generated/AlienBaseV2Factory/UniswapV2Factory";
import { UniswapV2Pool as UniswapV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleAlienBaseV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.alienBaseV2,
    "Alien Base V2",
    "https://app.alienbase.xyz/",
    "https://s2.coinmarketcap.com/static/img/coins/200x200/30543.png",
    V2PositionManagerAddress.alienBase,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 1600, protocolEntity);

  UniswapV2PoolTemplate.create(event.params.pair);
}
