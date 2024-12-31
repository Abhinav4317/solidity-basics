// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    //uint256 favoriteNumber
    //similarly you can create variables of type=>particular contract
    //SimpleStorage public simpleStorage;//variable of type SimpleStorage contract

    //lets create an array of simple storage type to store addresses of each simple storage contract deployed thorigh storageFactory
    SimpleStorage[] public listSimpleStorage;
    function createSimpleStorageContract() public{
        //how does my storage factory contract know about simple storage contract
        //one way i sto copy the simple storage contract code in this file
        //other way is to import the contract
        //also named imports should be preferred
        SimpleStorage newSimpleStorageContract=new SimpleStorage();//deploying the contract
        listSimpleStorage.push(newSimpleStorageContract);
    }
    function sfStore(uint256 _simpleStorageIndex,uint256 _newSimpleStorageNumber) public {
        //basically learning how to make storageFactory interact with the smart contracts deployed through it
        //need two things for this:Address and ABI(Application Binary Interface)
        SimpleStorage mySimpleStorage=listSimpleStorage[_simpleStorageIndex];//fetch a given simpleStorage contract as per its index
        mySimpleStorage.store(_newSimpleStorageNumber);//accessing the store function inside given simpleStorage contract to set the 
        //favorite number variable
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage=listSimpleStorage[_simpleStorageIndex];//fetch a given simpleStorage contract as per its index
        return mySimpleStorage.retrieve();
    }

}