const Adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
 let adoption;
 let expectedPetId;

 before(async () => {
     adoption = await Adoption.deployed();
 });

 describe("adopting a pet and retrieving account addresses", async () => {
    before("adopt a pet using accounts[0]", async () => {
      await adoption.adopt(8, { from: accounts[0] });
      expectedAdopter = accounts[0];
    });

    it("can fetch the address of the owner by petId", async () => {
      const adopter = await adoption.adopters(8);

      // trufle imports chai so we can use assertations
      assert.equal(adopter, expectedAdopter, "The owner of the adopted pet should be the first account.")
    })
 });
});