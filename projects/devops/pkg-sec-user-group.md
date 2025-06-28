# User and Group Management

This note provides a quick reference for managing users and groups on Ubuntu 24.04.

cat /etc/passwd
cat /etc/group

## 1. User Management

### Create User

To create a new user interactively, which will prompt for a password and user details:
```bash
sudo adduser <username>
```

To grant the new user sudo (administrative) privileges:
```bash
sudo usermod -aG sudo <username>
```

### Switch User

To switch to the new user's shell session:
```bash
sudo su - <username>
```

### Delete User

To delete a user account:
```bash
sudo deluser <username>
```

To delete a user and their home directory:
```bash
sudo deluser --remove-home <username>
```

### View User Information

To see which groups a user belongs to:
```bash
groups <username>
```

To view detailed user account information, including UID and GID:
```bash
id <username>
```

## 2. Group Management

### Create Group

To create a new user group:
```bash
sudo addgroup <groupname>
```

### Delete Group

To delete an existing group:
```bash
sudo delgroup <groupname>
```

### Add User to Group

To add an existing user to a group:
```bash
sudo adduser <username> <groupname>
```

### Remove User from Group

To remove a user from a group:
```bash
sudo deluser <username> <groupname>
```

## 3. System Files

User information is stored in the `/etc/passwd` file:
```bash
less /etc/passwd
```

Group information is stored in the `/etc/group` file:
```bash
less /etc/group
```
