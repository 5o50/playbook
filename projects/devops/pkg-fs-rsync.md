# Rsync
```
sudo apt update
sudo apt install rsync
```

0. Preferably use NTFS
if ExFat 

1. Make first full copy using Windows Explorer (Faster)

2. Then keep it Synchronized

```
ls /mnt
sudo mkdir /mnt/e
sudo mount -t drvfs E: /mnt/e
sudo umount /mnt/e
sudo rmdir /mnt/e
// -a <=> -d
sudo rsync -avh --progress --exclude="System Volume Information" --dry-run /mnt/d/ /mnt/e/
sudo rsync -avh --progress --exclude="System Volume Information" /mnt/d/ /mnt/e/

!!! add --delete if you want to sync with deletion to make a perfect copy
```