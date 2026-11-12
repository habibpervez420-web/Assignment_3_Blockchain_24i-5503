// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelanceEscrow {
    address public client;
    address payable public freelancer;
    uint256 public amount;
    bool public isCompleted;


    event Deposited(address indexed client, address indexed freelancer, uint256 amount);
    event Released(address indexed client, address indexed freelancer, uint256 amount);

    function depositFunds(address payable _freelancer) public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        require(!isCompleted, "Escrow already completed");
        
        client = msg.sender;
        freelancer = _freelancer;
        amount = msg.value;
        isCompleted = false;

        emit Deposited(client, freelancer, amount);
    }

    function releaseFunds() public {
        require(msg.sender == client, "Only the client can release the funds");
        require(!isCompleted, "Funds have already been released");
        require(amount > 0, "No funds available to release");

        isCompleted = true;
        uint256 payment = amount;
        amount = 0;

        (bool success, ) = freelancer.call{value: payment}("");
        require(success, "Transfer failed.");

        emit Released(msg.sender, freelancer, payment);
    }

    function getEscrowDetails() public view returns (address, address, uint256, bool) {
        return (client, freelancer, amount, isCompleted);
    }
}