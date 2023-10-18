/* v6FlashMintExplanation
FlashMint

- adds support for flash minting. 
- allows users to temporarily borrow and use an unlimited number of tokens, as long as borrowed tokens are returned to contract within same transaction
- introduces a novel feature in form of flash minting, which allows users to temporarily borrow tokens within a transaction 
- can be useful for liquidity provisioning and arbitrage opportunities
- key is that users must return an equivalent amount of tokens within the same transaction to prevent abuse 
- extension maintains state through _flashMinted mapping and _flashMinting variable, ensuring integrity of flash minting process

----------
Functions:

**flashMint(uint256 value) (function):
- allows a user to initiate a flash mint by specifying the amount of tokens they want to borrow (value) 
- tokens are not actually transferred from the contract to the user's balance
- they are temporarily made available for use within the same transaction
- value (uint256): amount of tokens user wants to borrow

**_mint(address account, uint256 amount) (internal function):
- internal override of _mint function from base ERC-20 token
- called to mint tokens, including borrowed tokens, and increase balance of an account
- account (address): address to which tokens are minted
- amount (uint256): number of tokens minted

----------
Variables:

_flashMinted (mapping (address => uint256)):
- keeps track of the total amount of tokens borrowed within a flash minting transaction by each address
- mapping is used to ensure that the user returns an equivalent amount of tokens during the same transaction

_flashMinting (bool):
- indicates whether a flash minting transaction is in progress
- flash mint is initiated, _flashMinting is set to true, it is reset to false when the transaction completes
- ensure that flash mints are only allowed within the context of a single transaction