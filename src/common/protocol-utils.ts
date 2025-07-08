import { Address } from "@graphprotocol/graph-ts";
import { Protocol as ProtocolEntity } from "../../generated/schema";

export function getOrCreateProtocol(
  protocolId: string,
  protocolName: string,
  protocolUrl: string,
  protocolLogo: string,
  protocolPositionManager: string,
  permit2: string | null = null,
  v4StateView: string | null = null,
  v4PoolManager: string | null = null,
): ProtocolEntity {
  let protocolEntity = ProtocolEntity.load(protocolId);

  if (protocolEntity == null) {
    protocolEntity = new ProtocolEntity(protocolId);

    protocolEntity.name = protocolName;
    protocolEntity.url = protocolUrl;
    protocolEntity.logo = protocolLogo;
    protocolEntity.positionManager = Address.fromString(protocolPositionManager);
    protocolEntity.v4PoolManager = v4PoolManager == null ? null : Address.fromString(v4PoolManager!);
    protocolEntity.permit2 = permit2 == null ? null : Address.fromString(permit2!);
    protocolEntity.v4StateView = v4StateView == null ? null : Address.fromString(v4StateView!);

    protocolEntity.save();
  }

  return protocolEntity;
}
