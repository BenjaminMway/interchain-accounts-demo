
WALLET_1=$(icad keys show wallet1 -a --keyring-backend test --home ./data/test-1) 
WALLET_2=$(icad keys show wallet2 -a --keyring-backend test --home ./data/test-1) 
WALLET_3=$(icad keys show wallet3 -a --keyring-backend test --home ./data/test-2) 
WALLET_4=$(icad keys show wallet4 -a --keyring-backend test --home ./data/test-2) 

while [ true ] 

do


icad tx bank send $WALLET_3 $WALLET_4 1000000stake --chain-id test-2 --home ./data/test-2 --gas auto --gas-prices 1stake --gas-adjustment 1.5 --node tcp://localhost:26657 --keyring-backend test -y

sleep 5

icad tx bank send $WALLET_4 $WALLET_3 1000000stake --chain-id test-2 --home ./data/test-2 --gas auto --gas-prices 1stake --gas-adjustment 1.5 --node tcp://localhost:26657 --keyring-backend test -y

sleep 5

icad tx ibc-transfer transfer transfer channel-0 $WALLET_2 1000000stake --from $WALLET_3 --chain-id test-2 --home ./data/test-2 --gas auto --gas-prices 1stake --gas-adjustment 1.5 --node tcp://localhost:26657 --keyring-backend test -y

sleep 5

icad tx ibc-transfer transfer transfer channel-0 $WALLET_3 1000000stake --from $WALLET_2 --chain-id test-1 --home ./data/test-1 --gas auto --gas-prices 1stake --gas-adjustment 1.5 --node tcp://localhost:16657 --keyring-backend test -y

sleep 5
done