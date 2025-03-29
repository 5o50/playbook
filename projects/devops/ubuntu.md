# Ubuntu: https://ubuntu.com/about/release-cycle - https://wiki.ubuntu.com/Releases
active LTS: Ubuntu 24.04 LTS (Noble Numbat)


https://help.ovhcloud.com/csm/en-ie-public-cloud-compute-vps-image-life-cycle?id=kb_article_view&sysparm_article=KB0050805


```bash
uname -r
kernel: 5.15.167.4-microsoft-standard-WSL2
history
```

```bash
sudo apt update && sudo apt upgrade -y
apt list --manual-installed 
apt-mark showmanual
```

```bash
systemctl reboot
uptime

top ou htop

sudo swapoff -a && swapon -a 
```

```bash
crontab -e

journalctl -n 20
journalctl -u service_name
journalctl -p err

service --status-all

systemctl list-units --type=service
systemctl list-unit-files
systemctl list-dependencies service_name


```

