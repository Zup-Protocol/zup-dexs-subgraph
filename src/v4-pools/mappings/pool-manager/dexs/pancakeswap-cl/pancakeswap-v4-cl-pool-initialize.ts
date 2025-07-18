import { BigInt, dataSource } from "@graphprotocol/graph-ts";
import { Initialize } from "../../../../../../generated/PancakeSwapV4CLPoolManager/PancakeSwapV4CLPoolManager";
import { Permit2Address } from "../../../../../common/permit2-address";
import { ProtocolId } from "../../../../../common/protocol-id";
import { getOrCreateProtocol } from "../../../../../common/protocol-utils";
import { V4PositionManagerAddress } from "../../../../utils/v4-position-manager-address";
import { handleV4PoolInitialize } from "../../v4-pool-initialize";
import { getPoolTickSpacingFromParameters } from "./pancakeswap-v4-cl-utils";

export function handlePancakeSwapV4CLPoolInitialize(event: Initialize): void {
  handleV4PoolInitialize(
    event,
    event.params.id,
    event.params.currency0,
    event.params.currency1,
    event.params.fee,
    getPoolTickSpacingFromParameters(event.params.parameters),
    BigInt.fromI32(event.params.tick),
    event.params.sqrtPriceX96,
    event.params.hooks,
    getOrCreateProtocol(
      ProtocolId.pancakeSwapV4CL,
      "PancakeSwap Infinity CL",
      "https://pancakeswap.finance/",
      "https://raw.githubusercontent.com/trustwallet/assets/refs/heads/master/dapps/pancakeswap.finance.png",
      V4PositionManagerAddress.pancakeSwap,
      Permit2Address.pancakeSwap,
      null,
      dataSource.address().toHexString(),
    ),
  );
}
