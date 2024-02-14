// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TRC20.sol";

contract MyContract {
    TRC20 public token;
    address public owner;

    constructor(TRC20 _tokenAddress, address _owner) {
        token = _tokenAddress;
        owner=_owner;
    }

    function transferTokens(address _recipient, uint256 _value) external {
        require(_recipient != address(0), "Invalid recipient address");
        require(_value > 0, "Invalid transfer amount");

        // Call the transfer function of the TRC20 token contract
        require(token.transfer(_recipient, _value), "Transfer failed");

        // Emit an event indicating the transfer
        emit TokensTransferred(msg.sender, _recipient, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) external {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(_value > 0, "Invalid transfer amount");

        // Call the transferFrom function of the TRC20 token contract
        require(token.transferFrom(_from, _to, _value), "Transfer from failed");

        // Emit an event indicating the transfer
        emit TokensTransferred(_from, _to, _value);
    }

    // Event emitted when tokens are transferred
    event TokensTransferred(address indexed _from, address indexed _to, uint256 _value);

    
    function totalSupply() external view returns (uint256) {
        return token.totalSupply();
    }

     function balanceOf() external view returns (uint256) {
        return token.balanceOf(owner);
    }

     function allowance(address _owner, address _spender) external view returns (uint256) {
        return token.allowance(_owner, _spender);
    }

      function approve(address _spender, uint256 _value) external returns (bool) {
        require(_spender != address(0), "Invalid spender address");

        // Call the approve function of the TRC20 token contract
        require(token.approve(_spender, _value), "Approval failed");

        // Emit an event indicating the approval
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Event emitted when approval is granted
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
