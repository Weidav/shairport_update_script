#!/bin/bash

# run script with root privileges

cd ~/ || exit

# Get Tools and Libraries
apt update
apt upgrade -y
apt install --no-install-recommends build-essential git autoconf automake libtool \
    libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev \
    libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev xxd

# Update NQPTP
if rm -f /lib/systemd/system/nqptp.service; then
    echo "Successfully deleted old NQPTP copy"
else
    echo "Could not delet old NQPTP copy" >&2
fi

git clone https://github.com/mikebrady/nqptp.git
cd nqptp || exit
autoreconf -fi
./configure --with-systemd-startup
make
make install

systemctl restart nqptp

# Build & Install Shairport Sync
cd || exit
git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync || exit
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa \
    --with-soxr --with-avahi --with-ssl=openssl --with-systemd --with-airplay-2
make
make install

if systemctl enable shairport-sync; then
    echo "Shairport Sync successfully updated and running"
else
    echo "Failed to updated Shairport Sync " >&2
fi

echo "Rebooting"
reboot
