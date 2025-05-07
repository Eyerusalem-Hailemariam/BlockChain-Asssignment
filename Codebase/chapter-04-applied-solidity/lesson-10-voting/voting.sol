// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
        bool executed;
        mapping(address => bool) hasVoted;
        mapping(address => bool) voteDirection;
    }

    Proposal[] public proposals;

    mapping(address => bool) public members;

    // Events
    event ProposalCreated(uint256 proposalId);
    event VoteCast(uint256 proposalId, address voter);
    event ProposalExecuted(uint256 proposalId);

    constructor(address[] memory _members) {
        members[msg.sender] = true; // Deployer is a member
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(members[msg.sender], "Not a member");
        _;
    }

    function newProposal(address _target, bytes calldata _data) external onlyMember {
        proposals.push();
        uint256 id = proposals.length - 1;
        Proposal storage p = proposals[id];
        p.target = _target;
        p.data = _data;

        emit ProposalCreated(id);
    }

    function castVote(uint256 proposalId, bool supportsProposal) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal already executed");

        if (proposal.hasVoted[msg.sender]) {
            bool previousSupport = proposal.voteDirection[msg.sender];
            if (previousSupport != supportsProposal) {
                if (previousSupport) {
                    proposal.yesCount--;
                    proposal.noCount++;
                } else {
                    proposal.noCount--;
                    proposal.yesCount++;
                }
            }
        } else {
            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            proposal.hasVoted[msg.sender] = true;
        }

        proposal.voteDirection[msg.sender] = supportsProposal;

        emit VoteCast(proposalId, msg.sender);

        // Execute proposal if it has 10 yes votes and hasn't already been executed
        if (!proposal.executed && proposal.yesCount >= 10) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
            emit ProposalExecuted(proposalId);
        }
    }
}
