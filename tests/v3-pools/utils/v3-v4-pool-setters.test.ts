import { Address, BigDecimal, BigInt } from "@graphprotocol/graph-ts";
import { assert, newMockEvent, test } from "matchstick-as";
import { ONE_HOUR_IN_SECONDS, ZERO_BIG_DECIMAL } from "../../../src/common/constants";
import { CurrentNetwork } from "../../../src/common/current-network";
import { getPoolDailyDataId } from "../../../src/common/pool-utils";
import { sqrtPriceX96toPrice } from "../../../src/v3-pools/utils/v3-v4-pool-converters";
import { PoolDailyDataMock, PoolMock, PoolSettersMock, TokenMock } from "../../mocks";

test(`When calling 'setPoolDailyDataTVL' and a PoolDailyData entity
      has already been created in the same day, the TVL should be updated
      to the pool's current one
      `, () => {
  let event = newMockEvent();
  let pool = new PoolMock();
  let poolTotalValueLockedUSD = BigDecimal.fromString("100.298");
  let poolTotalValueLockedToken0 = BigDecimal.fromString("1.121");
  let poolTotalValueLockedToken1 = BigDecimal.fromString("9872.2");

  event.block.timestamp = BigInt.fromI32(1656105600);
  pool.totalValueLockedUSD = poolTotalValueLockedUSD;
  pool.totalValueLockedToken0 = poolTotalValueLockedToken0;
  pool.totalValueLockedToken1 = poolTotalValueLockedToken1;

  let dailyPoolData = new PoolDailyDataMock(getPoolDailyDataId(event.block.timestamp, pool));

  dailyPoolData.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  dailyPoolData.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  dailyPoolData.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  dailyPoolData.save();

  new PoolSettersMock().setPoolDailyDataTVL(event, pool);

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolData.id.toHexString(),
    "totalValueLockedUSD",
    poolTotalValueLockedUSD.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolData.id.toHexString(),
    "totalValueLockedToken0",
    poolTotalValueLockedToken0.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolData.id.toHexString(),
    "totalValueLockedToken1",
    poolTotalValueLockedToken1.toString(),
  );
});

