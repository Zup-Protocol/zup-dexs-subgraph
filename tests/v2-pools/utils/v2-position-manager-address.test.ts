import { assert, dataSourceMock, test } from "matchstick-as";
import { UNICHAIN_NETWORK_NAME } from "../../../src/common/constants";
import { V2PositionManagerAddress } from "../../../src/v2-pools/utils/v2-position-manager-address";

test("When calling 'uniswap' on Unichain, it should return the correct address", () => {
  dataSourceMock.setNetwork(UNICHAIN_NETWORK_NAME);

  let address = V2PositionManagerAddress.uniswap;
  assert.stringEquals(address, "0x284f11109359a7e1306c3e447ef14d38400063ff");
});

test(
  "When calling 'uniswap' on a network that is not mapped, it should throw an error",
  () => {
    dataSourceMock.setNetwork("ababa");

    V2PositionManagerAddress.uniswap;
  },
  true, // should fail flag
);
