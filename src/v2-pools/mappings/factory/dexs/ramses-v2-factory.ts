import { BigInt } from "@graphprotocol/graph-ts";
import {
  PairCreated as PoolCreatedEvent,
  RamsesV2Factory,
} from "../../../../../generated/RamsesV2Factory/RamsesV2Factory";
import { RamsesV2Pool as RamsesV2PoolTemplate } from "../../../../../generated/templates";
import { ProtocolId } from "../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../common/protocol-utils";
import { V2PositionManagerAddress } from "../../../utils/v2-position-manager-address";
import { handleV2PoolCreated } from "../v2-factory";

export function handleRamsesV2PoolCreated(event: PoolCreatedEvent): void {
  let protocolEntity = getOrCreateProtocol(
    ProtocolId.ramsesV2,
    "Ramses V2",
    "https://ramses.exchange/",
    "https://app.ramses.exchange/favicon/favicon.ico",
    V2PositionManagerAddress.ramses,
  );

  let initialPairFeeBigInt = RamsesV2Factory.bind(event.address).pairFee(event.params.pair);
  let initialPairFeeUniswapFeeDecimals = initialPairFeeBigInt.times(BigInt.fromString("100")).toI32();

  let createdPool = handleV2PoolCreated(
    event,
    event.params.token0,
    event.params.token1,
    event.params.pair,
    initialPairFeeUniswapFeeDecimals,
    protocolEntity,
  );

  RamsesV2PoolTemplate.create(event.params.pair);

  createdPool.isStablePool = event.params.stable;
  createdPool.save();
}
