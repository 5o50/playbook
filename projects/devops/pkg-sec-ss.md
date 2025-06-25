# ss: The Modern netstat

`ss` is a powerful command-line utility for investigating network sockets on a Linux system. It's considered the modern replacement for the older `netstat` command, as it's generally faster and provides more detailed information.

## Why use `ss` over `netstat`?

- **Faster**: `ss` gets its information directly from the kernel space, while `netstat` has to parse `/proc/net/tcp`, which can be slow on systems with many connections.
- **More Information**: Provides more TCP state information than `netstat`.

## Common `ss` Options

The power of `ss` comes from combining its various options.

| Option | Description |
| :--- | :--- |
| `-t` | Display TCP sockets. |
| `-u` | Display UDP sockets. |
| `-x` | Display Unix sockets. |
| `-a` | Display all sockets (listening and non-listening). |
| `-l` | Display listening sockets. |
| `-p` | Show the process using the socket. (Requires `sudo`) |
| `-e` | Show extended, detailed socket information. |
| `-n` | Do not resolve service names (e.g., show `80` instead of `http`). |
| `-o` | Show timer information. |
| `-s` | Show a summary of socket statistics. |
| `-r` | Resolve numeric IP addresses/ports |

---

## Practical Examples

### 1. List All Connections

This is a great starting point to see everything. The options `-t, -u, -a, -p` mean:
- `-t`: TCP
- `-u`: UDP
- `-a`: All states (listening and connected)
- `-p`: Show process

```bash
sudo ss -tuap
```

For a more detailed view, add `-e` for extended information and `-n` to see port numbers instead of service names (`:443` vs `:https`).

```bash
sudo ss -tuapen
```

### 2. List Listening Sockets

To see only the sockets that are waiting for incoming connections. This is very useful for security audits and checking which services are running.

```bash
# Show all listening sockets (TCP, UDP, Unix)
sudo ss -lap

# Show only listening TCP sockets with port numbers
sudo ss -ltnp
```

### 3. Filter by State

You can filter connections by their TCP state (`established`, `listen`, `time-wait`, `syn-sent`, etc.).

```bash
# Show all established TCP connections
ss -t state established

# Find connections in a TIME-WAIT state
ss -t state time-wait
```

### 4. Filter by Port or Address

You can filter for specific destination (`dst`) or source (`src`) ports and IP addresses.

```bash
# Show all connections to port 443 (HTTPS)
ss dst :443

# Show all connections from your machine on port 22 (SSH)
ss src :22

# Show connections to a specific IP address
ss dst 192.168.1.100

# Combine filters: show established connections to a web server on port 80
ss state established dst :80
```

### 5. Find Which Process is Using a Port

This is extremely useful for troubleshooting.

```bash
# Find what is listening on port 8080
sudo ss -ltnp 'sport = :8080'
```

### 6. Socket Summary

Get a quick overview of all sockets.

```bash
ss -s
```

```bash
ss -tape
ss state established
ss dst :80
ss dst :443
```
