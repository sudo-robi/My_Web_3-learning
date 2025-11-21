Today I looked at global object like msg.value, msg.sender, block.timestamp, msg.data and tx.origin. 

'msg.value' is the amount of ETH spent with a transaction when a smart contract function is called.

'msg.sender' is the address of the account that called the current function.

'block.timestamp' is the timestamp of the block in which your transaction was included or when it was mined.

'msg.data' is the complete calldata of the function call.

'tx.origin' is the original external account that started the transaction.


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

My Reflection from Day 1 to Day6.

Over the past six days, I have been steadily exploring Solidity and its core concepts. I started with the basic data types (uint, bool, address, string, and bytes) and practiced creating state variables in Remix. I learned how visibility keywords like public, private, internal, and external affect access to functions and variables, and I experimented with writing simple getter and setter functions.

I also explored function modifiers like view, pure, and payable, and practiced deploying contracts to observe their behavior. Day 6 focused on understanding Ethereum-specific global variables such as msg.sender, msg.value, msg.data, tx.origin, and block.timestamp. I understood msg.sender and msg.value clearly, but block.timestamp was a bit tricky, so I plan to review it tomorrow.

Overall, this week has been a mix of hands-on practice and theory, helping me gradually connect Solidity syntax with how the Ethereum blockchain works. I feel more confident reading and writing contracts and am building a clearer picture of how transactions and blockchain data interact with smart contracts.
