# Typesense: https://typesense.org/ -- https://github.com/typesense/typesense/releases
stable: 28.0

# Installation
https://typesense.org/docs/guide/install-typesense.html#deb-package-on-ubuntu-debian

```
curl -O https://dl.typesense.org/releases/28.0/typesense-server-28.0-amd64.deb
sudo apt install ./typesense-server-28.0-amd64.deb
```

## Post-installation hardening

### Create dedicated user and group
It's good practice to run services under a dedicated user.

```bash
sudo useradd --system -s /bin/false -d /var/lib/typesense typesense

```

### Set directory permissions
The `typesense` user needs to own its data, log and configuration directories.

```bash
sudo chown -R typesense:typesense /var/lib/typesense /var/log/typesense /etc/typesense
```

### Configure systemd service
The systemd service file for Typesense is located at `/etc/systemd/system/typesense-server.service`. We need to tell it to run as the `typesense` user.

add the following content:

```ini
[Service]
User=typesense
Group=typesense
```


### Start and enable the service

Now we can reload systemd configuration, and start (and enable) the typesense service.

```bash
sudo systemctl daemon-reload
sudo systemctl enable typesense-server
```

---

The config file is at /etc/typesense/typesense-server.ini
The admin API key is auto-generated and can be found inside the config file.
Logs are under /var/log/typesense/
Data dir is under /var/lib/typesense/
