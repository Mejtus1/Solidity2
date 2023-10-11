// Burnable

// ERC20Burnable.sol 

// - extension of ERC20 standard 
// - adds capability to burn, destroy tokens
// - includes additional functions and variables 

//--------
/* Functions:

**burn(uint256 amount) (function):
- allows an address to burn (destroy) a specified amount of its own tokens
- reduces the total token supply by the burned amount
- amount (uint256): = number of tokens to be burned

**burnFrom(address account, uint256 amount) (function):
- allows a specific address (the account) to burn a specified amount of tokens from the sender's (msg.sender) balance 
- also reduces the total token supply
- account (address): address from which tokens will be burned
- amount (uint256): number of tokens to be burned

----------
Variables:

BurnerRole = internal role that is defined within ERC20Burnable.sol 
- allows certain addresses to be designated as "burners" 
- these designated burners have the privilege to use the burn and burnFrom functions, which are otherwise restricted

This role is controlled by the grantBurner and revokeBurner functions:

**grantBurner(address account) (internal function):
- allows the contract owner to grant burner privileges to a specific address 
- addresses with burner privileges can burn tokens
- account (address): address to be granted burner privileges

**revokeBurner(address account) (internal function):
- allows the contract owner to revoke burner privileges from a specific address, removing their ability to burn tokens
- account (address): address from which burner privileges will be revoked