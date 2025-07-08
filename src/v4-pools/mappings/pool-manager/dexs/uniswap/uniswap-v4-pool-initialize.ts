import { BigInt, dataSource } from "@graphprotocol/graph-ts";
import { Initialize } from "../../../../../../generated/UniswapV4PoolManager/UniswapV4PoolManager";
import { Permit2Address } from "../../../../../common/permit2-address";
import { ProtocolId } from "../../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../../common/protocol-utils";
import { V4PositionManagerAddress } from "../../../../utils/v4-position-manager-address";
import { V4StateViewAddress } from "../../../../utils/v4-state-view-address";
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
    event.params.hooks,
    getOrCreateProtocol(
      ProtocolId.uniswapV4,
      "Uniswap V4",
      "https://uniswap.org",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/app.uniswap.org.png",
      V4PositionManagerAddress.uniswap,
      Permit2Address.uniswap,
      V4StateViewAddress.uniswap,
      dataSource.address().toHexString(),
    ),
  );
}
