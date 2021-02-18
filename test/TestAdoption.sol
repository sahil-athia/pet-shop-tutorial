pragma solidity ^0.5.0;

// assert.sol give us various assertations to use in our test
import "truffle/Assert.sol";

// this will depoly a fresh instance of the contract to the blockchain
import "truffle/DeployedAddresses.sol";

// this is the smart contract that we want to test
import "../contracts/Adoption.sol";

contract TestAdoption {

  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption()); 
  
  // The id of the pet that will be used for testing
  uint expectedPetId = 8; 
  
  //The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

  // Testing the adopt() function
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);
    // our SC adopt function should re returning the correct petId

    Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }

  // public variables have automatic getter methods 
  // we can retrieve the address stored by our adoption test above
  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    // adopters is the public variable in the SC
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
  }
}