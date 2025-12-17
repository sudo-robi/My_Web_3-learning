// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./myERC20.sol";

contract ERC4626Vault {
    myERC20 public immutable asset; // The underlying token
    string public name = "My Vault Token";
    string public symbol = "vMYT";

    uint256 public totalAssets;
    uint256 public totalShares;

    mapping(address => uint256) public shares;
    mapping(address => uint256) public depositedAssets;

    event Deposit(address indexed caller, address indexed owner, uint256 assets, uint256 shares);
    event Withdraw(address indexed caller, address indexed receiver, uint256 assets, uint256 shares);

    constructor(myERC20 _asset) {
        asset = _asset;
    }

    // Convert assets to shares
    function convertToShares(uint256 assets) public view returns (uint256) {
        if (totalAssets == 0 || totalShares == 0) {
            return assets; // 1:1 initial ratio
        }
        return (assets * totalShares) / totalAssets;
    }

    // Convert shares to assets
    function convertToAssets(uint256 _shares) public view returns (uint256) {
        if (totalShares == 0 || totalAssets == 0) {
            return _shares; // 1:1 initial ratio
        }
        return (_shares * totalAssets) / totalShares;
    }

    // Deposit assets into the vault
    function deposit(uint256 assets) external returns (uint256) {
        require(assets > 0, "Cannot deposit 0");

        uint256 _shares = convertToShares(assets);

        totalAssets += assets;
        totalShares += _shares;
        shares[msg.sender] += _shares;
        depositedAssets[msg.sender] += assets;

        require(asset.transferFrom(msg.sender, address(this), assets), "Transfer failed");

        emit Deposit(msg.sender, msg.sender, assets, _shares);
        return _shares;
    }

    // Withdraw assets from the vault
    function withdraw(uint256 assets) external returns (uint256) {
        require(assets > 0, "Cannot withdraw 0");

        uint256 _shares = convertToShares(assets);
        require(shares[msg.sender] >= _shares, "Not enough shares");

        shares[msg.sender] -= _shares;
        totalShares -= _shares;
        totalAssets -= assets;
        depositedAssets[msg.sender] -= assets;

        require(asset.transfer(msg.sender, assets), "Transfer failed");

        emit Withdraw(msg.sender, msg.sender, assets, _shares);
        return _shares;
    }

    // View user's vault balance in assets
    function balanceOf(address user) external view returns (uint256) {
        return convertToAssets(shares[user]);
    }
}
