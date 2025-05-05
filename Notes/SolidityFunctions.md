 SOLIDITY FUNCTIONS
1. Constructor Arguments
A constructor runs only once when a contract is deployed.

Can accept arguments to initialize state variables.

Example:
uint public x;

constructor(uint _x) {
    x = _x;
}
The underscore (_x) avoids variable shadowing.

2. External Function – Increment
Use external when the function is only called from outside.

Modifies state → no view or pure.

Example:
function increment() external {
    x += 1;
}

3. View Function – Add
view keyword means it only reads the state, doesn't modify it.

Can return values.

Example:
function add(uint y) external view returns (uint) {
    return x + y;
}


4. Console Logging (with Foundry)
Use console.log for debugging in Foundry-based projects.

Import at the top:

import "forge-std/console.sol";
Example:
function logSecret(string calldata message) external {
    console.log(message);
}

5. Pure Function – Double
pure functions don’t read or write to state.

Used for computations only.

Example:
function double(uint value) external pure returns (uint) {
    return value * 2;
}
Alternate Syntax:


function double(uint value) external pure returns (uint result) {
    result = value * 2;
}
