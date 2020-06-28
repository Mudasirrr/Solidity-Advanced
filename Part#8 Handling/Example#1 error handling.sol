
// Solidity provides various functions for error handling. Generally when an error occurs, the state is reverted back to its original state. Other checks are to prevent unauthorized code access. Following are some of the important methods used in error handling −

// assert(bool condition) − In case condition is not met, this method call causes an invalid opcode and any changes done to state got reverted. This method is to be used for internal errors.

// require(bool condition) − In case condition is not met, this method call reverts to original state. - This method is to be used for errors in inputs or external components.

// require(bool condition, string memory message) − In case condition is not met, this method call reverts to original state. - This method is to be used for errors in inputs or external components. It provides an option to provide a custom message.

// revert() − This method aborts the execution and revert any changes done to the state.

// revert(string memory reason) − This method aborts the execution and revert any changes done to the state. It provides an option to provide a custom message.

// Example
// Try the following code to understand how error handling works in Solidity.

pragma solidity ^0.5.0;

contract Vendor {
   address public seller;
   modifier onlySeller() {
      require(
         msg.sender == seller,
         "Only seller can call this."
      );
      _;
   }
   function sell(uint amount) public payable onlySeller { 
      if (amount > msg.value / 2 ether)
         revert("Not enough Ether provided.");
      // Perform the sell operation.
   }
}
// When revert is called, it will return the hexadecimal data as followed.

// Output
// 0x08c379a0                     // Function selector for Error(string)
// 0x0000000000000000000000000000000000000000000000000000000000000020 // Data offset
// 0x000000000000000000000000000000000000000000000000000000000000001a // String length
// 0x4e6f7420656e6f7567682045746865722070726f76696465642e000000000000 // String data