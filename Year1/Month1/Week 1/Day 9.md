Loops structure practice

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract LoopDemo {
    // Function to sum numbers from 1 to n using a for loop
    function sumUpTo(uint n) public pure returns (uint) {
        uint sum = 0;
       for (uint i = 1; i <= n; i++) {
          //  sum += i;
        }
       return sum;
    }
        }
    
    
  While structure practice
  
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;
    contract LoopDemo {
    // Function to calculate factorial using a while loop
    function factorial(uint n) public pure returns (uint) {
        uint result = 1;
        uint i = 1;
        
        while (i <= n) {
            result = result * i;
            i++;
        }
        
        return result;
    }
    }
