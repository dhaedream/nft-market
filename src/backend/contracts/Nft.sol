// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    uint public tokenCount ;
    //called once
    //call constructor on inhereted erc contract
    //erc args > name of nft + Symbol
    constructor() ERC721("DApp NFT", "DAPP") {};

    //functuion to mint new nfts
    //token uri is location on ipfs
    //external means its called from outside contract
    //return(data type)
    function mint(string memory _tokenUri) external returns(uint) {
        //increase by 1
        tokenCount ++;
        //mint new NFT . safeM comes zepplin import.
        //args are sender + id(corresponds w tokenCount)
        _safeMint(msg.sender, tokenCount);
        //set metadata, args = id + location
        _setTokenURI(tokenCount, _tokenURI);
        //return id
        return(tokenCount);
    }
}