var ConvertLib = artifacts.require("./ConvertLib.sol");
var Coin = artifacts.require("./Coin.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, Coin);
  deployer.deploy(Coin);
};
