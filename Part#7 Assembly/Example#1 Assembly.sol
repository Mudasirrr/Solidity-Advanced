/**
Solidity provides an option to use assembly language to write inline assembly within Solidity source code. We can also write a standalone assembly code which then be converted to bytecode. Standalone Assembly is an intermediate language for a Solidity compiler and it converts the Solidity code into a Standalone Assembly and then to byte code. We can used the same language used in Inline Assembly to write code in a Standalone assembly.

Inline Assembly
Inline assembly code can be interleaved within Solidity code base to have more fine-grain control over EVM and is used especially while writing the library functions.

An assembly code is written under assembly { ... } block. */


// Try the following code to understand how a Library works in Solidity.

pragma solidity ^0.5.0;

library Sum {   
   function sumUsingInlineAssembly(uint[] memory _data) public pure returns (uint o_sum) {
      for (uint i = 0; i < _data.length; ++i) {
         assembly {
            o_sum := add(o_sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
         }
      }
   }
}
contract Test {
   uint[] data;
   
   constructor() public {
      data.push(1);
      data.push(2);
      data.push(3);
      data.push(4);
      data.push(5);
   }
   function sum() external view returns(uint){      
      return Sum.sumUsingInlineAssembly(data);
   }
}
// Run the above program using steps provided in Solidity First Application chapter.

// Note − Select Test from dropdown before clicking the deploy button.

// Output
// 0: uint256: 15