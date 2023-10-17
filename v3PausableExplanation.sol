/* Pausable 

ERC20Pausable.sol 

- ability to pause and unpause token transfers
- includes functions and variables to control the token's pause state
- pausing the contract can be essential in certain situations, such as addressing security concerns or making upgrades to the contract
- contract is initially deployed, it is often set to an unpaused state
- Usage = check the current state of the contract to determine whether token transfers should be allowed or not

==========
Functions:

**pause() (function):
- allows the contract owner to pause token transfers
- when the contract is paused, token transfers are temporarily disabled, preventing any further movement of tokens
Access Control: - typically, only the contract owner (the address that deployed the contract) can call this function 


**unpause() (function):
- allows the contract owner to unpause token transfers 
- token transfers are re-enabled, and users can resume transferring tokens
Access Control: - similar to pause(), only the contract owner can call this function, ensuring that only the owner has the 

==========
Variables:

**paused (bool):
- represents the current state of the contract—whether it's paused (true) or unpaused (false). 