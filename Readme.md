# Digital Art Marketplace

## Overview

The **Digital Art Marketplace** is a decentralized platform that allows artists to list their digital artwork as NFTs (Non-Fungible Tokens) for sale, and allows buyers to purchase them using an ERC-20 payment token (e.g., USDT, DAI). The marketplace is built on Ethereum, utilizing the **ERC-721** standard for NFTs and the **ERC-20** standard for token-based payments. The contract allows artists to list their artwork, buyers to purchase it, and the transfer of ownership of the NFTs between the artist and buyer upon successful transactions.

## Features

- **NFT Art Listing**: Artists can list their artwork as an NFT for sale by providing a token ID and setting a price in ERC-20 tokens.
- **Art Purchase**: Buyers can purchase available artwork by sending the specified amount of ERC-20 tokens to the artist.
- **Artwork Transfer**: When a purchase is made, the ownership of the artwork (NFT) is transferred from the artist to the buyer.
- **Marketplace Tracking**: The contract tracks artwork listings, including the artist's address, price, and whether the artwork has been sold or not.

## Technologies

- **Solidity**: Ethereum smart contracts using Solidity for business logic.
- **Web3.js**: JavaScript library to interact with Ethereum blockchain.
- **MetaMask**: Ethereum wallet to handle user authentication and transaction signing.
- **ERC-721**: Token standard for NFTs representing unique digital artwork.
- **ERC-20**: Token standard for fungible tokens used for payments.

## Prerequisites

- **MetaMask**: A browser extension that acts as a wallet and Ethereum account management.
- **Web3**: Web3.js library to interact with the Ethereum blockchain.
- **Ether or ERC-20 Tokens**: Necessary for transaction and purchase on the platform.

### Key Components

- **Connect Wallet**: MetaMask integration to authenticate users and manage wallet addresses.
- **List Artwork**: Interface for artists to list their NFTs with a price.
- **Buy Artwork**: Interface for users to purchase available artwork by entering the artwork token ID.
- **View Listings**: Display all available artwork for sale, including the artist, price, and sale status.

### Frontend Features

- **Connect Wallet**: The user can connect their MetaMask wallet to interact with the Ethereum blockchain.
- **List Artwork**: Artists can enter a token ID and price to list their artwork for sale.
- **Buy Artwork**: Buyers can input a token ID to purchase available artwork.
- **View Listings**: Displays artwork currently listed for sale along with details (artist, price, and sale status).

### Required Libraries

- **Web3.js**: Used for interacting with Ethereum blockchain and the smart contract.
- **MetaMask**: A wallet extension for Ethereum that enables interaction with decentralized applications.

## Installation & Deployment

1. **Install MetaMask**: Install the MetaMask browser extension and create an Ethereum wallet.
2. **Deploy Smart Contract**:
   - Deploy the smart contract to an Ethereum network (e.g., Rinkeby for testing or mainnet for production).
3. **Frontend Setup**:
   - Clone the repository and replace the contract address, NFT token address, and ERC-20 token address with your deployed contract addresses.
   - Open the `index.html` in your browser and use it to interact with the marketplace.

## Contributing

Contributions are welcome! Please feel free to submit issues, fork the repository, or create pull requests to add new features or fix bugs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Credits

- **Solidity**: Ethereum smart contract language.
- **Web3.js**: Ethereum JavaScript API.
- **MetaMask**: Ethereum wallet and browser extension.
