My weekly review

I will rebuild all my contracts with cleaned-up comments.
      
    //Code from Day 2                                     
    // SPDX-License-Identifier: MIT
    // I named the contract MyFirstContract
     contract MyFirstContract {

    // State variable that stores the mood
    string public mood;

    // This function sets the mood value
    function setMood() public {
        mood = "I am very happy";
    }

    // This function returns the current mood
    function getMood() public view returns (string memory) {
        return mood;
    }
    }


    //Code from Day 3
    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;

    contract MyFirstContract {           //Named the contract MyFirstContract

     string public mood = "I am happy";        // State variable that stores a mood message
     uint public number = 5;                  // State variable that stores a number
     bool public question = true;            // State variable that stores a boolean value
     address public wallet_address;         // State variable that stores an address
    }



    //Code from Day 3
    // SPDX-License-Identifier: MIT

     pragma solidity ^0.8.0;

    contract myFirstContract {              //Named the contract MyFirstContract

    string public mood="I am happy";        //Declared my state variable mood as string.
    uint public number=5;                   //Declared my second state variable as number.
    bool public question= true;             //Declared my third state variable as question.
    address public wallet_address;          //Declared my fourth state variable as wallet_address.
    
    function setMood() public view returns (string memory) {          //Manually setup my getter function for mood
      return (mood);
     }

    function setNumber() public view returns (uint) {                 //Manually setup my getter function for number
    return (number);
    }

    function setQuestion() public view returns (bool) {               //Manually setup my getter function for question
    return (question);
    }

    function setWallet_address() public  view returns (address) {     //Manually setup my getter function for wallet_address
    return (wallet_address);
    }

    }



    //Code from Day 4
    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;

    contract VisibilityExample {
    
    uint public number = 5;

    // This function is public because it should be accessible internally and externally
     function getNumberPublic() public view returns (uint) {          //Manually setup my getter function for number
    return number;
    }

    // This function is private because only this contract should use it
     function setNumberPrivate(uint _num) private {                  //Manually setup my setter function for _num
    number = _num;
    }

    // This function is internal because child contracts should be able to use it
    function setNumberInternal(uint _num) internal {                 //Manually setup my setter function for _num
    number = _num;
    }

    // This function is external because it should only be called from outside the contract
     function setNumberExternal(uint _num) external {               //Manually setup my setter function for _num
    number = _num;
    }



     // Code from Day 5
    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;

    contract VisibilityExample {              //Named the contract VisibilityExample 
    uint public number = 5;                   // Declared my state variables number, wallet_address,_number, x and y
    uint public _number;
    uint public x;
    uint public y;
    address public wallet_address = 0x0000000000000000000000000000000000000000;


    function getValue() public view returns (uint) {        //My getter function to return number 
    return number;
    }

    function calc() private pure {
    _number =x + y;                                        //My getter function to return _number 
    return _number;
    }

    function deposit() public payable {
    }
    }





    //Code from Day 6
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract addContract {
    address public walletaddress;
    uint public value;
    uint public time;
    function call() public payable returns(address, uint, uint) {
    walletAddress = msg.sender;     // the address calling the function
    value = msg.value;              // the amount of ETH sent
    time = block.timestamp;         // current block timestamp

    return (walletaddress, value, time);
    }
      }
