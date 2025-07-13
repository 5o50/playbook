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
endpoint = <r2_endpoint_without_bucket_name>
env_auth = true
region = auto
```


```
# DONT FORGER TO ADD THE ENV VARS FROM R2
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY
```

```
rclone sync /media/mars/NEPTUNE/pluton r2:pluton-01jzxhe35mk495pavbbhdth99m/pluton --progress

# empty
rclone purge r2:pluton-01jzxhe35mk495pavbbhdth99m --progress

# mount
rclone mount r2:pluton-01jzxhe35mk495pavbbhdth99m /mnt/r2-pluton --daemon
```