// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LPtoken is ERC721 {

    address project;
    mapping (uint => uint) public deposits;

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {
    }

    function mint(address _account,uint256 _tokenId,uint256 _deposit) external {

    }

    function withdraw(uint256 _id) external returns (uint){

    } 

    function resetExternal(uint _id) external {

    }
 
}