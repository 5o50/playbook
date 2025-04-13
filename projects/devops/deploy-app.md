
## Update deps
bunx npm-check-updates -i --format group

## Development

```
cp .env.example .env
uncomment the seed env var
bun dev
```


## Production

```
cp .env.example .env
bun dev:prod
sudo systemctl start sophiechiro
```

## Deployment

**DNS Records**
```
A domain.com <vps_ip> proxied ttl=auto
cname www domain.com proxied ttl=auto
```

**SSL Certificates**
```
SSL/TLS > Origin Server > Create Certificate
Set SSL encryption mode to Full (Strict)

sudo nano /etc/ssl/certs/sophiechiro_origin_certificate.pem
sudo nano /etc/ssl/private/sophiechiro_private_key.pem
```

**Cloudflare Optimizations**
```
Enable Speed > optimization > 
- Early Hints
- Rocket Loader
- 0-RTT Connection Resumption
- AMP Real URL
- Always Use HTTPS
```

**Build**
!!! NEVER FORGET TO CREATE A MIGRATION WHEN DEPLOYING !!!
```
bun dev:prod
cp .env.example .env
```

**nginx**
```
sudo cp infra/nginx/sophiechiro.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/sophiechiro.conf /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/sophiechiro.conf
sudo nginx -t
sudo systemctl restart nginx

cat /var/log/nginx/error.log
```

**systemd**
```
sudo cp infra/systemd/sophiechiro.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable sophiechiro.service
sudo systemctl start sophiechiro
sudo systemctl status sophiechiro
sudo systemctl stop sophiechiro
sudo systemctl restart sophiechiro
```

**postgres**
```
sudo -u postgres psql
\l ; show databases;
\c sophiechiro or \disconnect
\dt or \dt+
\dn or \dn+
\d table_name or \d+ table_name
\q ; quit
```

**journalctl**
```
sudo journalctl -eu sophiechiro.service
sudo journalctl -u sophiechiro.service -n 50 -f
```

