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


```bash
mkdir ~/.ssh
ssh-keygen -t ed25519 -a 100
ssh-keygen -t rsa -b 4096 -a 100
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


