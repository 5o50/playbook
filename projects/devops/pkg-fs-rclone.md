# Rclone

```
sudo apt update
sudo apt install rclone
rclone config
```

```
nano .config/rclone/rclone.conf 
[r2]
type = s3
provider = Cloudflare
endpoint = <full_r2_endpoint>
env_auth = true
region = auto
```


```
# DONT FORGER TO ADD THE ENV VARS FROM R2
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY
```

```
rclone sync /media/mars/NEPTUNE/pluton r2:/ --log-level DEBUG --progress --transfers 4
```