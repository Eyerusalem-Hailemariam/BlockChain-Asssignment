// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address public owner;

    // Constructor to set the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }
}

contract Transferable is Ownable {
    // Function to transfer ownership
    function transfer(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
