import { Protocol as ProtocolEntity } from "../../generated/schema";

export function getOrCreateProtocol(
  protocolId: string,
  protocolName: string,
  protocolUrl: string,
  protocolLogo: string,
): ProtocolEntity {
  let protocolEntity = ProtocolEntity.load(protocolId);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(protocolId);

    protocolEntity.name = protocolName;
    protocolEntity.url = protocolUrl;
    protocolEntity.logo = protocolLogo;

    protocolEntity.save();
  }

  return protocolEntity;
}
