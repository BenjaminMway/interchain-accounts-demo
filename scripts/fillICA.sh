# Store the following account addresses within the current shell env
WALLET_1=$(icad keys show wallet1 -a --keyring-backend test --home ./data/test-1) 
WALLET_2=$(icad keys show wallet2 -a --keyring-backend test --home ./data/test-1) 
WALLET_3=$(icad keys show wallet3 -a --keyring-backend test --home ./data/test-2) 
WALLET_4=$(icad keys show wallet4 -a --keyring-backend test --home ./data/test-2) 

ICA_ADDR=$(icad query intertx interchainaccounts connection-0 $WALLET_1 --home ./data/test-1 --node tcp://localhost:16657 -o json | jq -r '.interchain_account_address')
# icad tx bank send $WALLET_3 $ICA_ADDR 10000stake --chain-id test-2 --home ./data/test-2 --node tcp://localhost:26657 --keyring-backend test -y


#icad tx authz grant cosmos1d84j42rnfgq60sjxpzj4pgfu35mew34dpp3g0h send --spend-limit 1000stake --from=cosmos14zs2x38lmkw4eqvl3lpml5l8crzaxn6m7wuznx --chain-id test-2 --home ./data/test-2 --node tcp://localhost:26657 --keyring-backend test -y
icad tx authz grant cosmos1mjk79fjjgpplak5wq838w0yd982gzkyfrk07am generic --msg-type /intertx.MsgSubmitTx  --from=cosmos1m9l358xunhhwds0568za49mzhvuxx9uxre5tud --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y


icad tx authz exec ./testJson.json --from cosmos1mjk79fjjgpplak5wq838w0yd982gzkyfrk07am --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y