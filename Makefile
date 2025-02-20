NETWORK ?= local # defaults to local node
include .env.$(NETWORK)

# Deps
update:; forge update

# Build & test
clean    :; forge clean
snapshot :; forge snapshot --gas-report
coverage :; forge coverage --report=summary
build: clean
	forge build
test:
	forge test --gas-report
trace: clean
	forge test -vvvvv --gas-report

# Deployments
## The Space:Core
deploy-the-space-currency: clean
	@forge create SpaceToken --rpc-url ${ETH_RPC_URL} --private-key ${DEPLOYER_PRIVATE_KEY} --constructor-args ${THESPACE_TREASURY_ADDRESS} --constructor-args ${THESPACE_TREASURY_TOKENS} --constructor-args ${THESPACE_TEAM_ADDRESS} --constructor-args ${THESPACE_TEAM_TOKENS} --constructor-args ${THESPACE_INCENTIVES_ADDRESS} --constructor-args ${THESPACE_INCENTIVES_TOKENS} --constructor-args ${THESPACE_LP_ADDRESS} --constructor-args ${THESPACE_LP_TOKENS} --legacy --verify --etherscan-api-key ${ETHERSCAN_API_KEY}

deploy-the-space: clean
	@forge create TheSpace --rpc-url ${ETH_RPC_URL} --private-key ${DEPLOYER_PRIVATE_KEY} --constructor-args ${THESPACE_CURRENCY_ADDRESS} --constructor-args ${THESPACE_REGISTRY_ADDRESS} --constructor-args ${THESPACE_TOKEN_IMAGE_URI} --constructor-args ${THESPACE_ACL_MANAGER_ADDRESS} --constructor-args ${THESPACE_MARKET_ADMIN_ADDRESS} --constructor-args ${THESPACE_TREASURY_ADMIN_ADDRESS} --legacy --verify --etherscan-api-key ${ETHERSCAN_API_KEY}

## TheSpace:Snapper
deploy-snapper: clean
	@forge create Snapper --rpc-url ${ETH_RPC_URL} --private-key ${DEPLOYER_PRIVATE_KEY} --legacy --verify --etherscan-api-key ${ETHERSCAN_API_KEY}
