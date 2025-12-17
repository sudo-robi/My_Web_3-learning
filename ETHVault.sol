// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ETHVault {
    string public name = "ETH Vault Token";
    string public symbol = "vETH";

    uint256 public totalAssets; // Total ETH held
    uint256 public totalShares; // Total vault shares issued

    mapping(address => uint256) public shares; // User share balances

    event Deposit(address indexed caller, address indexed owner, uint256 assets, uint256 shares);
    event Withdraw(address indexed caller, address indexed receiver, uint256 assets, uint256 shares);

    // Convert ETH amount to vault shares
    function convertToShares(uint256 assets) public view returns (uint256) {
        if (totalAssets == 0 || totalShares == 0) {
            return assets; // 1:1 initial ratio
        }
        return (assets * totalShares) / totalAssets;
    }

    // Convert vault shares to ETH amount
    function convertToAssets(uint256 _shares) public view returns (uint256) {
        if (totalShares == 0 || totalAssets == 0) {
            return _shares; // 1:1 initial ratio
        }
        return (_shares * totalAssets) / totalShares;
    }

    // Deposit ETH into the vault
    function deposit() external payable returns (uint256) {
        require(msg.value > 0, "Cannot deposit 0 ETH");

        uint256 _shares = convertToShares(msg.value);

        totalAssets += msg.value;
        totalShares += _shares;
        shares[msg.sender] += _shares;

        emit Deposit(msg.sender, msg.sender, msg.value, _shares);
        return _shares;
    }

    // Withdraw ETH from the vault
    function withdraw(uint256 _shares) external returns (uint256) {
        require(_shares > 0, "Cannot withdraw 0 shares");
        require(shares[msg.sender] >= _shares, "Not enough shares");

        uint256 amount = convertToAssets(_shares);
    shares[msg.sender] -= _shares;
        totalShares -= _shares;
        totalAssets -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "ETH transfer failed");
        emit Withdraw(msg.sender, msg.sender, amount, _shares);
        return amount;
    }

    // View user balance in ETH
    function balanceOf(address user) external view returns (uint256) {
        return convertToAssets(shares[user]);
    }

    // Fallback to accept ETH sent directly
    receive() external payable {
        deposit();
    }
}
