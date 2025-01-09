import { Address } from "@graphprotocol/graph-ts";
import { Protocol as ProtocolEntity } from "../../generated/schema";

export function getOrCreateProtocol(
  protocolId: string,
  protocolName: string,
  protocolUrl: string,
  protocolLogo: string,
  protocolPositionManager: string,
): ProtocolEntity {
  let protocolEntity = ProtocolEntity.load(protocolId);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(protocolId);

    protocolEntity.name = protocolName;
    protocolEntity.url = protocolUrl;
    protocolEntity.logo = protocolLogo;
    protocolEntity.positionManager = Address.fromString(protocolPositionManager);

    protocolEntity.save();
  }

  return protocolEntity;
}
