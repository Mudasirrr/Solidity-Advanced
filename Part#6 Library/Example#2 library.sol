
// The directive using A for B; can be used to attach library functions of library A to a given type B. These functions will used the caller type as their first parameter (identified using self).

// Example
// Try the following code to understand how a Library works in Solidity.

pragma solidity ^0.5.0;

library Search {
   function indexOf(uint[] storage self, uint value) public view returns (uint) {
      for (uint i = 0; i < self.length; i++)if (self[i] == value) return i;
      return uint(-1);
   }
}
contract Test {
   using Search for uint[];
   uint[] data;
   constructor() public {
      data.push(1);
      data.push(2);
      data.push(3);
      data.push(4);
      data.push(5);
   }
   function isValuePresent() external view returns(uint){
      uint value = 4;      
      
      //Now data is representing the Library
      uint index = data.indexOf(value);
      return index;
   }
}
// Run the above program using steps provided in Solidity First Application chapter.

// Note − Select Test from dropdown before clicking the deploy button.

// Output
// 0: uint256: 3