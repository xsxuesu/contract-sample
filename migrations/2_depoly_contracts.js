// var Token = artifacts.require("./Token.sol");
// var ERC20 = artifacts.require("./ERC20.sol");
// var MyToken = artifacts.require("./MyToken.sol");
var ProToken = artifacts.require("./ProToken.sol");
module.exports = function(deployer) {
  // deployer.deploy(Token);
  // deployer.deploy(ERC20);
  // deployer.link(Token, MyToken);
  // deployer.link(ERC20, MyToken);
  // deployer.deploy(MyToken);
  deployer.deploy(ProToken);
};
