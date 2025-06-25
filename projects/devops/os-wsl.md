# WSL cheatsheet

## Useful links:
https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database
https://help.ovhcloud.com/csm/en-ie-vps-firewall-windows?id=kb_article_view&sysparm_article=KB0056967

## .wslconfig file
```
[wsl2]
guiApplications=true
memory=24GB # default is 50% of total mem
swap=12GB   # should be half of memory
processors=8

[experimental]
sparseVhd=true
autoMemoryReclaim=gradual
networkingMode=mirrored
hostAddressLoopback=true
firewall=false
dnsTunneling=true
autoProxy=false
```

# install
wsl --install -d Ubuntu-24.04 --web-download 

# to do
wsl --update
wsl --list --online

# export / import
wsl --export <DistroName> ubuntu_backup.tar
wsl --import <NewName> C:\WSL\Ubuntu-Dev ubuntu_backup.tar

# delete
wsl --unregister <Distro>

# launch
wsl -d <DistroName>

# manage
wsl --shutdown
wsl --list --verbose
