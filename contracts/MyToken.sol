pragma solidity ^0.4.23;

import "./ERC20.sol";
import "./Token.sol";

contract MyToken is Token,ERC20{

    constructor() public{
        _balanceOf[msg.sender] = _totalSupply;
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address _addr) public view returns (uint) {
        return _balanceOf[_addr];
    }

    function transfer(address _to, uint _value) public returns (bool) {
        if(_value > 0 && _value <= _balanceOf[msg.sender] ){
            _balanceOf[msg.sender] = _balanceOf[msg.sender] - _value;
            _balanceOf[_to] = _balanceOf[_to] + _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        }else{
            return false;
        }
    }

    function transferFrom(address _from, address _to, uint _value) public returns (bool) {
        if (_allowances[_from][msg.sender] > 0 &&
            _value > 0 &&
            _allowances[_from][msg.sender] >= _value &&
            _balanceOf[_from] >= _value) {
            _balanceOf[_from] = _balanceOf[_from] - _value ;
            _balanceOf[_to] = _balanceOf[_to] + _value ;
            _allowances[_from][msg.sender] =  _allowances[_from][msg.sender] - _value ;
            emit Transfer(_from, _to, _value);
            return true;
        }
        return false;
    }

    function approve(address _spender, uint _value) public returns (bool) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint) {
        return _allowances[_owner][_spender];
    }
}