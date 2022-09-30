# Solidity Smart Contracts of Matters Lab

## Contracts

| Name             | Network         | Address                                                                                                                         |
| ---------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| SpaceToken       | Polygon Mumbai  | [0xeb6814043dc2184b0b321f6de995bf11bdbcc5b8](https://mumbai.polygonscan.com/address/0xeb6814043dc2184b0b321f6de995bf11bdbcc5b8) |
| SpaceToken       | Polygon Mainnet | [0x264808855b0a6a5a318d238c6ee9f299179f27fc](https://polygonscan.com/address/0x264808855b0a6a5a318d238c6ee9f299179f27fc)        |
| TheSpace         | Polygon Mainnet | [0x9b71045ac2a1563dc5ff8e0c537413a6aae16cd1](https://polygonscan.com/address/0x9b71045ac2a1563dc5ff8e0c537413a6aae16cd1)        |
| TheSpaceRegistry | Polygon Mainnet | [0x8da7a7a48ebbd870358f2fd824e52e5142f44257](https://polygonscan.com/address/0x8da7a7a48ebbd870358f2fd824e52e5142f44257)        |

In the "Contract" tab of Polygonscan/Etherscan, you can see the contract code and ABI.

### ABI

See [Docs](./docs/) for Contract ABI.

### Usages

````ts
import { ethers } from "ethers";

/**
 * Instantiate contract
 */
const address = "0x203197e074b7a2f4ff6890815e4657a9c47c68b1";
const abi = '[{"inputs":[{"internalType":"string","name":"name_","type":"string"}...]';
const alchemyAPIKey = "...";
const provider = new ethers.providers.AlchemyProvider("maticmum", alchemyAPIKey);
const contract = new ethers.Contract(address, abi, provider);

## Development

Install [Forge](https://github.com/gakonst/foundry)

Environment

```bash
cp .env.local.example .env.local
````

Build

```bash
make build
```

Testing

```bash
make test
```

## Deployment

### Deploy on Local Node:

```bash
# Preprare environment
cp .env.local.example .env.local
cp .env.polygon-mainnet.example .env.polygon-mainnet
cp .env.polygon-mumbai.example .env.polygon-mumbai

# Deploy currency first, then add the contract address to THESPACE_CURRENCY_ADDRESS env variable
make deploy-the-space-currency
# Deploy the space contract
make deploy-the-space

# Deploy the snapper contract
make deploy-snapper
```

### Deploy & Verify on testnet or mainnet:

```bash
# Deploy The Space contract
make deploy-the-space

# Deploy to Poygon Mainnet
make deploy-the-space NETWORK=polygon-mainnet

# Deploy to Polygon Mumbai
make deploy-the-space NETWORK=polygon-mumbai
```

## Verify Contract Manually

```bash
# 1. Concat all file into one
forge flatten src/TheSpace/TheSpace.sol

# 2. On (Polygonscan)[https://mumbai.polygonscan.com/verifycontract], Select "Solidity (Single File)" and upload
```
