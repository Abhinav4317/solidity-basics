// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //or you could use >=0.8.18 <0.9.0 OR just 0.8.18


//demonstration of inheritance
import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFiveStorage is SimpleStorage{
    //function overriding
    function store(uint256 _newNumber) public override {
        //also the original function in parent class must be virtual to be overridable
        myfavoriteNumber=_newNumber+5;
    }
}