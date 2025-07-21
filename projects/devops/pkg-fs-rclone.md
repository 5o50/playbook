# Rclone

## Installation
```bash
sudo apt update
sudo apt install rclone
rclone config
```

## Configuration
```bash
nano .config/rclone/rclone.conf 
[r2]
type = s3
provider = Cloudflare
endpoint = <r2_endpoint_without_bucket_name>
env_auth = true
region = auto
```

## Environment Variables
```bash
# DONT FORGET TO ADD THE ENV VARS FROM R2
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
```

## Sync Operations
```bash
# Sync local folder to R2
rclone sync /media/mars/NEPTUNE/pluton r2:pluton-01jzxhe35mk495pavbbhdth99m/pluton --progress

# Sync R2 to local
rclone sync r2:pluton-01jzxhe35mk495pavbbhdth99m/pluton /media/mars/hddultra/pluton --progress

# Empty bucket
rclone purge r2:pluton-01jzxhe35mk495pavbbhdth99m --progress
```

## Mounting for Cryptomator

### 2. Create Mount Point
```bash
sudo mkdir -p /mnt/r2-pluton
sudo chown mars: /mnt/r2-pluton
```

### 3. Mount R2 Bucket
```bash
# input cloudflare r2 bucket credentials
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
# before mount check the connection
rclone ls r2:pluton-01jzxhe35mk495pavbbhdth99m
rclone mount r2:pluton-01jzxhe35mk495pavbbhdth99m /mnt/r2-pluton
```

### 4. Verify Mount
```bash
ls /mnt/r2-pluton/pluton/
# Should show your Cryptomator vault files
```

## Flatpak Application Access

### Method 1: Flatpak Override (Command Line)
```bash
# Grant filesystem access to specific Flatpak app
flatpak override --user org.cryptomator.Cryptomator --filesystem=/mnt/r2-pluton

# Grant access to entire /mnt directory
flatpak override --user org.cryptomator.Cryptomator --filesystem=/mnt
```

### Method 2: Flatseal (GUI)
1. Install Flatseal: `flatpak install com.github.tchx84.Flatseal`
2. Open Flatseal
3. Find your app (e.g., Cryptomator)
4. Go to "Filesystem" section
5. Add `/mnt/r2-pluton` or `/mnt` to "Other files" list
6. Save changes

### Method 3: Use File Chooser Portal (Recommended)
- Open Cryptomator Flatpak
- Use the native file chooser to navigate to `/mnt/r2-pluton/pluton/`
- Select vault folder through the portal

## Troubleshooting

### Check Mount Status
```bash
# Check if mount is active
mount | grep rclone

# Check rclone processes
ps aux | grep rclone

# View mount contents
ls -la /mnt/r2-pluton/
```

### Unmount
```bash
fusermount -u /mnt/r2-pluton
```

### Check Logs
```bash
cat /tmp/rclone.log
```

### Common Issues
- **Permission denied**: Ensure `user_allow_other` is set in `/etc/fuse.conf`
- **Empty mount**: Check environment variables are set in the same shell
- **Flatpak can't access**: Use Flatseal or file chooser portal

## Auto-start on Boot
```bash
# Create systemd service for persistent mounting
# (Advanced setup - requires environment variables in service file)
```

## Usage with Cryptomator
1. Mount R2 bucket: `/mnt/r2-pluton/pluton/`
2. Open Cryptomator Flatpak
3. Use file chooser to select vault location
4. Or use symlink: `~/r2-pluton-vault` (created earlier)
