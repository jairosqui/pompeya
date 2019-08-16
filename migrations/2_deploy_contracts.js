var HelloWorld = artifacts.require("pompeya");
module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
};