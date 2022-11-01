#!/bin/bash

# run script with root privileges

# config file won't be deletet, but we back it up anyway
cp /etc/shairport-sync.conf /etc/shairport-sync.conf.bak

# Remove Old Copies of Shairport Sync
shairport_dir=$(which shairport-sync)
if rm -rf "$shairport_dir"; then
    echo "Successfully deleted old Shairport Sync copy"
else
    echo "Could not delete old Shairport Sync copy" >&2
fi

# Remove Old Service Files
rm -f /etc/systemd/system/shairport-sync.service
rm -f /etc/systemd/user/shairport-sync.service
rm -f /lib/systemd/user/shairport-sync.service
rm -f /etc/init.d/shairport-sync

# Reboot after Cleaning Up
echo "Rebooting, reconnect to your pi and run the update.sh script"
reboot
