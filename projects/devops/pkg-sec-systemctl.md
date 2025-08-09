systemctl list-unit-files --type=service
systemctl list-units --type=service
systemctl list-dependencies service_name
systemctl reboot

systemctl cat promtail
systemctl show redpanda

```
sudo cp infra/systemd/sophiechiro.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable sophiechiro.service
sudo systemctl start sophiechiro
sudo systemctl status sophiechiro
sudo systemctl stop sophiechiro
sudo systemctl restart sophiechiro
```


sudo groupadd --system sophiechiro
sudo useradd --system -s /bin/false -d /var/lib/sophiechiro -g sophiechiro sophiechiro
sudo mkdir -p /var/lib/sophiechiro /var/log/sophiechiro /etc/sophiechiro
sudo chown -R sophiechiro:sophiechiro /var/lib/sophiechiro /var/log/sophiechiro /etc/sophiechiro
