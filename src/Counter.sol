// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC2771Context} from "lib/openzeppelin-contracts/contracts/metatx/ERC2771Context.sol";

contract Counter is ERC2771Context {
    uint256 public number;

    // deploy address contract = 0x85D0E73782Aa6775e1e3D950Ddc99C35A45974d2

    address public lastUser;
    address private _trustedForwarder;

    event updateCount(uint256 newCount);

    constructor(address _t) ERC2771Context(_t) {
        _trustedForwarder = _t;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
        lastUser = _msgSender();
    }

    function increment() public {
        number++;
        emit updateCount(number);
        lastUser = _msgSender();
    }

    function decrement() public {
        number--;
        emit updateCount(number);
        lastUser = _msgSender();
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function getLastUser() public view returns (address) {
        return lastUser;
    }
}
