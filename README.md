cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "totalSupply()(uint256)"

cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "mint(uint256)()" 100000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "burn(uint256)()" 100000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d

cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8

cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8

 cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "transfer(address,uint256)(bool)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 10000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

 cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "totalSupply()(uint256)"
 -----------------------------------------------------------

 Stella: 0x6dab3Ec89fb145FB05ad47992acB4a799875e5eB

 tonitrus: 0x2893dbDAaC60714cc85947C18395f64BC4520c69