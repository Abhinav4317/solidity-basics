// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //or you could use >=0.8.18 <0.9.0 OR just 0.8.18

contract SimpleStorage {
    //types:boolean,uint,int,bytes,address
    // bool hasFav=true;
    // uint256 ufav=88;// same as just uint
    // int256 fav=-88;// same as just int
    // string sfav="eigthy-eight";
    // address metaAddress=0x9694FdfD031d90BB6be9BfC4F7C51Ebe966C6B01;
    // bytes32 bfav="cat"; // not same as just bytes


    uint256 myfavoriteNumber;//0
    //you can either make this variable public to view it outside the contract or create a public getter function
    
    //now i wish to store an array of favorite numbers
    uint256[] listfavoriteNumbers=[78,90,10];

    //now i wish to store favorite numbers of diferent people with their name
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //Person public ab=Person({favoriteNumber: 7,name: "Abhinav"});

    //now make array of structs
    Person[] public favoriteNumbersStruct;//dynamic array=>you can make it static by using [3]


    //now instead of array of structs,lets use mapping to efficiently access info corresponsing to a given string
    mapping(string => uint256) public nameToFavoriteNumber;

    //now add elements to this array
    //calldata,memory-both imply that variable exists temporarily for duration of function call
    //but if you pass calldata variable to function,you cant modify it later on,but you can modify memory variable
    //by defaault varaiables are memory type but string is special data type,so specifying is important
    function addPerson(string memory _name,uint256 _favoriteNumber) public {
        favoriteNumbersStruct.push(Person(_favoriteNumber,_name));
        nameToFavoriteNumber[_name]=_favoriteNumber;
    }



    function store(uint256 _favoriteNumber) public virtual{
        myfavoriteNumber=_favoriteNumber;
    }
    //public getter function to view internal state of blockchain
    //view-keyword specifies that function strictly only reads state fron contract,no modifications can be done
    //pure-keyword disallows both reading and modification of state(no return as well)

    //view and store functions do not cause real transactions so no gas needed however if another function that alters state
    //-creating transactions-calls a pure/view function,then it costs some gas
    //returns specifies return data type
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }
}
