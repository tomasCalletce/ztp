// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./Project.sol";

contract ProjectMaker {

    address public admin;
    Project[] public projects;

    constructor() {
        admin = msg.sender;
    }

    function makeProyecto(uint _fundRaisingGoal,address _creator,address _admin,uint _projectTimeFrame) external returns (uint256) {
    }


}