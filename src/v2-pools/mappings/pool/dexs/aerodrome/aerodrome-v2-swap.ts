import { Address, BigInt } from "@graphprotocol/graph-ts";
import { AerodromeV2Factory } from "../../../../../../generated/AerodromeV2Factory/AerodromeV2Factory";
import { Pool as PoolEntity, Token as TokenEntity } from "../../../../../../generated/schema";
import { Swap as SwapEvent } from "../../../../../../generated/templates/AerodromeV2Pool/AerodromeV2Pool";
import { V2FactoryAddress } from "../../../../utils/v2-factory-address";
import { handleV2PoolSwap } from "../../v2-pool-swap";

export function handleAerodromeV2Swap(event: SwapEvent): void {
  let pool = PoolEntity.load(event.address)!;
  let token0 = TokenEntity.load(pool.token0)!;
  let token1 = TokenEntity.load(pool.token1)!;

  let swapFee = AerodromeV2Factory.bind(Address.fromString(V2FactoryAddress.aerodrome)).getFee(
    event.address,
    pool.__aerodromeV2StablePool,
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
    swapFee.times(BigInt.fromString("100")).toI32(), // Convert from aerodrome decimals to uniswap decimals, which is the expected format
  );
}
