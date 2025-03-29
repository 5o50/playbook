all:
	rclone sync -i ./dist teazit:teazit-staging-web-v2
	rclone lsd teazit:teazit-staging-web-v2

hide: 
	defaults write com.apple.finder CreateDesktop false
	killall Finder

show:
	defaults write com.apple.finder CreateDesktop true
	killall Finder

# https://superuser.com/questions/370388/simple-built-in-way-to-encrypt-and-decrypt-a-file-on-a-mac-via-command-line

# encrypt file.txt to file.enc using 256-bit AES in CBC mode
encrypt:
	openssl enc -aes-256-cbc -salt -in file.txt -out file.enc

# decrypt binary file.enc
decrypt:
	openssl enc -d -aes-256-cbc -in file.enc -out file.txt

# the same, only the output is base64 encoded for, e.g., e-mail
encrypt2:
	openssl enc -aes-256-cbc -a -salt -in archive.zip -out archive.enc

# decrypt base64-encoded version
decrypt2:
	openssl enc -d -aes-256-cbc -a -in archive.enc -out archive.zip
