pragma solidity ^0.5.0;

contract Adoption {
  address[16] public adopters;
  // this is an array of ETH addresses
  // the address length in this case is 16

  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);

    adopters[petId] = msg.sender;
    // here, we add the address to our array 
    
    return petId;
  }

  function getAdopters() public view returns (address[16] memory) {
    // we have to specify the return type even though the array had already been declared
    // the view keyword ensures that the operation does not modify the state of the contract
    return adopters;

    // after compileing the SC we need to migrate, by adding a file to the migrations directory
  }

}