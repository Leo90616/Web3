//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4; 

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyFriendNFT is ERC721 {

    uint256 public tokenID;
    string public baseURI;

    constructor() ERC721("MyFriendNFT", "BFC5") {
        tokenID = 0;
        baseURI = "https://bafkreie3fqvuvc25wsdecj3wk56kwtz7vi7kngdw5uotxklyzftgnlfvmu.ipfs.nftstorage.link/";
    }   


    function Mint(address to) public {
        _safeMint(to, tokenID); 
        tokenID++;
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        return baseURI;
    }

}