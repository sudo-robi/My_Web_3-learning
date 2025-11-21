Gas risks on looops.

Loops are useful in Solidity, but they also introduce major gas risks. Because every iteration costs gas, poorly designed loops can make your smart contract expensive, slow, or even fail to run.

Each iteration costs gas, every time the loop runs, you pay gas for: updating the counter (i++), checking the condition (i < something) and executing the code inside the loop. So the more the loop repeats, the more gas you spend.

Unbounded loops can fail
If a loop depends on something with unknown or unlimited size, such as:

     for (uint i = 0; i < users.length; i++) {
    ...
    }
    while loops are extra dangerous

A while loop can continue forever if the condition never changes.

    while (balance > 0) {
    // missing decrease → infinite loop → guaranteed revert
    }
If a loop runs 1,000,000 times:

Gas = 1,000,00O(n) (linear growth) it will cost millions of gas.

This can make your function very expensive to call and impossible to call if gas needed > block limit.

Best Practices to Reduce Loop Gas Costs.

Avoid loops over large dynamic arrays.
Instead of looping through all elements, use mappings and track counts separately.

Never use loops that depend on user input
Users could trick the contract into running a loop millions of times.

Break large tasks into smaller transactions
Use a “batch processing” pattern.

Use events instead of storing too much in arrays
Storing data on-chain inside loops is expensive.
