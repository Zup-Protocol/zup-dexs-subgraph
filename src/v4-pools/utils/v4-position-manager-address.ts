import { dataSource } from "@graphprotocol/graph-ts";
import {
  ARBITRUM_NETWORK_NAME,
  BASE_NETWORK_NAME,
  BNB_NETWORK_NAME,
  MAINNET_NETWORK_NAME,
  OP_NETWORK_NAME,
  POLYGON_NETWORK_NAME,
  SEPOLIA_NETWORK_NAME,
  UNICHAIN_NETWORK_NAME,
} from "../../common/constants";

export class V4PositionManagerAddress {
  private static unsupportedProtocolNetworkError(protocolName: string): Error {
    return new Error(`V4 Position manager address not mapped for ${protocolName} on ${dataSource.network()} network`);
  }

  static get uniswap(): string {
    if (dataSource.network() == SEPOLIA_NETWORK_NAME) return "0x429ba70129df741B2Ca2a85BC3A2a3328e5c09b4";
    if (dataSource.network() == UNICHAIN_NETWORK_NAME) return "0x4529A01c7A0410167c5740C487A8DE60232617bf";
    if (dataSource.network() == MAINNET_NETWORK_NAME) return "0xbD216513d74C8cf14cf4747E6AaA6420FF64ee9e";
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x7c5f5a4bbd8fd63184577525326123b519429bdc";
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x7A4a5c919aE2541AeD11041A1AEeE68f1287f95b";
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xd88F38F930b7952f2DB2432Cb002E7abbF3dD869";
    if (dataSource.network() == POLYGON_NETWORK_NAME) return "0x1Ec2eBf4F37E7363FDfe3551602425af0B3ceef9";
    if (dataSource.network() == OP_NETWORK_NAME) return "0x3C3Ea4B57a46241e54610e5f022E5c45859A1017";

    throw V4PositionManagerAddress.unsupportedProtocolNetworkError("Uniswap V4");
  }

  static get pancakeSwap(): string {
    if (dataSource.network() == BNB_NETWORK_NAME) return "0x55f4c8abA71A1e923edC303eb4fEfF14608cC226";

    throw V4PositionManagerAddress.unsupportedProtocolNetworkError("PancakeSwap V4");
  }
}
