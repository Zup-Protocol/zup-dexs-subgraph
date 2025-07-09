import { dataSource } from "@graphprotocol/graph-ts";
import { BASE_NETWORK_NAME } from "../../common/constants";

export class V2FactoryAddress {
  static get aerodrome(): string {
    if (dataSource.network() == BASE_NETWORK_NAME) return "0x420DD381b31aEf6683db6B902084cB0FFECe40Da";

    throw new Error(`V2 Factory address not mapped for Aerodrome on ${dataSource.network()} network`);
  }
}
