# UFW (Uncomplicated Firewall)

UFW, or Uncomplicated Firewall, is a user-friendly interface for managing `iptables` firewall rules on Linux. It's designed to be simple and intuitive, making basic firewall configuration accessible to everyone.

## Installation

UFW is installed by default on many Debian-based distributions, including Ubuntu. If it's not present, you can install it.

```bash
sudo apt update
sudo apt install ufw
```

## Basic Usage

### Check Status

You can check if UFW is active and see the list of current rules.

```bash
# A simple status check
sudo ufw status

# A more detailed status check
sudo ufw status verbose
```

### Enable UFW

When you enable UFW, it will automatically start at boot. By default, it denies all incoming connections and allows all outgoing connections.

```bash
sudo ufw enable
```

> **Warning:** Enabling the firewall can interrupt active connections, including your SSH session if the SSH port is not explicitly allowed. Always allow the SSH port before enabling UFW on a remote server.

### Disable UFW

If you need to stop the firewall completely:

```bash
sudo ufw disable
```

## Managing Rules

### Default Policies

You can change the default behavior for incoming and outgoing traffic.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Allowing Connections

You can allow connections by specifying a port number, a service name, or an application profile.

**By Port Number:**

```bash
# Allow TCP traffic on port 22 (SSH)
sudo ufw allow 22/tcp

# Allow UDP traffic on port 53 (DNS)
sudo ufw allow 53/udp

# Allow both TCP and UDP on a port (e.g., 80 for HTTP)
sudo ufw allow 80
```

**By Service Name:**

UFW can use service names defined in the `/etc/services` file.

```bash
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
```

**By Application Profile:**

Many applications that require open ports will register a profile with UFW upon installation.

```bash
# List all available application profiles
sudo ufw app list

# Allow an application profile (e.g., for Nginx)
sudo ufw allow 'Nginx Full'
```

### Denying Connections

Denying connections uses the same syntax as allowing them.

```bash
# Deny traffic on port 3306 (MySQL)
sudo ufw deny 3306

# Deny HTTP traffic
sudo ufw deny http
```

### Rate-Limiting Connections with `limit`

To protect services from brute-force attacks, UFW can rate-limit connections. By default, UFW will deny a connection if an IP address has attempted to initiate 6 or more connections within the last 30 seconds. This is particularly useful for services like SSH.

```bash
# Limit connection attempts to the SSH port
sudo ufw limit ssh
```

When you check your status, the action for this rule will show as `LIMIT`.

For example, if you see the following rule:

```
To                         Action      From
--                         ------      ----
55555/tcp                  LIMIT       Anywhere
```

It means that incoming TCP connections to port `55555` from any IP address are allowed, but they are rate-limited to prevent abuse.

### Deleting Rules

You can delete rules by specifying the rule itself or by its number.

**By Rule Specification:**

```bash
sudo ufw delete allow http
sudo ufw delete deny 3306
```

**By Rule Number (Recommended):**

This is often easier and less error-prone.

```bash
# 1. List the rules with their numbers
sudo ufw status numbered

# 2. Delete the rule by its number
sudo ufw delete 1 
```

### Resetting UFW

To revert all changes and go back to a default state, you can reset UFW. This will disable the firewall and delete all existing rules.

```bash
sudo ufw reset
```

## Example: Basic Web Server Setup

Here is a common scenario for setting up a firewall on a web server.

1.  **Allow SSH to maintain access:**
    ```bash
    sudo ufw allow ssh
    ```

2.  **Allow HTTP and HTTPS traffic:**
    ```bash
    sudo ufw allow http
    sudo ufw allow https
    ```
    Alternatively, if you have an application profile like `Nginx Full`, you can use that:
    ```bash
    sudo ufw allow 'Nginx Full'
    ```

3.  **Enable the firewall:**
    ```bash
    sudo ufw enable
    ```

4.  **Verify the new rules are active:**
    ```bash
    sudo ufw status
    ```
    You should see that SSH (port 22), HTTP (port 80), and HTTPS (port 443) are allowed.

