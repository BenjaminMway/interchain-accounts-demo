
WALLET_1=$(icad keys show wallet1 -a --keyring-backend test --home ./data/test-1) 
WALLET_2=$(icad keys show wallet2 -a --keyring-backend test --home ./data/test-1) 
WALLET_3=$(icad keys show wallet3 -a --keyring-backend test --home ./data/test-2) 
WALLET_4=$(icad keys show wallet4 -a --keyring-backend test --home ./data/test-2) 

ICA_ADDR=$(icad query intertx interchainaccounts connection-0 $WALLET_1 --home ./data/test-1 --node tcp://localhost:16657 -o json | jq -r '.interchain_account_address')

while [ true ] 

do

icad tx bank send $WALLET_3 $ICA_ADDR 100stake --chain-id test-2 --home ./data/test-2 --node tcp://localhost:26657 --keyring-backend test -y

sleep 5
done