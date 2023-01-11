// SPDX-License-Identifier: MIT
// 0xEviso eviso@protonmail.com

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./IERC20Metadata.sol";
import "./Context.sol";

/**
 * @dev Implementation of the {IERC20} interface.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    constructor(string memory name_, string memory symbol_) {}

    function name() external view returns (string memory) {}

    function symbol() external view returns (string memory) {}

    function decimals() public view virtual override returns (uint8) {}

    function totalSupply() external view returns (uint256) {}

    function balanceOf(address account) external view returns (uint256) {}

    function transfer(address to, uint256 amount) external returns (bool) {}

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    function allowance(address owner, address spender)
        external
        view
        returns (uint256)
    {}

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {}

    function approve(address spender, uint256 amount) external returns (bool) {}

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {}

    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {}

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {}

    function _mint(address account, uint256 amount) internal virtual {}

    function _burn(address account, uint256 amount) internal virtual {}
}
