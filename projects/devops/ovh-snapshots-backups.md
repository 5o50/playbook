# Snapshots 

https://help.ovhcloud.com/csm/en-ie-vps-using-snapshots?id=kb_article_view&sysparm_article=KB0047762
https://help.ovhcloud.com/csm/en-ie-vps-using-automated-backups?id=kb_article_view&sysparm_article=KB0047755


```bash
ssh <user>@<vps_ip>
cd /var/www/html
tar -czf site_backup.tar.gz *
```

```bash
scp site_backup.tar.gz <user>@<vps_ip>:~/
```

```bash
cd /var/www/html
tar -xzf site_backup.tar.gz
```

```bash
rsync -avz /var/www/html/site_backup.tar.gz <user>@<destination_ip>:/var/www/html/
```
