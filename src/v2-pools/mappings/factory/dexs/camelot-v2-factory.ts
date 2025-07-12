import { PairCreated as PairCreatedEvent } from "../../../../../generated/CamelotV2Factory/CamelotV2Factory";
import { CamelotV2Pool as CamelotV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleCamelotV2PoolCreated(event: PairCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.camelotV2,
    "Camelot V2",
    "https://camelot.exchange/",
    "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/camelot.exchange.png",
    V2PositionManagerAddress.camelot,
  );

  handleV2PoolCreated(event, event.params.token0, event.params.token1, event.params.pair, 3000, protocolEntity);

  CamelotV2PoolTemplate.create(event.params.pair);
}