test(`When calling 'setPoolDailyDataTVL' and a PoolDailyData entity
    has not been created in the same day, a new one should be created
    and the TVL should be set to the pool's current one
    `, () => {
  let event = newMockEvent();
  let pool = new PoolMock();
  let poolTotalValueLockedUSD = BigDecimal.fromString("100.298");
  let poolTotalValueLockedToken0 = BigDecimal.fromString("1.121");
  let poolTotalValueLockedToken1 = BigDecimal.fromString("9872.2");

  event.block.timestamp = BigInt.fromI32(1656105600);
  pool.totalValueLockedUSD = poolTotalValueLockedUSD;
  pool.totalValueLockedToken0 = poolTotalValueLockedToken0;
  pool.totalValueLockedToken1 = poolTotalValueLockedToken1;

  let dailyPoolDataYesterday = new PoolDailyDataMock(
    getPoolDailyDataId(event.block.timestamp.minus(BigInt.fromI32(ONE_HOUR_IN_SECONDS * 24)), pool),
  );

  let dailyPoolDataToday = new PoolDailyDataMock(getPoolDailyDataId(event.block.timestamp, pool));

  dailyPoolDataYesterday.totalValueLockedUSD = ZERO_BIG_DECIMAL;
  dailyPoolDataYesterday.totalValueLockedToken0 = ZERO_BIG_DECIMAL;
  dailyPoolDataYesterday.totalValueLockedToken1 = ZERO_BIG_DECIMAL;
  dailyPoolDataYesterday.save();

  new PoolSettersMock().setPoolDailyDataTVL(event, pool);

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataYesterday.id.toHexString(),
    "totalValueLockedUSD",
    ZERO_BIG_DECIMAL.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataYesterday.id.toHexString(),
    "totalValueLockedToken0",
    ZERO_BIG_DECIMAL.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataYesterday.id.toHexString(),
    "totalValueLockedToken1",
    ZERO_BIG_DECIMAL.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataToday.id.toHexString(),
    "totalValueLockedUSD",
    poolTotalValueLockedUSD.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataToday.id.toHexString(),
    "totalValueLockedToken0",
    poolTotalValueLockedToken0.toString(),
  );

  assert.fieldEquals(
    "PoolDailyData",
    dailyPoolDataToday.id.toHexString(),
    "totalValueLockedToken1",
    poolTotalValueLockedToken1.toString(),
  );
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of
    token0 stable and token1 non-stable it should correctly set the token1
    and the token0 price`, () => {
  let sqrtPriceX96 = BigInt.fromString("132117387656662503710917528654277782");
  let stableToken = new TokenMock(Address.fromString(CurrentNetwork.stablecoinsAddresses[0]));
  stableToken.decimals = 6;
  stableToken.save();

  let nonStableToken = new TokenMock(Address.fromString("0xB528edBef013aff855ac3c50b381f253aF13b997"));
  nonStableToken.decimals = 18;
  nonStableToken.save();

  let pool = new PoolMock();

  pool.token0 = stableToken.id;
  pool.token1 = nonStableToken.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    stableToken,
    nonStableToken,
    sqrtPriceX96toPrice(sqrtPriceX96, stableToken, nonStableToken),
  );

  assert.fieldEquals("Token", nonStableToken.id.toHexString(), "usdPrice", "0.3596161703425394429455590507159066");
  assert.fieldEquals("Token", stableToken.id.toHexString(), "usdPrice", "1");
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of
    token0 non-stable and token1 stable it should correctly set the token0
    and token1 price`, () => {
  let sqrtPriceX96 = BigInt.fromString("2422644741646880465971970308851");
  let stableToken = new TokenMock(Address.fromString(CurrentNetwork.stablecoinsAddresses[0]));
  stableToken.decimals = 6;
  stableToken.save();

  let nonStableToken = new TokenMock(Address.fromString("0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599"));
  nonStableToken.decimals = 8;
  nonStableToken.save();

  let pool = new PoolMock();

  pool.token0 = nonStableToken.id;
  pool.token1 = stableToken.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    nonStableToken,
    stableToken,
    sqrtPriceX96toPrice(sqrtPriceX96, nonStableToken, stableToken),
  );

  assert.fieldEquals("Token", nonStableToken.id.toHexString(), "usdPrice", "93501.87063469230918451445286994512");
  assert.fieldEquals("Token", stableToken.id.toHexString(), "usdPrice", "1");
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of 
    token0 wrapped native and token1 non-wrapped native it should correctly set the
    token1 price based on the wrapped native price`, () => {
  let sqrtPriceX96 = BigInt.fromString("2448752485024712708594653706276");

  let wrappedNative = new TokenMock(Address.fromString(CurrentNetwork.wrappedNativeAddress));
  wrappedNative.decimals = 18;
  wrappedNative.usdPrice = BigDecimal.fromString("3340.53");
  wrappedNative.save();

  let nonWrappedNative = new TokenMock(Address.fromString("0xec53bF9167f50cDEB3Ae105f56099aaaB9061F83"));
  nonWrappedNative.decimals = 18;
  nonWrappedNative.save();

  let pool = new PoolMock();

  pool.token0 = wrappedNative.id;
  pool.token1 = nonWrappedNative.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    wrappedNative,
    nonWrappedNative,
    sqrtPriceX96toPrice(sqrtPriceX96, wrappedNative, nonWrappedNative),
  );

  assert.fieldEquals("Token", nonWrappedNative.id.toHexString(), "usdPrice", "3.496912490848270512206851599806777");
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of 
    token1 wrapped native and token0 non-wrapped native it should correctly set the
    token0 price based on the wrapped native price`, () => {
  let sqrtPriceX96 = BigInt.fromString("41900264649575989012484016231357126");

  let wrappedNative = new TokenMock(Address.fromString(CurrentNetwork.wrappedNativeAddress));
  wrappedNative.decimals = 18;
  wrappedNative.usdPrice = BigDecimal.fromString("3340.53");
  wrappedNative.save();

  let nonWrappedNative = new TokenMock(Address.fromString("0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599"));
  nonWrappedNative.decimals = 8;
  nonWrappedNative.save();

  let pool = new PoolMock();

  pool.token0 = nonWrappedNative.id;
  pool.token1 = wrappedNative.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    nonWrappedNative,
    wrappedNative,
    sqrtPriceX96toPrice(sqrtPriceX96, nonWrappedNative, wrappedNative),
  );

  assert.fieldEquals("Token", nonWrappedNative.id.toHexString(), "usdPrice", "93430.72975104423786494759603164283");
});

