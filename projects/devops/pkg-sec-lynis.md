# Lynis Security Auditing Tool

Lynis is an open-source security auditing tool for UNIX-based systems like Linux, macOS, and BSD. It performs an in-depth security scan and provides suggestions for hardening the system.

## Installation

You can install Lynis using the package manager for your distribution or by cloning the Git repository for the latest version.

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install lynis
```

### From Source (Recommended for latest version)

Cloning from GitHub ensures you have the most recent version with the latest tests.

```bash
cd /opt/
sudo git clone https://github.com/CISOfy/lynis
```
This will create a `lynis` directory in `/opt/`.

## Running an Audit

The primary command for Lynis is `audit system`.

If installed from a package manager:
```bash
sudo lynis audit system
```

If cloned from Git:
```bash
cd /opt/lynis
sudo ./lynis audit system
```

The audit will take a few minutes. Lynis will display real-time information about the tests it's performing.

## Understanding the Report

Once the audit is complete, Lynis provides a report with several key sections:

*   **Warnings**: These are potential security issues that should be investigated.
*   **Suggestions**: These are recommendations for hardening your system. Each suggestion has a link to a CISOfy control page for more information.

The full report is stored in `/var/log/lynis.log`, and the data from the last scan is in `/var/log/lynis-report.dat`.

## System Hardening

To act on the suggestions, you can get more details about a specific test ID.

```bash
# If installed from package
sudo lynis show details <TEST-ID>

# If from git
cd /opt/lynis
sudo ./lynis show details <TEST-ID>
```

For example, if you have a suggestion for `FILE-7524`:
```bash
sudo ./lynis show details FILE-7524
```
This will provide information on the issue and guidance on how to resolve it.

## Common Commands

*   `lynis show commands`: Display all available Lynis commands.
*   `lynis show version`: Show the current Lynis version.
*   `lynis update info`: Check for a new version of Lynis.

## Automated Audits with Cron

It's a good practice to run Lynis periodically. You can set up a cron job to automate this.

Create a cron file:
```bash
sudo nano /etc/cron.d/lynis-audit
```

Add the following line to run a weekly audit every Sunday at 3 AM:
```
0 3 * * 0 root /opt/lynis/lynis audit system --cronjob >> /var/log/lynis-weekly-audit.log
```

The `--cronjob` flag ensures that Lynis runs in a non-interactive mode suitable for automation.