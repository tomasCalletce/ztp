// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../tokens/lpToken.sol";

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
        fundingGoal = _fundRaisingGoal;
        creator = _creator;
        projectTimeFrame = _projectTimeFrame;
        admin = _admin;
   }

   modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
   }

   function startDeposits(string memory _name, string memory _symbol) external onlyAdmin {
        require(!open);
        lpToken = new LPtoken(_name,_symbol);
        open = true;
   }

   function deposit() external payable returns (uint){
        require(open);
        require(fundsInPool + msg.value <= fundingGoal);
        uint _lpTokenId = lpcounter;
        lpToken.mint(msg.sender,lpcounter,msg.value);
        lpcounter++;
        fundsInPool += msg.value;
        return _lpTokenId;
   }

   function closeDeposits() external onlyAdmin {
        require(open);
        open = false;
   }

   function withdrawDeposit() external onlyAdmin {
        require(!open);
        payable(admin).transfer(fundsInPool);
   }

   // 60% ---> .6 -----> 6*10^17
   function depositWithGains(uint _rateOFreturnWEI) external payable onlyAdmin {
        require(!withdrawsOpen);
        require(!open);
        require(msg.value == (_rateOFreturnWEI*fundsInPool)/10^18 + fundsInPool);
        fundingWithRateOfReturn = msg.value;
        withdrawsOpen = true;
        rateOFreturnWEI = rateOFreturnWEI;
   }

   function withdraw(uint _id) external {
        require(!withdrawsOpen);
        uint _deposits = lpToken.withdraw(_id);
        payable(msg.sender).transfer((rateOFreturnWEI*_deposits)/10^18 + _deposits);
        lpToken.resetExternal(_id);
   }


}