I learnt about various data types which include uint, bool, address, string and bytes.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyFirstContract {

    string public mood = "I am happy";
    uint public number = 5;
    bool public question = true;
    address public wallet_address;
}






// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
contract myFirstContract {

    string public mood="I am happy";
    uint public number=5;
    bool public question= true;
    address public wallet_address; 
       function setMood() public view returns (string memory) {
          return (mood);
}

      function setNumber() public view returns (uint) {
      return (number);
 }
 
      function setQuestion() public view returns (bool) {
      return (question);
 }
 
      function setWallet_address() public  view returns (address) {
      return (wallet_address);
 }
 
}



Both contracts will display the same results, the only difference between them is that the first contract uses automatic getter functions and the second contract uses manual getter function.
