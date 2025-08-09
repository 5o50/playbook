# Monitoring System Logs on Ubuntu 24.04

This guide outlines the most important system log files for monitoring, security, and troubleshooting on Ubuntu 24.04.

journalctl -n 20
journalctl -u service_name
journalctl -p err

journalctl -u alloy.service --no-pager -n 100

journalctl -eu sophiechiro.service
journalctl -u sophiechiro.service -n 50 -f


## Key Log Files

Here are the primary system log files and their purposes:

- **/var/log/syslog**: The main system log, consolidating messages from the system and various applications.
- **/var/log/auth.log**: Tracks all authentication attempts, including `sudo` usage and SSH logins. Essential for security monitoring.
- **/var/log/kern.log**: Contains Linux kernel messages, which are useful for diagnosing hardware or driver-related issues.
- **/var/log/dpkg.log**: A detailed history of package installations, removals, and updates performed with `dpkg` and `apt`.
- **/var/log/boot.log**: Records information about the system's boot process.
- **/var/log/ufw.log**: Logs from the Uncomplicated Firewall (UFW), if it is enabled.


## Methods for Querying Logs

### Using `journalctl` (systemd)

Since the adoption of systemd, the `journalctl` command provides the most powerful and flexible way to query system logs.

- **View all logs:**
  ```bash
  journalctl
  ```
- **View logs for the current boot:**
  ```bash
  journalctl -b
  ```
- **View logs for a specific service (e.g., SSH):**
  ```bash
  journalctl -u ssh
  ```
- **Filter logs by keyword (e.g., "error"):**
  ```bash
  journalctl | grep error
  ```
- **Follow logs in real-time:**
  ```bash
  journalctl -f
  ```

### Direct File Access

For traditional log files in `/var/log`, you can use standard command-line tools:

- Use **`less`**, **`more`**, **`cat`**, or **`tail -f`** to view log file contents.
  ```bash
  sudo less /var/log/syslog
  sudo tail -f /var/log/auth.log
  ```
- Use **`grep`** to filter or search for specific patterns.
  ```bash
  sudo grep "Failed password" /var/log/auth.log
  ```

### Compressed Logs

Archived logs are typically compressed with `.gz`. Use the following tools to read them without extracting them first:

- **`zcat`**: Displays the content of a compressed file.
- **`zless`**: Views compressed files with `less`.
- **`zgrep`**: Searches for patterns within compressed files.

For example:
```bash
sudo zgrep "some_pattern" /var/log/auth.log.1.gz
```

### Graphical Tools

- **Log File Viewer** (`gnome-logs`): A graphical user interface for exploring system logs.

### Advanced: Centralized Logging

- **Rsyslog**: Installed by default on Ubuntu 24.04, `rsyslog` can be configured for advanced log collection, filtering, and forwarding to a remote log server for centralized monitoring.

## Summary

To effectively monitor an Ubuntu 24.04 system, you should regularly check key logs such as `syslog`, `auth.log`, and `kern.log`. Use `journalctl` for interacting with the systemd journal and traditional tools like `less` and `grep` for plain-text logs in `/var/log`. For more complex environments, consider setting up a centralized logging system with `Rsyslog`.
