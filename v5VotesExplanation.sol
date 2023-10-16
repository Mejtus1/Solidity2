/*
- extension of ERC-20 token standard that adds ability to handle token governance and voting-related features
- delegated voting allows token holders to assign voting power to representatives, streamlining decision-making process in governance protocols
- also introduces an advanced mechanism for tracking and managing history of votes, enabling more sophisticated governance solutions

----------
Functions:

**_transfer(address sender, address recipient, uint256 amount) (function):
- internal override of the _transfer function from base ERC-20 token
- it is called when tokens are transferred between addresses
- overridden in ERC20Votes.sol to update voting power and delegate information when transfers occur

**getPriorVotes(address account, uint256 blockNumber) (function):
- allows you to retrieve the number of votes an account (address) had at a specific block number 
- track the voting history and power of a particular address at a past block
- account (address): address for which you want to retrieve the votes
blockNumber (uint256): The specific block number at which you want to determine the votes

**delegate(address delegatee) (function):
- allows token holders to delegate their voting power to another address (delegatee). 
- delegating voting power is a common feature in governance tokens, as it allows token holders to delegate their voting influence to representatives who can vote on their behalf
- delegatee (address): The address to which voting power is being delegated

**delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) (function):
- allows token holders to delegate their voting power to another address using an ECDSA signature
- simplifies the delegation process by allowing token holders to sign a message to delegate their votes to a specific delegatee
- delegatee (address): address to which voting power is being delegated
- nonce (uint256): unique nonce to prevent replay attacks
- expiry (uint256): timestamp representing the expiration time for the signature

**getCurrentVotes(address account) (function):
- allows you to retrieve current voting power of a specific address 
- returns the number of votes an account currently has based on its delegation
- account (address): address for which you want to retrieve the current votes

----------
Variables:

delegates (mapping (address => address)):
- stores information about delegate for each token holder
- account delegates its votes to another address, this mapping records delegatee address

nonces (mapping (address => uint256)):
- stores nonces for each address, which are used to prevent replay attacks when using the delegateBySig function