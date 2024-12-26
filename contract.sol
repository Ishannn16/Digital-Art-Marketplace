// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for ERC-721 NFT (for digital artwork)
interface IERC721 {
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function ownerOf(uint256 tokenId) external view returns (address);
    function transferFrom(address from, address to, uint256 tokenId) external;
}

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract DigitalArtMarketplace {

    // Declare the ERC-721 NFT (for representing digital art) and ERC-20 (if used for payments)
    IERC721 public artNFT;
    IERC20 public paymentToken;

    // Struct to store details about an artwork listing
    struct ArtworkListing {
        uint256 tokenId;          // The NFT (digital artwork) tokenId
        address artist;           // Artist's address
        uint256 price;            // Price of the artwork (in tokens or ether)
        bool isSold;              // Whether the artwork has been sold
    }

    // Mapping from tokenId to the artwork listing
    mapping(uint256 => ArtworkListing) public listings;

    // Event for when artwork is listed
    event ArtworkListed(uint256 indexed tokenId, address indexed artist, uint256 price);

    // Event for when artwork is sold
    event ArtworkSold(uint256 indexed tokenId, address indexed buyer, uint256 price);

    // Constructor to set the ERC-721 and ERC-20 addresses
    constructor(address _artNFT, address _paymentToken) {
        artNFT = IERC721(_artNFT);
        paymentToken = IERC20(_paymentToken);
    }

    // Function 1: List artwork for sale (minted as an ERC-721 NFT)
    function listArtwork(uint256 tokenId, uint256 price) external {
        address owner = artNFT.ownerOf(tokenId);
        require(owner == msg.sender, "Only the owner can list the artwork for sale");
        require(price > 0, "Price must be greater than 0");

        // Record the artwork listing details
        listings[tokenId] = ArtworkListing({
            tokenId: tokenId,
            artist: msg.sender,
            price: price,
            isSold: false
        });

        // Emit an event to log the artwork listing
        emit ArtworkListed(tokenId, msg.sender, price);
    }

    // Function 2: Buy artwork from the marketplace
    function buyArtwork(uint256 tokenId) external {
        ArtworkListing storage listing = listings[tokenId];
        require(!listing.isSold, "This artwork has already been sold");
        require(listing.price > 0, "Artwork price is not set");

        // Ensure the buyer has enough tokens to make the purchase
        uint256 price = listing.price;
        require(paymentToken.balanceOf(msg.sender) >= price, "Insufficient funds to purchase artwork");

        // Transfer the payment (tokens) to the artist
        paymentToken.transferFrom(msg.sender, listing.artist, price);

        // Transfer the artwork (NFT) from the artist to the buyer
        artNFT.safeTransferFrom(listing.artist, msg.sender, tokenId);

        // Mark the artwork as sold
        listing.isSold = true;

        // Emit an event for the artwork sale
        emit ArtworkSold(tokenId, msg.sender, price);
    }

    // Function to check the listing of an artwork
    function getArtworkListing(uint256 tokenId) external view returns (address artist, uint256 price, bool isSold) {
        ArtworkListing storage listing = listings[tokenId];
        return (listing.artist, listing.price, listing.isSold);
    }
}
