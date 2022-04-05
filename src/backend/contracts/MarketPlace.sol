
// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.4;

pragma solidity >=0.4.22 <0.9.0;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Marketplace is ERC721URIStorage {
    // Variables
    //immutable means y can assign value only once.
    address payable public immutable feeAccount; // the account that receives fees
    uint public immutable feePercent; // the fee percentage on sales 
    uint public itemCount; 
    //fee constriuctor
     constructor(uint _feePercent) {
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }

}