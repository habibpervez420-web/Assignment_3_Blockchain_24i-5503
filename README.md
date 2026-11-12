# CryptoGig — Decentralized Freelance Escrow DApp

**Student:** Habibullah Pervez Qureshi  
**Roll Number:** 24i-5503  

## Overview
A decentralized freelance escrow application built with Solidity, Truffle, Ganache CLI, and Ethers.js. A client deposits ETH into the smart contract for a designated freelancer, locking the funds on-chain until the client releases payment.

## Project Structure
- `contracts/FreelanceEscrow.sol` — Escrow smart contract (`depositFunds`, `releaseFunds`, `getEscrowDetails`)
- `migrations/1_deploy_contract.js` — Truffle deployment script
- `src/index.html` — Web3 frontend integrated with MetaMask and Ethers.js v5
- `screenshots/` — Execution proof (compilation, deployment, and live dApp transaction)
- `truffle-config.js` — Local Ganache network and Solidity `0.8.20` compiler configuration

## How to Run Locally
1. Start **Ganache CLI** on port `8545`:
   ```bash
   ganache