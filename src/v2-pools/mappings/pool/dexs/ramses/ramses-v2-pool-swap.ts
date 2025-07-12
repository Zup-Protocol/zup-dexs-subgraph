import { Address, BigInt } from "@graphprotocol/graph-ts";
import { RamsesV2Factory } from "../../../../../../generated/RamsesV2Factory/RamsesV2Factory";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../../../generated/templates/RamsesV2Pool/RamsesV2Pool";
import { V2FactoryAddress } from "../../../../utils/v2-factory-address";
import { handleV2PoolSwap } from "../../v2-pool-swap";

export function handleRamsesV2PoolSwap(event: SwapEvent): void {
  let poolEntity = PoolEntity.load(event.address)!;
  let token0Entity = TokenEntity.load(poolEntity.token0)!;
  let token1Entity = TokenEntity.load(poolEntity.token1)!;

  let swapFee = RamsesV2Factory.bind(Address.fromString(V2FactoryAddress.ramses)).pairFee(event.address);

  handleV2PoolSwap(
    event,
    poolEntity,
    token0Entity,
    token1Entity,
    event.params.amount0In,
    event.params.amount1In,
    event.params.amount0Out,
    event.params.amount1Out,
    swapFee.times(BigInt.fromString("100")).toI32(), // transform to uniswap fee decimal, which is the default used
  );
}
