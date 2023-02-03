#!/bin/bash

# Load shell variables
. ./network/hermes/variables.sh

# Start the hermes relayer in multi-paths mode
echo "Starting hermes relayer..."
echo $HERMES_BINARY
echo $CONFIG_DIR
$HERMES_BINARY -c $CONFIG_DIR start
