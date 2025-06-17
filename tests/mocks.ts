import { Address, BigDecimal, BigInt, Bytes, ethereum } from "@graphprotocol/graph-ts";
import { Pool, PoolDailyData, PoolHourlyData, Protocol, Token } from "../generated/schema";
import { ZERO_BIG_DECIMAL } from "../src/utils/constants";
import { getPoolDailyDataId, getPoolHourlyDataId } from "../src/utils/pool-utils";
import { PoolType } from "../src/utils/types/pool-type";
import { V3V4PoolSetters } from "../src/v3-pools/utils/v3-v4-pool-setters";

export class TokenMock extends Token {
  mockId: Address;

  constructor(id: Address = Address.fromString("0x0000000000000000000000000000000000000021")) {
    super(id);

    this.mockId = id;
    this.decimals = 8;
    this.usdPrice = BigDecimal.fromString("0");
    this.totalValuePooledUsd = BigDecimal.fromString("0");
    this.totalTokenPooledAmount = BigDecimal.fromString("0");
    this.name = "Mock Token";
    this.symbol = "MOCK";

    this.save();
  }
  static loadMock(): Token {
    return TokenMock.load(new TokenMock().id)!;
  }

  get id(): Bytes {
    return this.mockId;
  }
}

export class ProtocolMock extends Protocol {
  mockId: string;

  constructor(id: string = "mock-protocol") {
    super(id);

    this.mockId = id;
    this.name = "Mock Protocol";
    this.logo = "mock-logo";
    this.url = "mock-url";
    this.positionManager = Address.fromString("0x0000000000000000000000000000000000000001");

    this.save();
  }

  get id(): string {
    return this.mockId;
  }

  static loadMock(): Protocol {
    return ProtocolMock.load(new ProtocolMock().id)!;
  }
}

export class PoolMock extends Pool {
  mockId: Address;

  constructor(customId: Address = Address.fromString("0x0000000000000000000000000000000000000021")) {
    let id = customId;
    super(id);

    this.mockId = id;
    this.token0 = new TokenMock().id;
    this.token1 = new TokenMock().id;
    this.feeTier = 0;
    this.tickSpacing = 0;
    this.totalValueLockedUSD = BigDecimal.fromString("0");
    this.totalValueLockedToken0 = BigDecimal.fromString("0");
    this.totalValueLockedToken1 = BigDecimal.fromString("0");
    this.createdAtTimestamp = BigInt.fromI32(124);
    this.protocol = new ProtocolMock().id;
    this.tick = BigInt.fromI32(98675689);
    this.sqrtPriceX96 = BigInt.fromI32(1579);
    this.type = PoolType.V3;
    this.v4Hooks = Address.fromString("0x0000000000000000000000000000000000000031");

    this.save();
  }
  get id(): Address {
    return this.mockId;
  }

  static loadMock(): Pool {
    return PoolMock.load(new PoolMock().id)!;
  }
}

class V3PoolSettersSetPricesForV3PoolWhitelistedTokensParams {
  poolSqrtPriceX96: BigInt;
  poolEntity: Pool;
  poolToken0Entity: Token;
  poolToken1Entity: Token;

  constructor(poolSqrtPriceX96: BigInt, poolEntity: Pool, poolToken0Entity: Token, poolToken1Entity: Token) {
    this.poolSqrtPriceX96 = poolSqrtPriceX96;
    this.poolEntity = poolEntity;
    this.poolToken0Entity = poolToken0Entity;
    this.poolToken1Entity = poolToken1Entity;
  }
}

class V3PoolSettersSetPoolDailyDataTVLCallsParams {
  event: ethereum.Event;
  poolEntity: Pool;

  constructor(event: ethereum.Event, poolEntity: Pool) {
    this.event = event;
    this.poolEntity = poolEntity;
  }
}

export class V3V4PoolSettersMock extends V3V4PoolSetters {
  setPricesForPoolWhitelistedTokensCalls: V3PoolSettersSetPricesForV3PoolWhitelistedTokensParams[] = [];
  setPoolDailyDataTVLCalls: V3PoolSettersSetPoolDailyDataTVLCallsParams[] = [];

  setPoolDailyDataTVL(event: ethereum.Event, poolEntity: Pool): void {
    super.setPoolDailyDataTVL(event, poolEntity);

    this.setPoolDailyDataTVLCalls.push(new V3PoolSettersSetPoolDailyDataTVLCallsParams(event, poolEntity));
  }

  setPricesForPoolWhitelistedTokens(
    poolSqrtPriceX96: BigInt,
    poolEntity: Pool,
    poolToken0Entity: Token,
    poolToken1Entity: Token,
  ): void {
    super.setPricesForPoolWhitelistedTokens(poolSqrtPriceX96, poolEntity, poolToken0Entity, poolToken1Entity);
    this.setPricesForPoolWhitelistedTokensCalls.push(
      new V3PoolSettersSetPricesForV3PoolWhitelistedTokensParams(
        poolSqrtPriceX96,
        poolEntity,
        poolToken0Entity,
        poolToken1Entity,
      ),
    );
  }
}

export class PoolHourlyDataMock extends PoolHourlyData {
  constructor(id: Bytes = getPoolHourlyDataId(BigInt.fromI32(0), PoolMock.loadMock())) {
    super(id);
    this.feesToken0 = ZERO_BIG_DECIMAL;
    this.feesToken1 = ZERO_BIG_DECIMAL;
    this.feesUSD = ZERO_BIG_DECIMAL;
    this.hourStartTimestamp = BigInt.fromI32(0);
    this.pool = PoolMock.loadMock().id;
  }
}

export class PoolDailyDataMock extends PoolDailyData {
  constructor(id: Bytes = getPoolDailyDataId(BigInt.fromI32(0), PoolMock.loadMock())) {
    super(id);
    this.feesToken0 = ZERO_BIG_DECIMAL;
    this.feesToken1 = ZERO_BIG_DECIMAL;
    this.feesUSD = ZERO_BIG_DECIMAL;
    this.totalValueLockedUSD = ZERO_BIG_DECIMAL;
    this.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
    this.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
    this.dayStartTimestamp = BigInt.fromI32(0);
    this.pool = PoolMock.loadMock().id;

    this.save();
  }
}
