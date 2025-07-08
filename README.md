# Zup Dexs Subgraph

This is the primary subgraph used by the Zup Protocol to calculate yields. It aggregates data from all protocols supported by Zup across different networks. For each network, it includes all Zup-supported DEXs in a single subgraph.

### Table of Contents

1. [Dependencies](#dependencies)
2. [Installation](#installation)
3. [Running tests](#running-tests)
4. [Adding a new network](#adding-a-new-network)
5. [Adding a new DEX](#adding-a-new-dex)

## Dependencies

- **Node.js**

  - To know if Node.js is installed, run `node --version` you should see a response like `vX.X.X`.
  - If Node.js is not installed, head over to [How to install Node.js](https://nodejs.org/en/learn/getting-started/how-to-install-nodejs)

- **Docker (optional)**

  - To know if Docker is installed, run `docker --version` you should see a response like `Docker version X.X.X`.
  - If Docker is not installed, head over to [How to install Docker](https://docs.docker.com/get-docker/)

- **Yarn**
  - To know if Yarn is installed, run `yarn --version` you should see a response like `yarn x.x.x`.
  - If Yarn is not installed, head over to [Yarn installation](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)

## Installation

1. Clone the repository
2. run `yarn install`

## Running tests

To run all the tests, just open your terminal and type:

```bash
yarn test
```

## Adding a new network

To add a new network to the subgraph, you need to do a few things:

1. Add a new subgraph manifest in [subgraph-manifests](./subgraph-manifests) for the intended network with the DEXs supported in that network.
2. Add a new constant with the network name (following the [Network CLI Name](https://thegraph.com/docs/en/supported-networks/) from the Graph) in [current-network.ts](./src/common/current-network.ts) for the new network.
3. Add a new entry for each function defined in [current-network.ts](./src/common/current-network.ts) that needs to be overriden for the new network.
4. Modify the position manager address functions to return the position manager address of each DEX supported in the new network, for the applicable network or pool types:
   V2: [common/position-manager-address.ts](./src/v2-pools/utils/v2-position-manager-address.ts)
   V3: [common/position-manager-address.ts](./src/v3-pools/utils/v3-position-manager-address.ts)
   V4: [common/position-manager-address.ts](./src/v4-pools/utils/v4-position-manager-address.ts)
5. In case of the network having V4 Pools, modify the functions at [common/permit2-address.ts](./src/common/permit2-address.ts) to return the permit2 address for each DEX supported in the new network.
6. In case of the network having V4 Pools, modify the functions at [utils/v4-state-view-address.ts](./src/v4-pools/utils/v4-state-view-address.ts) to return the V4 State View address for each DEX supported in the new network (if applicable for the current DEX)
7. Add new scripts in [package.json](./package.json) for the new network (following the pattern `[script]:networkname`), to make it easier to deploy, generate code and build the subgraph.

## Adding a new V2 DEX

1. Modify the manifest of the networks that should support the new V2 DEX in [subgraph-manifests](./subgraph-manifests):

- The Factory contract of the DEX must be included in the manifest, at the `dataSources` section, following the same pattern as the other DEXs.
- In case that the new DEX events or code is a little different from the UniswapV2 original one, some additional things are required:
  - You should add its ABI in the [abis](./abis/) folder. For the Pair and the Factory.
  - A new template for this DEX must be added in the subgraph manifest, with the correct events and handlers.
  - You should create personalized handlers for this new DEX, to handle events emitted by this personalized template, following the pattern of the other ones at [v2-pools/mappings/factory/dexs](./src/v2-pools/mappings/pool/dexs/) (WARNING:
    DON'T FORGET TO IMPORT THE EVENT FROM THE SAME DEX AS THE HANDLER, IMPORTING OTHER DEX EVENT CAN CAUSE BUGS).

2. Create a factory handler specific for the new DEX in [v2-pools/mappings/factory/dexs](./src/v2-pools/mappings/factory/dexs), following the pattern of the other ones (WARNING: Be sure to import the correct event from the same DEX, importing other DEX event can cause bugs)

3. Create a new function in [v2-position-manager-address.ts](./src/v2-pools/utils/v2-position-manager-address.ts) to return the address of the position
   manager for this new DEX for each network and attach it to its handler

4. Modify the root subgraph manifest [subgraph.yaml](./subgraph.yaml) to include the new DEX in the subgraph, so tests can be ran without any compilation error, this is simply copying and pasting the newly added config from the others manifests, but changing the network to `mainnet`
   and changing the path of the handlers and files

5. Code tests for this nex DEX handlers if possible :)

## Adding a new V3 DEX

1. Modify the manifest of the networks that should support the new V3 DEX in [subgraph-manifests](./subgraph-manifests):

- The Factory contract of the DEX must be included in the manifest, at the `dataSources` section, following the same pattern as the other DEXs.
- In case that the new DEX events or code is a little different from the UniswapV3 original one, some additional things are required:
  - You should add its ABI in the [abis](./abis/) folder. For the Pool and the Factory.
  - A new template for this DEX must be added in the subgraph manifest, with the correct events and handlers.
  - You should create personalized handlers for this new DEX, to handle events emitted by this personalized template, following the pattern of the other ones at [v3-pools/mappings/factory/dexs](./src/v3-pools/mappings/pool/dexs/) (WARNING:
    DON'T FORGET TO IMPORT THE EVENT FROM THE SAME DEX AS THE HANDLER, IMPORTING OTHER DEX EVENT CAN CAUSE BUGS).

2. Create a factory handler specific for the new DEX in [v3-pools/mappings/factory/dexs](./src/v3-pools/mappings/factory/dexs), following the pattern of the other ones (WARNING: Be sure to import the correct event from the same DEX, importing other DEX event can cause bugs)

3. Create a new function in [v3-position-manager-address.ts](./src/v3-pools/utils/v3-position-manager-address.ts) to return the address of the position
   manager for this new DEX for each network and attach it to its handler

4. Modify the root subgraph manifest [subgraph.yaml](./subgraph.yaml) to include the new DEX in the subgraph, so tests can be ran without any compilation error, this is simply copying and pasting the newly added config from the others manifests, but changing the network to `mainnet`
   and changing the path of the handlers and files

5. Code tests for this nex DEX handlers if possible :)

## Adding a new V4 DEX

1. Modify the manifest of the networks that should support the new V4 DEX in [subgraph-manifests](./subgraph-manifests)

2. Create a pool manager initialize handler specific for the new DEX in [v4-pools/mappings/pool-manager/dexs](./src/v4-pools/mappings/pool-manager/dexs), following the pattern of the other ones

3. Create a new function in [common/position-manager-address.ts](./src/common/position-manager-address.ts) to return the address of the position manager address in the `V4PositionManagerAddress` object for each network that the new DEX is supported

4. Add the V4 State view address for the new V4 DEX if applicable in [utils/v4-state-view-address.ts](./src/v4-pools/utils/v4-state-view-address.ts). If not applicable, just pass `null` to the handler

5. Add the permit2 address for the new V4 DEX in [common/permit2-address.ts](./src/common/permit2-address.ts).

6. Code tests for this nex DEX handlers if possible :D
