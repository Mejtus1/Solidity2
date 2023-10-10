// Explanation of TokenCode.sol Contract 

contract MyToken is ERC20 
    constructor(address initialOwner)
        ERC20("MyToken", "MTK")
        Ownable(initialOwner)
    {}

/*
ERC20
- inheriting functions from OpenZeppelin contract 
- inherits all the functions and variables defined in ERC20 contract 
Constructor 
- executed only once when the contract is deployed on ETH blockchain 
- takes argument initialOwner = initial owner of the contract 
- constructor is initializing contracts state and any necesarry setup 
Initialization ERC20("MyToken", "MTK")
- initializes ERC20 token with: name of token "MyToken" 
                                symbol of token "MTK"
Ownable(initialOwner)
- sets initial owner of the contract 
- Ownable contract contains functionality to manage ownership 


--------------------------------------
ERC20 inherent functions and variables 
- standard interface for fungable tokens on Ethereum blockchain 
- set of functions and variables that contract should implement 
- ensure interoperability 
- core featuers or capabilites to the token
- these function and variables ARE CORE requirements for ERC20
- ERC20 contracts can include of

Functions:
- these functions define the basic operations for transferring and managing token balances

totalSupply (function): 
- returns total supply of tokens in circulation 

balanceOf(address owner)
- returns (uint256 balance) (function): 
- returns the balance of a specific address (owner)

transfer(address to, uint256 value) 
- returns (bool success) (function): 
- transfers tokens from the sender's address to the specified address
- returns true on success and false on failure

transferFrom(address from, address to, uint256 value) 
- returns (bool success) (function): 
- transfers tokens from one address (the from address) to another (the to address) 
- requires the sender to have been granted an allowance by the from address
- returns true on success and false on failure

approve(address spender, uint256 value) 
- returns (bool success) (function): 
- approves a third-party address (spender) to spend a certain amount of tokens on behalf of the sender
- returns true on success

allowance(address owner, address spender) 
- returns (uint256 remaining) (function): 
- returns the remaining number of tokens that a spender is allowed to spend on behalf of an owner


-------------
ERC20 Events:
- used to notify external applications and interfaces about token related activities 
- incluse Transfer:, Approval: (possible custom events created by token creator )

Transfer(address indexed from, address indexed to, uint256 value)
- transfer event is emitted whenever tokens are transferred from one address to another within the ERC-20 contract
- includes address of token sender, address of token reciever 
- includes numner of tokens trasferred 

Approval(address indexed owner, address indexed spender, uint256 value)
- is emitted when an owner approves a specific address (spender) to spend a certain number of tokens on their behalf
- includes owner: owner's address who grants the approval 
- includes spender: address that is allowed to spend tokens on behalf of the owner

----------
Variables:
- variables that track metadata about token 

name (string): 
- name of the token (e.g., "My Token")

symbol (string): 
- symbol or ticker of the token (e.g., "MTK").

decimals (uint8): 
- number of decimal places the token uses for its representation
- example, if decimals is 18, then 1 token is represented as 1 * 10^18.
*/


//================================================================================================================================
//================================================================================================================================
// PART 2 of main code

function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


//======
// The provided Solidity code appears to be part of a custom ERC-20 token contract that extends various OpenZeppelin 
// contracts to add specific functionalities and requirements. Let's break down the code step by step:


//======
function pause() public onlyOwner {
    _pause();
}
    
/*
pause(): 
- public function named (pause)
- used to pause certain operations or functionalities of the token contract
public: 
- makes function accessible from outside the contract
onlyOwner: 
- only owner of the contract can call this function 
- (Ownable) contract provides this modifier  
_pause();: 
- calls _pause() function. 
- part of ERC20Pausable contract from OpenZeppelin
- is responsible for pausing token transfers 
*/ 

//======
function unpause() public onlyOwner {
        _unpause();
}
    
/*
unpause(): 
- public function named (unpause)
- used to unpause the operations or functionalities that were previously paused
public: 
- makes function accessible from outside the contract  
onlyOwner: 
- only owner of the contract can call this function 
- (Ownable) contract provides this modifier     
_unpause();: 
- calls the _unpause() function 
- part of the ERC20Pausable contract from OpenZeppelin
- undoes the pause operation, allowing token transfers to resume.
*/
    
//======
function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
}
    
/*
mint(address to, uint256 amount): 
- public function used to mint new tokens and transfer them to the specified address
- allows the owner to create new tokens and distribute them
public: 
- makes function accessible from outside the contract      
onlyOwner: 
- only owner of the contract can call this function 
- (Ownable) contract provides this modifier      
_mint(to, amount);: 
- calls the _mint() function, 
- part of the ERC20Pausable contract from OpenZeppelin
- creates and transfers a specified amount of tokens to the provided address
*/

//================================================================================================================================
//================================================================================================================================
// PART 3 of main code 

function _update(address from, address to, uint256 value)
    internal
    override(ERC20, ERC20Pausable, ERC20Votes)
{
    super._update(from, to, value);
}

function nonces(address owner)
    public
    view
    override(ERC20Permit, Nonces)
    returns (uint256)
{
    return super.nonces(owner);
}


//======
function _update(address from, address to, uint256 value)
    internal
    override(ERC20, ERC20Pausable, ERC20Votes)
{
    super._update(from, to, value);
}

/*
_update: 
- internal function named (_update)
- used to override a function from the ERC-20 standard and other related extensions
internal: 
- internal function which means it can be accessed only within the contract or derived contracts
- not called by external actors 
override(ERC20, ERC20Pausable, ERC20Votes): 
- indicates _update function overrides functions inherited from multiple contracts (ERC20, ERC20Pausable, and ERC20Votes)
super._update(from, to, value);: 
- calls the overridden _update function from the base contracts (ERC20, ERC20Pausable, and ERC20Votes) 
- update token balances when transfers occur.
- overriding it, you can customize the behavior of updating balances in your specific token contract
*/

========
function nonces(address owner)
    public
    view
    override(ERC20Permit, Nonces)
    returns (uint256)
{
    return super.nonces(owner);
}

/*
nonces: 
- public function named "nonces.
- used to retrieve the nonce for a specific address in the context of ERC-20 permit functionality
public: 
- makes function accessible from outside the contract      
view: 
- indicates that this function is read-only and doesn't modify the state of the blockchain
override(ERC20Permit, Nonces): 
- specifies that the nonces function is overriding a function inherited from two contracts: ERC20Permit and Nonces 
returns (uint256): 
- returns a uint256 value, which is the nonce for the given address
return super.nonces(owner);: 
- calls the overridden nonces function from the base contracts (ERC20Permit and Nonces) 
- The purpose is to retrieve the nonce for the specified address, which is a critical part of the ERC-20 permit functionality
*/
