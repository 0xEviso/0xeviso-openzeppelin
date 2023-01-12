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
    string private _name;
    string private _symbol;

    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    // owner => (spenders => amount)
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        // This is for display purposes only
        return 18;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        address from = _msgSender();
        _transfer(from, to, amount);
        return true;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(
            _balances[from] >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
    }

    function allowance(address owner, address spender)
        external
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;

        emit Approval(owner, spender, amount);
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(to != address(0), "ERC20: transfer to the zero address");
                require(
            _balances[from] >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        require(
            _allowances[from][to] >= amount,
            "ERC20: insufficient allowance"
        );

        _transfer(from, to, amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        address owner = _msgSender();
        uint256 _allowance = _allowances[owner][spender] + addedValue;
        _approve(owner, spender, _allowance);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        address owner = _msgSender();

        require(
            _allowances[owner][spender] >= subtractedValue,
            "ERC20: decreased allowance below zero"
        );

        uint256 _allowance = _allowances[owner][spender] - subtractedValue;
        _approve(owner, spender, _allowance);
        return true;
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply += amount;
        _balances[account] += amount;

        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");
        require(
            _balances[account] >= amount,
            "ERC20: burn amount exceeds balance"
        );
        _totalSupply -= amount;
        _balances[account] -= amount;

        emit Transfer(account, address(0), amount);
    }
}
