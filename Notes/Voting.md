## Lesson 10: Voting System

### Key Concepts
- **Proposals**: A proposal consists of a target address and calldata, which will be executed if the proposal passes.
- **Voting**: Members can cast votes (`yes` or `no`) on proposals.
- **Execution**: A proposal is executed if it receives a sufficient number of `yes` votes.

### Features Implemented
1. **Proposal Storage**:
   - A `Proposal` struct stores the target address, calldata, vote counts, and execution status.
   - Proposals are stored in a public array `proposals`.

2. **Creating Proposals**:
   - The `newProposal` function allows members to create proposals by specifying a target address and calldata.

3. **Voting**:
   - Members can cast votes using the `castVote` function.
   - The function ensures that members cannot vote multiple times on the same proposal.

4. **Execution**:
   - A proposal is executed automatically if it receives 10 or more `yes` votes.

### Code Highlights
- **Struct Definition**:
   ```solidity
   struct Proposal {
       address target;
       bytes data;
       uint256 yesCount;
       uint256 noCount;
       bool executed;
       mapping(address => bool) hasVoted;
       mapping(address => bool) voteDirection;
   }
   ```
- **Proposal Creation**:
   ```solidity
   function newProposal(address _target, bytes calldata _data) external onlyMember {
       proposals.push();
       uint256 id = proposals.length - 1;
       Proposal storage p = proposals[id];
       p.target = _target;
       p.data = _data;
       emit ProposalCreated(id);
   }
   ```
