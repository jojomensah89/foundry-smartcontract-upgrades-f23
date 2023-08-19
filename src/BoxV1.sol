// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    // Constructors defeat the whole purpose of upgradeable contracts as we want the storage to be on the proxy contract and functions to be on the implementation contract, but constructor sets the storage on the implementation contract. Hence the use of special funcion initialize to replace constructor
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        // function stops any initializion in constructor
        _disableInitializers();
    }

    function initialize() public initializer {
        // double underscores(__) standard for initializer functions
        __Ownable_init(); // sets owner to msg.msg.sender

        __UUPSUpgradeable_init(); // Indicates the function is a UUPS upgradeable contract
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override  {}
}
