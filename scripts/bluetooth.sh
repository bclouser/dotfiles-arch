#!/usr/bin/env bash

# To scan for bluetooth devices
# bluetoothctl scan on




HEADPHONE_MAC_ADDRESS=$(cat ~/.config/headphone.mac)

# Turn on the controller
bluetoothctl power on

# Connect headphones
bluetoothctl connect $HEADPHONE_MAC_ADDRESS
bluetoothctl trust $HEADPHONE_MAC_ADDRESS
