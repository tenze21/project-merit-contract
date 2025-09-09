// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
"Stella is a latin word for star" and as to humans stars symbolise glory, achievement or beauty.
Hence, the Stella token is meant to be a token that is awarded to students/candidates for their good
deeds. 
*/
contract Stella is ERC20, Ownable {
    address private immutable i_owner;/*deployer address*/

    /*
        @dev the initial supply of the token needs to be passed on deployment.
    */
    constructor(uint256 initialSupply) ERC20("Stella", "S") Ownable(msg.sender){
        i_owner=msg.sender;
        _mint(msg.sender, initialSupply * 10**decimals());
    }
    
    /*
        @dev Adds the specified amount of tokens to the total supply.
        @param amount   the amount of Stella tokens to mint.
        @notice only the conract owner/deployer can call this function.
    */
    function mint(uint256 amount) external onlyOwner{
        _mint(msg.sender, amount);
    }

    /*
        @dev removes the specified amount of tokens from the total supply.
        @param amount   the amount of Stella tokens to be burnt.
        @notice only the conract owner/deployer can call this function.
    */
    function burn(uint256 _value) external onlyOwner{
        _burn(msg.sender, _value);
    }

    /*
        @dev returns the contract owners address.
    */
    function getOwner() external view returns(address){
        return i_owner;
    }
}
