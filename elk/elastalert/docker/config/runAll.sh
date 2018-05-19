#!/usr/bin/env sh

echo "starting script - wait 2 minutes" > /dev/console
sleep 120

echo "elastalert-create-index" > /dev/console
elastalert-create-index
sleep 5
echo "elastalert --start NOW --verbose" > /dev/console
elastalert --start NOW --verbose