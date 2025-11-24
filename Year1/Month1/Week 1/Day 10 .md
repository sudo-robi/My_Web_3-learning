I learnt about dynamic and fixed arrays.

Fixed array is an array that the size of the array and the values that can be inputed into that field is fix, an array of uint[6] public age, can only accomodate exactly 6 age values when declared like this and no values have been given to the array the array automatically stores it like this age[0, 0, 0, 0, 0, 0].
Note after declaration of a fixed array the size can not be changed. push() and pop() do not take effect on a fixed array only, if we which to access the array we must use indices for example age[2] to access the third age. There isn't need to use .length to get the length of the function since after declaring our array we know our array must contain that specific amount of values.

Then I found dynamic almost quite the contrary. Here I could use .push() and .pop() to add and remove items to my array. This partucular type of array can grow and shrink during the program. Syntax for this is uint[] public age;



I went further to learn what STRUCT and CONSTRUCTOR entails.
SRUCT is like a container that bundles several pieces of data together as one. An example will be 

    struct Student {
    string name;
    uint age;
    bool isAdmitted;
    }
so we have a new function called Student and use it this way

    Student public student1; 
    
  OR
  
    Student[] public students;

    
To store for various amount of students that will be admitted.
A constructor is a special function that automatically runs once, when the contract is deployed. The purpose of constructor is to set initial values , assign the contract owner and initialize state variables in our smart contract.

What STRUCT are used for

Used to combine multiple data fields

Written inside the contract

Typically at the top

What CONSTRUCTOR are used for

Special function

Runs once at deployment

Used to set starting values

Placed before other functions

Note Once the constructor runs it cannot be called again and its values cannot be re-initialized.





A task on CONSTRUCTORS 
Create a contract that has a string called message, it uses a constructor to set the message at deployment and has a function to read the message.

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract trying {
    string message;
    constructor () {
        message = "RUN RUN RUN";
     }
    function checking () public view returns(string memory) {
    return message;
       }
    }



    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract Trying {
        string public message;

    constructor(string memory _message) {
        message = _message;
         }
    }
Where the first smart contract uses manual getter function and message is alredy set and fixed whereas the second smart contact depends on the user input and uses automatic getter function from declaring the state variable public.

Implementing add/remove operations; test push/pop; 

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract testingArrays {
      uint32 [] public age;
      string[16] public time;
    function updateAgeArray(uint32[]memory _age) public returns(uint32[] memory) {
        age =_age;
        age.push(2);
        age[0]=7;
        age.push(67);
        age.pop();
        return age;
    }
    function settingTime(string[16]memory _time) public returns(string[16]memory) {
        time=_time;
        time[1]="5";
        time[5] = "5";
        return time;

    }
    }

