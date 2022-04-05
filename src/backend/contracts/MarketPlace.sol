// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract Marketplace is ReentrancyGuard {
    // Variables
    //immutable means y can assign value only once.
    address payable public immutable feeAccount; // the account that receives fees
    uint public immutable feePercent; // the fee percentage on sales 
    uint public itemCount; 

    //struct object to hold important info relevent to each sale
    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        uint price;
        address payable seller;
        bool sold;
    }
    //events are cheap storage / updte user interface when "listen for"
    event Offered(
        uint itemId,
        //indexed allows to search for offered events w nft filter
        address indexed nft,
        uint tokenId,
        uint price,
        //indexed allows to search for offered events w address filter
        address indexed seller
    );

    // itemId -> Item
    //method of extracting data from Struct
    mapping(uint => Item) public items;

    //fee constriuctor
     constructor(uint _feePercent) {
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }

    // Make item to offer on the marketplace
    //passing 721 instance nft contract
    //from front end, user will initalize contact + zepplin adds 721 standards
    //nonReentrant security of reentering contract b4 completion
    function makeItem(IERC721 _nft, uint _tokenId, uint _price) external nonReentrant {
        //nothing free. error message
        require(_price > 0, "Price must be greater than zero");
        // increment itemCount
        itemCount ++;
        // transfer nft
        _nft.transferFrom(msg.sender, address(this), _tokenId);
        // add new item to items mapping
        //initialize struct by passing it li8ke a function that sets key:values
        //this function will emit event
        items[itemCount] = Item (
            itemCount,
            _nft,
            _tokenId,
            _price,
            payable(msg.sender),
            false
        );
        // emit Offered event
        emit Offered(
            itemCount,
            address(_nft),
            _tokenId,
            _price,
            msg.sender
        );
    }

}