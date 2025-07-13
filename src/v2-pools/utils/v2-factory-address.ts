import { dataSource } from "@graphprotocol/graph-ts";
import { ARBITRUM_NETWORK_NAME, BASE_NETWORK_NAME, OP_NETWORK_NAME } from "../../common/constants";

export class V2FactoryAddress {
  static get aerodrome(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x420DD381b31aEf6683db6B902084cB0FFECe40Da";

    throw new Error(`V2 Factory address not mapped for Aerodrome on ${dataSource.network()} network`);
  }

  static get ramses(): string {
    if (dataSource.network() == ARBITRUM_NETWORK_NAME) return "0xAAA20D08e59F6561f242b08513D36266C5A29415";

    throw new Error(`V2 Factory address not mapped for Ramses on ${dataSource.network()} network`);
  }

  static get velodrome(): string {
    if (dataSource.network() == OP_NETWORK_NAME) return "0xF1046053aa5682b4F9a81b5481394DA16BE5FF5a";

    throw new Error(`V2 Factory address not mapped for Velodrome on ${dataSource.network()} network`);
  }
}
