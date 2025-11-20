I learnt about read function visiblity which include public, private, internal and external.

Public

A public function can be called:

inside the contract

outside the contract

by other contracts.



Private

A private function can be called:

only inside the same contract

NOT in child contracts

NOT outside



Internal

An internal function can be called:

inside the contract

inside child contracts (contracts that inherit from it)

NOT outside



External

An external function can be called:

from outside the contract

by other contracts

NOT inside the same contract unless you use this.functionName()





// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VisibilityExample {

    uint public number = 5;

    // This function is public because it should be accessible internally and externally
    function getNumberPublic() public view returns (uint) {
        return number;
    }

    // This function is private because only this contract should use it
    function setNumberPrivate(uint _num) private {
        number = _num;
    }

    // This function is internal because child contracts should be able to use it
    function setNumberInternal(uint _num) internal {
        number = _num;
    }

    // This function is external because it should only be called from outside the contract
    function setNumberExternal(uint _num) external {
        number = _num;
    }
    
}
