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
}