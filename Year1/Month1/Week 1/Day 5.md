Here I learnt about fuction modifiers which are view, pure and payable.

View is exactly read-only, you can't modify any information but you can read it.

Pure doesn't allow read or write operation on the contract.

Payable is used for functions that are allowed to receive ETH.
Without payable, a function cannot accept any cryptocurrency sent to it.

    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;

    contract VisibilityExample {
    uint public number = 5;
    uint public _number;
    uint public x;
    uint public y;
    address public wallet_address = 0x0000000000000000000000000000000000000000;

   
    function getValue() public view returns (uint) {
        return number;
    }

    function calc() private pure {
        _number =x + y;
        return _number;
    }

    function deposit() public payable {
    }
    }
