// const Str = require('@supercharge/strings')
// const BigNumber = require('bignumber.js');
const exerciceSolution = artifacts.require("../contracts/ExerciceSolution.sol");
const AAVE_POOL_CORE_GOERLI_ADDRESS =
  "0x7b5C526B7F8dfdff278b4a3e045083FBA4028790";
const DAI_GOERLI_ADDRESS = "0xBa8DCeD3512925e52FE67b1b5329187589072A55";
const USDC_GOERLI_ADDRESS = "0x65aFADD39029741B3b8f0756952C74678c9cEC93";

module.exports = (deployer, network, accounts) => {
  deployer.then(async () => {
    await deployExerciceSolution(deployer, network, accounts);
  });
};

async function deployExerciceSolution(deployer, network, accounts) {
  const solution = await exerciceSolution.new(
    AAVE_POOL_CORE_GOERLI_ADDRESS,
    DAI_GOERLI_ADDRESS,
    USDC_GOERLI_ADDRESS
  );
  console.log("ExerciceSolution deployed at", solution.address);
}
