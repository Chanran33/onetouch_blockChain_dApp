pragma solidity 0.5.16; //solidity version 선언

contract Election {//contract로 계약 이름 정의
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write candidates
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    constructor() public {
        addCandidate("후보자 1번");
        addCandidate("후보자 2번");
        addCandidate("후보자 3번");
        addCandidate("후보자 4번");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender], "This Voter has already voted!");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "There is no such candidate");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        //triger voted event
        emit votedEvent(_candidateId);
    }

    event votedEvent (
        uint indexed _candidateId
    );

}