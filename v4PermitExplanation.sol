/* STILL NEEDS TO BE 
Permit 

ERC20Permit.sol 

- this function simplifies the process of approving token transfers by allowing users to sign a message 
to grant permission for another address to spend tokens on their behalf 

Functions:

**permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) (function):
- allows an address to sign a message granting another address (spender) permission to spend tokens on its behalf. 
- simplifies the token approval process by providing a more user-friendly and gas-efficient alternative to calling approve directly
- owner (address): The address that grants permission.
- spender (address): The address that is allowed to spend tokens on behalf of the owner.
- value (uint256): The maximum number of tokens that the spender is allowed to spend.
- deadline (uint256): A timestamp representing the expiration time for the permission. If the deadline is reached, the signature is no longer valid.
v (uint8): The recovery id used for ECDSA signature verification.
r (bytes32): The "r" component of the ECDSA signature.
s (bytes32): The "s" component of the ECDSA signature.
This permit function simplifies the process of approving token transfers by allowing users to sign a message and share the message parameters for approval. This can be especially useful for integration with wallet apps and dApps.

**nonces(address owner) view returns (uint256) (function):
- allows querying the nonce for a specific owner. 
- The nonce is used to ensure that a permit request is unique and can't be replayed. Each time a permit is issued, the nonce for that owner is incremented.
Parameters:
owner (address): The address for which the nonce is being queried.
Return Value: The function returns the current nonce for the specified owner.
Variables:

_permitNonces (mapping (address => uint256)):
Description: This mapping stores nonces for each owner address. Nonces are used to prevent replay attacks when signing permit messages.
Usage: It's used to keep track of nonces for individual owners to ensure the uniqueness of permit requests.
ERC20Permit.sol streamlines the process of allowing token transfers by introducing the permit function, which reduces the complexity of token approval. The addition of nonces ensures that each permit request is unique and secure. This standard is particularly useful for users and developers when integrating tokens into applications and wallets, as it simplifies the approval process and reduces the need for gas-consuming approval transactions.