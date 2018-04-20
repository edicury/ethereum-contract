pragma solidity ^0.4.4;

import "./ConvertLib.sol";

contract Coin {
    mapping (address => uint) balances;

    event transfer(address indexed _from, address indexed _to, uint256 _value);

    function Coin() public {
        balances[msg.sender] = 1000;
    }

    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) public view returns(uint){
        return ConvertLib.convert(getBalance(addr),2);
    }

    function getBalance(address addr) public view returns(uint) {
        return uint(balances[addr]);
    }

}