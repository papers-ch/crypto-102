pragma solidity ^0.4.24;

import "./erc20.sol";
import "./SafeMath.sol";

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of a very Basic, non ERC20-compliant Token 
 * (due to missing transferFrom / allowance) for demo purposes and teaching the basics of Solidity.
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 * Based on OpenZeppelin Implementation
 * https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC20/StandardToken.sol 
 */
contract PapersTestToken is ERC20 {
  using SafeMath for uint256;
  
  mapping (address => uint256) private balances;

  uint256 private totalSupply_;

  string public name;
  string public symbol;
  uint8 public decimals;
  
  address public owner;

  constructor(string _name, string _symbol, uint8 _decimals) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    owner = msg.sender;
  }
  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function _mint(address _account, uint256 _amount) public onlyOwner() {
    require(_account != 0);
    totalSupply_ = totalSupply_.add(_amount);
    balances[_account] = balances[_account].add(_amount);
    emit Transfer(address(0), _account, _amount);
  }

}