import { BigInt } from "@graphprotocol/graph-ts";
import { Initialize } from "../../../../../../generated/UniswapV4PoolManager/UniswapV4PoolManager";
import { V4PositionManagerAddress } from "../../../../../utils/position-manager-address";
import { ProtocolId } from "../../../../../utils/protocol-id";
import { getOrCreateProtocol } from "../../../../../utils/protocol-utils";
import { handleV4PoolInitialize } from "../../v4-pool-initialize";

export function handleUniswapV4PoolInitialize(event: Initialize): void {
  handleV4PoolInitialize(
    event,
    event.params.id,
    event.params.currency0,
    event.params.currency1,
    event.params.fee,
    event.params.tickSpacing,
    BigInt.fromI32(event.params.tick),
    event.params.sqrtPriceX96,
    getOrCreateProtocol(
      ProtocolId.uniswapV4,
      "Uniswap V4",
      "https://uniswap.org",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
      V4PositionManagerAddress.uniswap,
    ),
  );
}
