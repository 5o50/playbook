# SSH cheatsheet


```
# ~/.ssh/config
Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/github

Host github555
    HostName github.com
    User git
    IdentityFile ~/.ssh/github555

Host ovh1
    HostName 146.59.155.26
    Port 55555
    User ubuntu
    IdentityFile ~/.ssh/ovh1

Host visio
    HostName 192.168.0.38
    User visio
```

```bash
ssh ovh1

# test connection
ssh -T git@gitlab.com

# connect with private key
ssh -i /home/<user>/.ssh/deploy_key <user>@<VPS_IP>

# add public key to authorized_keys
cat /home/<user>/.ssh/deploy_key.pub >> /home/<user>/.ssh/authorized_keys
chmod 600 /home/<user>/.ssh/authorized_keys
```

## SECURE SSH

```bash
sudo nano /etc/ssh/sshd_config

Port 49152  <---- uncomment and replace with port between 49152 and 65535.
#AddressFamily any
#ListenAddress 0.0.0.0

# 555 Settings
PermitRootLogin no
PasswordAuthentication no

sudo systemctl restart sshd
```
or on Ubuntu 23.04 and above

```bash
sudo nano /lib/systemd/system/ssh.socket

[Socket]
ListenStream=49152
Accept=no

sudo systemctl daemon-reload
sudo systemctl restart ssh.service
```	


## gen keys

```bash
mkdir ~/.ssh
ssh-keygen -t ed25519 -a 100
ssh-keygen -t rsa -b 4096 -a 100
ssh-keygen -t rsa -b 4096 -C "github-actions" -f ~/.ssh/deploy_key
cat ~/.ssh/deploy_key.pub >> ~/.ssh/authorized_keys
```

```bash
openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048
openssl rsa -pubout -in private_key.pem -out public_key.pem
```

```bash
openssl genpkey -algorithm ED25519 -out private_key.pem
openssl pkey -in private_key.pem -pubout -out public_key.pem
```

```bash
cat key.txt | base64 --wrap=0
echo <base64> | base64 --decode
```


