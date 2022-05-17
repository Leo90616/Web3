// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyFirstNFT is ERC721, Ownable {

    constructor() ERC721("MyFirstNFT", "PID") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://bafkreie3fqvuvc25wsdecj3wk56kwtz7vi7kngdw5uotxklyzftgnlfvmu.ipfs.nftstorage.link/";
    }

    function safeMint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }
 
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0
            ? string(abi.encodePacked(currentBaseURI))
            : "";
    }
}