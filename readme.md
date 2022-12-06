# Shairport Sync update script for your Raspberry Pi

## Introduction
With the new AirPlay 2 support Shairport Sync gets updated regularly and it is a bit of a hassle to update it manually. This two scripts will do it for you if you are using a Raspberry Pi.

Basically it just executes the commands from the official build guide for Raspberry Pi OS with AirPlay 2. The modifications made in the configuration file are not touched. This script is tested on a Raspberry Pi 3 with Raspberry Pi OS.

If you install Shairport Sync for the first time, follow the instructions on the [Shairport Sync GitHub page](https://github.com/mikebrady/shairport-sync/blob/master/BUILD.md).

## Shairport Sync
[Shairport Sync](https://github.com/mikebrady/shairport-sync) is an [AirPlay](https://www.pocket-lint.com/speakers/news/apple/144646-apple-airplay-2-vs-airplay-what-s-the-difference) audio player for Linux and FreeBSD. It plays audio streamed from Apple devices and from AirPlay sources such as [OwnTone](https://github.com/owntone/owntone-server) (formerly `forked-daapd`).

## Update guide

Connect to your pi and download this update script
```
git clone https://github.com/Weidav/shairport_update_script.git
cd shairport_update_script
```

<br>

Execute the the first script with root privileges
```
sudo ./uninstall.sh
```
<br>

Wait for reboot. <br>
Reconnect to your pi and execute the the second script with root privileges
```
cd shairport_update_script
sudo ./update.sh
```
