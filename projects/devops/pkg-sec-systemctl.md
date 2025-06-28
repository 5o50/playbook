systemctl list-unit-files --type=service
systemctl list-units --type=service
systemctl list-dependencies service_name
systemctl reboot

systemctl cat promtail
systemctl show redpanda