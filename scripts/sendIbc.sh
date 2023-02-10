

BINARY=icad
CHAIN_DIR=./data
CHAINID_1=test-1
CHAINID_2=test-2

WALLET_1=$(icad keys show wallet1 -a --keyring-backend test --home ./data/test-1) 
WALLET_2=$(icad keys show wallet2 -a --keyring-backend test --home ./data/test-1) 
WALLET_3=$(icad keys show wallet3 -a --keyring-backend test --home ./data/test-2) 
WALLET_4=$(icad keys show wallet4 -a --keyring-backend test --home ./data/test-2)
ICA_ADDR=$(icad query intertx interchainaccounts connection-0 $WALLET_1 --home ./data/test-1 --node tcp://localhost:16657 -o json | jq -r '.interchain_account_address')

# icad tx ibc-transfer transfer transfer channel-0 $ICA_ADDR 11000stake --from $WALLET_1 --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y
# # icad tx ibc-transfer transfer transfer channel-0 $WALLET_1 1000stake --from $WALLET_3 --chain-id test-2 --home ./data/test-2 --node tcp://localhost:26657 --keyring-backend test -y
icad tx ibc-transfer transfer transfer channel-0 $WALLET_1 10000000000stake --from $WALLET_3 --chain-id test-2 --home ./data/test-2 --node tcp://localhost:26657 --keyring-backend test -y
icad tx bank send $WALLET_2 cosmos1u2gxdmye04eq72k0tt7ctypcwfnlzmg3efmthr 10000000stake --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y
# # icad tx ibc-transfer transfer transfer channel-0 $WALLET_3 1000ibc/C053D637CCA2A2BA030E2C5EE1B28A16F71CCB0E45E8BE52766DC1B241B77878 --from $WALLET_1 --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y
