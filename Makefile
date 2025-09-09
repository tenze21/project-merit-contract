-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

clean :; rm -rf out/ cache/

install :
	forge install OpenZeppelin/openzeppelin-contracts

deploy-sepolia :
	@forge script script/DeployTokens.s.sol:DeployTokens --rpc-url $(SEPOLIA_RPC_URL) --account myWallet --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

deploy-anvil :
	@forge script script/DeployTokens.s.sol:DeployTokens --rpc-url http://localhost:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80