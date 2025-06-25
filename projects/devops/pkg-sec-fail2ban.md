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