// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LPtoken is ERC721 {

    address project;
    mapping (uint => uint) public deposits;

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {
        project = msg.sender;
    }

    modifier isProject(){
        require(msg.sender == project);
        _;
    }

    function mint(address _account,uint256 _tokenId,uint256 _deposit) external isProject {
        _mint(_account,_tokenId);
        deposits[_tokenId] = _deposit;
    }

    function withdraw(uint256 _id) external isProject returns (uint){
        require(ownerOf(_id) == msg.sender);
        return deposits[_id];
    } 

    function resetExternal(uint _id) external isProject {
        deposits[_id] = 0;
    }
 
}