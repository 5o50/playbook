# Network

https://help.ovhcloud.com/csm/en-ie-vps-configure-reverse-dns?id=kb_article_view&sysparm_article=KB0047596
https://help.ovhcloud.com/csm/en-ie-vps-network-ipaliasing?id=kb_article_view&sysparm_article=KB0047586
https://help.ovhcloud.com/csm/en-ie-vps-secondary-dns-vps?id=kb_article_view&sysparm_article=KB0047508

ss
```bash
ss -tape
ss state established
ss dst :80
ss dst :443
```

ufw
```bash
sudo apt install ufw
sudo ufw app list | grep WWW
sudo ufw allow 'WWW Full'
sudo ufw allow 'SSH'
sudo ufw enable
sudo ufw status

sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw disable
```

iptables
```bash
sudo apt-get install iptables
iptables -L -v
sudo -s iptables-save -c

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

sudo iptables -A INPUT -j DROP

sudo iptables -P INPUT DROP 

sudo iptables -L --line-numbers
sudo iptables -D INPUT <Number>

sudo iptables -A INPUT -s your_IP_address_to_authorise -j ACCEPT
sudo iptables -A INPUT -s your_IP_address_to_block -j DROP

sudo iptables -A INPUT -m iprange --src-range your_start_IP_address-your_end_IP_address -j REJECT


```


fail2ban
```bash
sudo apt install fail2ban

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local

[DEFAULT]
bantime  = 10m
maxretry = 5
enabled = false

[sshd]
enabled = true
port = ssh
filter = sshd
maxretry = 3
findtime = 5m
bantime  = 30m

sudo systemctl restart fail2ban

sudo systemctl start fail2ban
sudo systemctl enable fail2ban
sudo systemctl status fail2ban
```