// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface ISubscription {
    event AddTier(uint256 indexed tierId, bytes32 name, uint256 price);

    event Mint(
        uint256 indexed tokenId,
        uint256 indexed tierId,
        uint256 fee,
        uint256 duration,
        address owner
    );

    event Extend(
        uint256 indexed tokenId,
        uint256 fee,
        uint256 oldExpiredTime,
        uint256 newExpiredTime
    );

    event EthWithdraw(address receiver, uint256 amount);

    event ChangeTierPrice(uint256 tierId, uint256 oldPrice, uint256 newPrice);

    struct Tier {
        bytes32 name;
        uint256 price;
        uint256 quantity;
    }

    struct SubscriptionPlan {
        uint256 startedTime;
        uint256 expiredTime;
        uint256 tierId;
        address owner;
    }

    error InvalidSubscriptionPlan();

    error InvalidTier();

    error InvalidDuration();

    error InsufficientFunds();

    error SubscriptionExpired();

    error AddressZero();

    error ZeroPrice();

    error EthWithdrawalFailed();
}