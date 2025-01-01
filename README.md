# Zup Dexs Subgraph

This is the primary subgraph used by the Zup Protocol to calculate yields. It aggregates data from all protocols supported by Zup across different networks. For each network, it includes all Zup-supported DEXs in a single subgraph.

## Dependencies

- **Node.js**

  - To know if Node.js is installed, run `node --version` you should see a response like `vX.X.X`.
  - If Node.js is not installed, head over to [How to install Node.js](https://nodejs.org/en/learn/getting-started/how-to-install-nodejs)

- **Docker**

  - To know if Docker is installed, run `docker --version` you should see a response like `Docker version X.X.X`.
  - If Docker is not installed, head over to [How to install Docker](https://docs.docker.com/get-docker/)

- **Yarn**
  - To know if Yarn is installed, run `yarn --version` you should see a response like `yarn x.x.x`.
  - If Yarn is not installed, head over to [Yarn installation](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)

## Installation

1. Clone the repository
2. run `yarn install`
3. run `yarn codegen && yarn build`

## Running tests

To run all the tests, just open your terminal and type:

```bash
yarn test
```

## Adding a new network

To add a new network to the subgraph, you need to do a few things:

1. Add the network to the [networks.json](./networks.json) file, with all the necessary information for the subgraph, such as all DEXs factory for that network.
2. Add a new constant with the same network name as `networks.json` in [current-network.ts](./src/utils/current-network.ts) for the new network.
3. Add a new entry for each function defined in [current-network.ts](./src/utils/current-network.ts) that needs to be overriden for the new network.

After that is done, you can run `yarn codegen && yarn build` to generate the new subgraph build and deploy it!
