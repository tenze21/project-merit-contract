// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Tonitrus} from "src/Tonitrus.sol";
import {DeployTokens} from "script/DeployTokens.s.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TonitrusTest is Test{
    Tonitrus public tonitrus;
    address USER= makeAddr("user");

    function setUp()external{
        DeployTokens deployer= new DeployTokens();
        (, tonitrus)= deployer.deployTokens();
    }

    // check if the token deployer address is the one calling the test functions
    function testOwnerIsMsgSender() public view{
        assertEq(tonitrus.getOwner(), msg.sender);
    }

    // check owner balance equals the initial token supply after deployment
    function testOwnerBalanceOnTokenDeployment() public view{
        address owner= tonitrus.getOwner();
        assertEq(tonitrus.balanceOf(owner), tonitrus.totalSupply());
    }

    // check if only owner is allowed to mint new tokens
    function testOnlyOwnerCanMintToken() public{
        vm.prank(USER);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, USER));
        tonitrus.mint(100 * 10**18);
    }

    // check if only owner can burn tokens
    function testOnlyOwnerCanBurnToken() public{
        vm.prank(USER);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, USER));
        tonitrus.burn(10 * 10**18);
    }

    // check if {@code mint} mints new tokens
    function testMintCreatesTokens() public {
        uint256 initialTotalSupply= tonitrus.totalSupply();
        vm.prank(tonitrus.getOwner());
        tonitrus.mint(10 * 10**18);
        assertEq(tonitrus.totalSupply(), initialTotalSupply + 10 * 10**18);
    }

    // Check if {@code burn} destroys tokens
    function testBurnDestroysTokens() public{
        uint256 initialTotalSupply= tonitrus.totalSupply();
        uint256 burnAmount= 10 * 10**18;
        vm.prank(tonitrus.getOwner());
        tonitrus.burn(burnAmount);
        assertEq(tonitrus.totalSupply(), initialTotalSupply-burnAmount);
    }
}