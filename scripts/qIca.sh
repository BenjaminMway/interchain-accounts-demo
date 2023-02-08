#!/bin/bash

BINARY=icad
CHAIN_DIR=./data
CHAINID_1=test-1
CHAINID_2=test-2

WALLET_1=$(icad keys show wallet1 -a --keyring-backend test --home ./data/test-1) 
WALLET_2=$(icad keys show wallet2 -a --keyring-backend test --home ./data/test-1) 
WALLET_3=$(icad keys show wallet3 -a --keyring-backend test --home ./data/test-2) 
WALLET_4=$(icad keys show wallet4 -a --keyring-backend test --home ./data/test-2)
ICA_ADDR=$(icad query intertx interchainaccounts connection-0 $WALLET_1 --home ./data/test-1 --node tcp://localhost:16657 -o json | jq -r '.interchain_account_address')
echo $ICA_ADDR

if [ ! -z $ICA_ADDR ] ; then
    watch icad q bank balances $ICA_ADDR --chain-id test-2 --node tcp://localhost:26657
fi