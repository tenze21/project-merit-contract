// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Stella} from "src/Stella.sol";
import {Tonitrus} from "src/Tonitrus.sol";

contract DeployTokens is Script{
    function run() public {
        deployTokens();
    }
    function deployTokens() public returns (Stella, Tonitrus){
        vm.startBroadcast();
        Stella stella= new Stella(1000);
        Tonitrus tonitrus= new Tonitrus(1000);
        vm.stopBroadcast();
        return (stella, tonitrus);  
    }
}