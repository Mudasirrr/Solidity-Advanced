// Event is an inheritable member of a contract. An event is emitted, it stores the arguments passed in transaction logs. These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain. An event generated is not accessible from within contracts, not even the one which have created and emitted them.

// An event can be declared using event keyword.

//Declare an Event
// event Deposit(address indexed _from, bytes32 indexed _id, uint _value);

//Emit an event
   // emit Deposit(msg.sender, _id, msg.value);
   // Example
   // Try the following code to understand how an event works in Solidity.

   // First Create a contract and emit an event.

pragma solidity ^0.5.0;

contract Test {
   event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
   function deposit(bytes32 _id) public payable {      
      emit Deposit(msg.sender, _id, msg.value);
   }
}
// Then access the contract's event in JavaScript code.

var abi = /* abi as generated using compiler */;
var ClientReceipt = web3.eth.contract(abi);
var clientReceiptContract = ClientReceipt.at("0x1234...ab67" /* address */);

var event = clientReceiptContract.Deposit(function(error, result) {
   if (!error)console.log(result);
});
// It should print details similar to as following −

// Output
// {
//    "returnValues": {
//       "_from": "0x1111...FFFFCCCC",
//       "_id": "0x50...sd5adb20",
//       "_value": "0x420042"
//    },
//    "raw": {
//       "data": "0x7f...91385",
//       "topics": ["0xfd4...b4ead7", "0x7f...1a91385"]
//    }
// }