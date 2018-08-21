pragma solidity ^0.4.8;

contract HelloWorld {
    // instance variable
    string greeting;

    // constructor
    constructor(string _greeting) public {
        greeting = _greeting;
    }

    // hello!
    function hello() public view returns (string) {
        return greeting;
    }
}
