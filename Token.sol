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

    function transferTokens(address _recipient, uint256 _value) external payable{
        require(_recipient != address(0), "Invalid recipient address");
        require(_value > 0, "Invalid transfer amount");

        require(token.transfer(_recipient, _value));

        // Emit an event indicating the transfer
        emit TokensTransferred(msg.sender, _recipient, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) external {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(_value > 0, "Invalid transfer amount");

      require(token.transferFrom(_from, _to, _value));

        // Emit an event indicating the transfer
        emit TokensTransferred(_from, _to, _value);
    }

    // Event emitted when tokens are transferred
    event TokensTransferred(address indexed _from, address indexed _to, uint256 _value);

}
