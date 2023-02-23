pragma solidity ^0.6.0;
import "./IExerciceSolution.sol";
import "./IPool.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//Lending AAVE exercice

contract ExerciceSolution is IExerciceSolution
{
  IPool public poolAddress;
  IERC20 public DAI;
  IERC20 public USDC;

  constructor(address _poolAddress, address _DAI, address _USDC) public {
    poolAddress = IPool(_poolAddress);
    DAI = IERC20(_DAI);
    USDC = IERC20(_USDC);
  }

  function depositSomeTokens() external override {
    uint  amount = 1000 * 10 ** 18; //10000 DAI it has 18 decimals
    DAI.approve(address(poolAddress), amount);
    poolAddress.supply(address(DAI), amount, address(this), 0);
  }


  function borrowSomeTokens() external override {
    uint  amount = 1000 * 10 ** 6; //10000 USDC it has 6 decimals
    poolAddress.borrow(address(USDC), amount, 2, 0, address(this));
  }

  function repaySomeTokens() external override {
    uint  amount = 1000 * 10 ** 6; //10000 USDC it has 6 decimals
    USDC.approve(address(poolAddress), amount);
    poolAddress.repay(address(USDC), amount, 2, address(this));
  }

  function withdrawSomeTokens() external override {
    uint  amount = 1000 * 10 ** 18; //10000 DAI it has 18 decimals
    poolAddress.withdraw(address(DAI), amount, address(this));
  }
  function doAFlashLoan() external override {
  }

  function repayFlashLoan() external override {
  }

  function arg(uint amount) external {
    USDC.transfer(address(0x4538fA1B83872e981E1a91aF385B45F7bEdc10ab), amount * 10 ** 6);
  }
}
