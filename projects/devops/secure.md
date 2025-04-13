## Secure Ubuntu VPS

1. Don't use root for daily operations.
   Create a new user with sudo privileges

2. Set up a SSH key authentification
   eliminate password login

3. Update and upgrade the system
   sudo apt update && sudo apt upgrade -y

4. Secure SSH access
   disable root login
   disable password authentication
   change default ssh port
   use ip-based restrictions (AllowUsers) limit by username and ip address

5. Configure firewall
   use UFW allow ssh, http, https

6. install security tools
   fail2ban
   AIDE (Advanced Intrusion Detection Environment)
   lynis

