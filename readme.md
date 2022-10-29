copy this folder to your pi
```
scp -r shairport_update_script pi:/home/david
```
<br>

connect to your pi and execute the the first script with root privileges
```
cd shairport_update_script
sudo ./update.sh
```
<br>

wait for reboot <br>
reconnect to your pi and execute the the second script with root privileges
```
cd shairport_update_script
sudo ./update.sh
```