test(`when calling 'setPricesForV3PoolWhitelistedTokens' with a pool of token0
    stable and token1 wrapped native it should correctly set the token0 and token1 price`, () => {
  let sqrtPriceX96 = BigInt.fromString("79308353598837787813110990092");
  let token0 = new TokenMock(Address.fromString(CurrentNetwork.stablecoinsAddresses[0]));
  token0.decimals = 6;
  token0.save();

  let token1 = new TokenMock(Address.fromString(CurrentNetwork.stablecoinsAddresses[1]));
  token1.decimals = 6;
  token1.save();

  let pool = new PoolMock();

  pool.token0 = token0.id;
  pool.token1 = token1.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    token0,
    token1,
    sqrtPriceX96toPrice(sqrtPriceX96, token0, token1),
  );

  assert.fieldEquals("Token", token0.id.toHexString(), "usdPrice", "1.00202533202543717719096334135079");
  assert.fieldEquals("Token", token1.id.toHexString(), "usdPrice", "0.9979787616533174007690719676506302");
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of token0
  that is not mapped, and a token1 that is not mapped, but the token0 has its usd
  price set by some reason, the token1 usd price should be set based on the token0 price.
  While the token0 usd price should remain unchanged`, () => {
  let token0UsdPrice = BigDecimal.fromString("103017.8940225187751271430272797843");
  let sqrtPriceX96 = BigInt.fromString("79141063853680822898128351609");
  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  token0.decimals = 8;
  token0.usdPrice = token0UsdPrice;
  token0.save();

  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
  token1.decimals = 8;
  token1.save();

  let pool = new PoolMock();

  pool.token0 = token0.id;
  pool.token1 = token1.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    token0,
    token1,
    sqrtPriceX96toPrice(sqrtPriceX96, token0, token1),
  );

  assert.fieldEquals("Token", token0.id.toHexString(), "usdPrice", token0UsdPrice.toString());
  assert.fieldEquals("Token", token1.id.toHexString(), "usdPrice", "103244.7713883273314787832311543079");
});

test(`When calling 'setPricesForV3PoolWhitelistedTokens' with a pool of token0
  that is not mapped, and a token1 that is not mapped, but the token1 has its usd
  price set by some reason, the token0 usd price should be set based on the token1 price.
  While the token1 usd price should remain unchanged`, () => {
  let token1UsdPrice = BigDecimal.fromString("1.002");
  let sqrtPriceX96 = BigInt.fromString("58252955171373273082115870408");
  let token0 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000001"));
  token0.decimals = 18;

  token0.save();

  let token1 = new TokenMock(Address.fromString("0x0000000000000000000000000000000000000002"));
  token1.decimals = 18;
  token1.usdPrice = token1UsdPrice;
  token1.save();

  let pool = new PoolMock();

  pool.token0 = token0.id;
  pool.token1 = token1.id;
  pool.save();

  new PoolSettersMock().setPricesForPoolWhitelistedTokens(
    pool,
    token0,
    token1,
    sqrtPriceX96toPrice(sqrtPriceX96, token0, token1),
  );

  assert.fieldEquals("Token", token0.id.toHexString(), "usdPrice", "0.5416820920078591274742823691740816");
  assert.fieldEquals("Token", token1.id.toHexString(), "usdPrice", token1UsdPrice.toString());
});
