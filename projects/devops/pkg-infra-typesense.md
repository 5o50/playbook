# Typesense: https://typesense.org/ -- https://github.com/typesense/typesense/releases
stable: 28.0

# Installation
https://typesense.org/docs/guide/install-typesense.html#deb-package-on-ubuntu-debian

```
curl -O https://dl.typesense.org/releases/28.0/typesense-server-28.0-amd64.deb
sudo apt install ./typesense-server-28.0-amd64.deb
sudo systemctl start typesense-server.service
```

The config file is at /etc/typesense/typesense-server.ini
The admin API key is auto-generated and can be found inside the config file.
Logs are under /var/log/typesense/
Data dir is under /var/lib/typesense/