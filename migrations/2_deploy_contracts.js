const Adoption = artifacts.require("Adoption")
// before we migrate we need to have a blockchain running
module.exports = function(deployer) {
  deployer.deploy(Adoption);
};