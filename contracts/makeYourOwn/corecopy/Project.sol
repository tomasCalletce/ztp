// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../tokenscopy/lpToken.sol";

contract Project {

    bool open;
    bool withdrawsOpen;
    address creator;
    address admin;
    uint fundsInPool;
    uint fundingGoal;
    uint fundingWithRateOfReturn;
    uint rateOFreturnWEI;
    uint projectTimeFrame;
    uint lpcounter;
    LPtoken lpToken;

   constructor(uint _fundRaisingGoal,address _creator,address _admin,uint _projectTimeFrame){
       
   }

   function startDeposits(string memory _name, string memory _symbol) external  {
        
   }

   function deposit() external payable returns (uint){

   }

   function closeDeposits() external  {

   }

   function withdrawDeposit() external  {

   }

   // 60% ---> .6 -----> 6*10^17
   function depositWithGains(uint _rateOFreturnWEI) external payable {

   }

   function withdraw(uint _id) external {

   }


}