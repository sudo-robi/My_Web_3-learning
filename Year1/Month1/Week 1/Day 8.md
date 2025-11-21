Day 8 Solidity: Demonstrate if/else, require, revert, assert, msg.sender, and view/pure functions


    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract Day_8 {
     uint public number=9;
     bool internal question;
     address public wallet_address;
     string private text= "God please bless my struggles in my journey to web3";
      bytes32 public words;

    function hashText() public {
       words = keccak256(abi.encodePacked(text));
    }

    function updatingPrivateFunction () external returns (string memory) {
    string memory _text= "It is done, keep pushing i will surprise you";
      text=_text;
        return text;
                      }
    function getting() public view returns(uint) {
                      return (number);
    }
    function adding2Variable(uint a, uint b) public pure returns(uint) {
    return (a + b);
    }
    function receivePayment () public payable returns(address) {
    wallet_address= msg.sender;
    return wallet_address;
    }
    function amountsent() public payable returns(uint) {
    number = number + msg.value;
    return (number);
    }
    function contractBalance() public view returns(string memory) {
    if (number > 5) {
    return "Large balance";
    }
    else { 
    return "Small balance";
    }
    }
    function amountBalance() public payable returns(uint) {
      require(number > 10, "Number must be greater than 10");
    return(number);
    }
     function smallBalance() public view  returns(string memory) {
        if (number < 10) {
            revert("small number");
                    }
                    return "large number";
     }
     function assertChecking() public view {
        assert(number == 5+4);
     }
    

     }
   
  
  
