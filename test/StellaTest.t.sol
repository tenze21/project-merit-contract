// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Stella} from "src/Stella.sol";
import {DeployTokens} from "script/DeployTokens.s.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract StellaTest is Test{
    Stella public stella;
    address USER= makeAddr("user");/*create a fake ethereum address*/

    function setUp()external{
        DeployTokens deployer= new DeployTokens();
        (stella, )= deployer.deployTokens();
    }

    // check if the token deployer address is the one calling the test functions
    function testOwnerIsMsgSender() public view{
        assertEq(stella.getOwner(), msg.sender);
    }

    // check owner balance equals the initial token supply after deployment
    function testOwnerBalanceOnTokenDeployment() public view{
        address owner= stella.getOwner();
        assertEq(stella.balanceOf(owner), stella.totalSupply());
    }

    // check if only owner is allowed to mint new tokens
    function testOnlyOwnerCanMintToken() public{
        vm.prank(USER);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, USER));
        stella.mint(100 * 10**18);
    }

    // check if only owner can burn tokens
    function testOnlyOwnerCanBurnToken() public{
        vm.prank(USER);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, USER));
        stella.burn(10 * 10**18);
    }

    // check if {@code mint} mints new tokens
    function testMintCreatesTokens() public {
        uint256 initialTotalSupply= stella.totalSupply();
        vm.prank(stella.getOwner());
        stella.mint(10 * 10**18);
        assertEq(stella.totalSupply(), initialTotalSupply + 10 * 10**18);
    }

    // Check if {@code burn} destroys tokens
    function testBurnDestroysTokens() public{
        uint256 initialTotalSupply= stella.totalSupply();
        uint256 burnAmount= 10 * 10**18;
        vm.prank(stella.getOwner());
        stella.burn(burnAmount);
        assertEq(stella.totalSupply(), initialTotalSupply-burnAmount);
    }
}