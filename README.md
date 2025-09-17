# Project Merit Token Contracts
This repository contains the smart contract code for the [**Stella**](./src/Stella.sol) and [**Tonitrus**](./src/Tonitrus.sol) tokens used in [project-merit.](https://github.com/tenze21/project-merit.git) The contract was developed with **foundry** so you might need foundry to play around with the code.

**Foundry is a rust based EVM smart contract develpment enviroment with blazing fast compilation / build times and amazing features to battle test your contracts. Learn more about foundry [here.](https://getfoundry.sh/)**

## Project Setup.
1. Clone the repository.
    ```bash
    git clone https://github.com/tenze21/project-merit-contract.git
    ```

2. Install dependencies.
    ```bash
    make install
    # executes: forge install OpenZeppelin/openzeppelin-contracts
    ```

3. compile the contracts
    ```bash
    make build
    # executes: forge build
    ```

4. Run tests
    ```bash
    make test
    # executes: forge test
    ```

5. Deploying on a local anvil node
    ```bash
    # run a local anvil node
    anvil
    ```
    ```bash
    # deploy the contracts on the anvil node
    make deploy-anvil
    # executes: forge script script/DeployTokens.s.sol:DeployTokens --rpc-url http://localhost:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
    ```

6. Deploying on the Sepolia testnet.
    - Create a `.env` file to store your enviroment variables
        ```
        <!-- Sample .env -->
        SEPOLIA_RPC_URL=YOUR_SEPOLIA_RPC_URL
        ETHERSCAN_API_KEY=YOU_ETHERSCAN_API_KEY
        ```
    - Make your enviroment variables available in the terminal
        ```bash
        source .env
        ```

    - Check out the [securing your private key with foundry section.](#securing-your-private-keys-with-foundry)
    - Deploy the contract on sepolia.
        ```bash
        make deploy-sepolia
        # executes: forge script script/DeployTokens.s.sol:DeployTokens --rpc-url $(SEPOLIA_RPC_URL) --account myWallet --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
        ```
        *Note: replace **myWallet** with your own wallet alias in the [makefile.](./Makefile)*

        OR you can you the command below but it's not recommended since you need to enter your private key in plain text.
        ```bash
        forge create --rpc-url $(SEPOLIA_RPC_URL) --private-key <private_key> src/contractFile.sol:contractName --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
        ```

## Securing your private keys with foundry
When deploying contracts or interacting with deployed contracts in foundry cast allows you to securely store your private keys. It uses a passphrase that you provide to encrypt your private key and stores the encrypted key in `~/.foundry/keystores/` directory, so Whenever you need to use your private key you need to enter the correct passphrase to decrypt the private key and use it.

1. Import you private key.
    ```bash
    cast wallet import <WALLET_ALIAS> --interactive
    # the --interactive flag prompts you to enter your private key but is not shown like the way you enter your root password on linux.
    ```
2. List your wallets.
    ```bash
    cast wallet list
    ```

## Interacting with your deployed contract
Use the commands below to interact with the contract after deploying it on your local anvil.
*Note: replace the contract addresses if they are different but in most cases deploying on the local anvil node should result in the same addresses.

```bash
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "totalSupply()(uint256)"
```

```bash
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "mint(uint256)()" 100000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

```bash
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "burn(uint256)()" 100000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
```

```bash
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8
```

```bash
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8
```

```bash
 cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "transfer(address,uint256)(bool)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 10000000000000000000 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 ```

```bash
 cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "totalSupply()(uint256)"
 ```

## contract addresses on the sepolia testnet.
 **Stella:** 0x6dab3Ec89fb145FB05ad47992acB4a799875e5eB

 **tonitrus:** 0x2893dbDAaC60714cc85947C18395f64BC4520c69