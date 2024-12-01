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
encrypt:
	# encrypt file.txt to file.enc using 256-bit AES in CBC mode
	#openssl enc -aes-256-cbc -salt -in file.txt -out file.enc
	# the same, only the output is base64 encoded for, e.g., e-mail
	openssl enc -aes-256-cbc -a -salt -in archive.zip -out archive.enc

decrypt:
	# decrypt binary file.enc
	#openssl enc -d -aes-256-cbc -in file.enc -out file.txt
	# decrypt base64-encoded version
	openssl enc -d -aes-256-cbc -a -in archive.enc -out archive.zip
