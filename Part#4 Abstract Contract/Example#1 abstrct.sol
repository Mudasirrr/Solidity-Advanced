/**Abstract Contract is one which contains at least one function without any implementation. Such a contract is used as a base contract. Generally an abstract contract contains both implemented as well as abstract functions. Derived contract will implement the abstract function and use the existing functions as and when required.

In case, a derived contract is not implementing the abstract function then this derived contract will be marked as abstract.. */

// Try the following code to understand how the abstract contracts works in Solidity.

pragma solidity ^0.5.0;

contract Calculator {
   function getResult() public view returns(uint);
}
contract Test is Calculator {
   function getResult() public view returns(uint) {
      uint a = 1;
      uint b = 2;
      uint result = a + b;
      return result;
   }
}
// Run the above program using steps provided in Solidity First Application chapter.

// Output
// 0: uint256: 3