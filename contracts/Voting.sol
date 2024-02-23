// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    address owner;
    struct VotingDetails {

        address CandidateAddress;
        string CandidateName;
        string CandidateParty;
        address[] Voters;

    }

    mapping (address => bool) hasVoted;

    VotingDetails[] votingDetailsArray;

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    function AddCandidate(address _candidateAddress, string memory _candidateName, string memory _candidtateParty) external  onlyOwner{

            VotingDetails memory votingdetails;

            votingdetails.CandidateAddress = _candidateAddress;
            votingdetails.CandidateName =_candidateName;
            votingdetails.CandidateParty = _candidtateParty;
            votingDetailsArray.push(votingdetails);
    }

    function ViewCandidate() external view returns (VotingDetails[] memory) {
        return votingDetailsArray;
    }

    function VoteCandidate (uint256 _index) external {
        VotingDetails storage vote = votingDetailsArray[_index];
        require(!hasVoted[msg.sender],"can't sign twice");
        vote.Voters.push(msg.sender);

        
    }
}