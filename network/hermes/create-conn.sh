#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Configure the clients and connection
echo "Initiating connection handshake..."
$HERMES_BINARY -c $CONFIG_DIR create connection test-1 test-2

sleep 2

### Create the ics20 transfer channel
echo "Initiating ics20 channel handshake..."
$HERMES_BINARY -c $CONFIG_DIR create channel --port-a transfer --port-b transfer test-2 connection-0

sleep 2
# echo "Initiating ics20 channel handshake..."
# $HERMES_BINARY -c $CONFIG_DIR create channel --port-a transfer --port-b transfer test-1 connection-0

# sleep 2


### icad tx ibc-transfer transfer transfer channel-0 $ICA_ADDR 11000stake --from $WALLET_1 --chain-id test-1 --home ./data/test-1 --node tcp://localhost:16657 --keyring-backend test -y
#ibc/C053D637CCA2A2BA030E2C5EE1B28A16F71CCB0E45E8BE52766DC1B241B77878
#ibc/C053D637CCA2A2BA030E2C5EE1B28A16F71CCB0E45E8BE52766DC1B241B77878