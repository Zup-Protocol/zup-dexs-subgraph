import { Address, BigInt } from "@graphprotocol/graph-ts";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../../../generated/templates/VelodromeV2Pool/VelodromeV2Pool";
import { VelodromeV2Factory } from "../../../../../../generated/VelodromeV2Factory/VelodromeV2Factory";
import { V2FactoryAddress } from "../../../../utils/v2-factory-address";
import { handleV2PoolSwap } from "../../v2-pool-swap";

export function handleVelodromeV2PoolSwap(event: SwapEvent): void {
  let pool = PoolEntity.load(event.address)!;
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = TokenEntity.load(pool.token1)!;

  let swapFee = VelodromeV2Factory.bind(Address.fromString(V2FactoryAddress.velodrome)).getFee(
    event.address,
    pool.isStablePool,
  );

  handleV2PoolSwap(
    event,
    pool,
    token0,
    token1,
    event.params.amount0In,
    event.params.amount1In,
    event.params.amount0Out,
    event.params.amount1Out,
    swapFee.times(BigInt.fromString("100")).toI32(), // Convert from velodrome decimals to uniswap decimals, which is the expected format
  );
}
