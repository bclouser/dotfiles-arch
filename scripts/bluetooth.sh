#!/usr/bin/env bash

HEADPHONE_MAC_ADDRESS=$1

# Turn on the controller
bluetoothctl power on

# Connect headphones
bluetoothctl connect $HEADPHONE_MAC_ADDRESS
