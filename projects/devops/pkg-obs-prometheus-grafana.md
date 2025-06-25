# Prometheus 

https://prometheus.io/docs/introduction/release-cycle/
LTS: Prometheus 2.53
Latest: Prometheus 3.4.1

Tunnel SSH
```
ssh -N -L 60001:127.0.0.1:9090 ovh1
ssh -N -L 60002:127.0.0.1:3000 ovh1
```


## Installation on Ubuntu

These steps will guide you through installing Prometheus on an Ubuntu server.

### 1. Create Prometheus User and Group

It's a security best practice to run services like Prometheus under a dedicated user account.

```bash
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
```

### 2. Create Directories

Create directories for Prometheus's configuration and data files.

```bash
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

### 3. Download and Install Prometheus

Go to the [Prometheus download page](https://prometheus.io/download/) to find the latest version for Linux.

```bash
# Replace with the latest version number
wget https://github.com/prometheus/prometheus/releases/download/v3.4.1/prometheus-3.4.1.linux-amd64.tar.gz
tar vxf prometheus-*.tar.gz
cd prometheus-*.linux-amd64
```

### 4. Configure Prometheus

Move the binaries and configuration files to their proper locations.

```bash
# Move binaries
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

# Move configuration file
sudo mv prometheus.yml /etc/prometheus

# Set ownership for configuration and data directories
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus
```

### 5. Create Systemd Service File

Create a service file so you can manage Prometheus with `systemd`.

It's a best practice to configure data retention policies from the start to prevent Prometheus from consuming too much disk space. We'll set a 30-day time retention and a 10GB size limit as a safe default.

```bash
sudo nano /etc/systemd/system/prometheus.service
```

Add the following content to the file. Note the retention flags on the `ExecStart` line.

```ini
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --storage.tsdb.retention.time=30d \
    --storage.tsdb.retention.size=10GB

[Install]
WantedBy=multi-user.target
```

### 6. Start Prometheus

Reload `systemd`, then start and enable the Prometheus service.

```bash
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

You can check the status with:
```bash
sudo systemctl status prometheus
```

Restart Prometheus to apply the changes:
```bash
sudo systemctl restart prometheus
```

You can now go to the **Status > Targets** page in the Prometheus UI to see the new exporters.

### 7. Access Web UI

Prometheus will be available on port 9090. If you're using a firewall, you'll need to open the port.

```bash
sudo ufw allow 9090/tcp
```

Now you can access the Prometheus UI in your browser at `http://<your_server_ip>:9090`.

## Part 2: Monitoring Services with Exporters

To monitor different services, Prometheus uses "exporters". These are helper applications that run on the target machine, collect metrics from a specific service (like a database or the OS), and expose them in a format Prometheus can understand.

Here's how to set up exporters for your local machine, PostgreSQL, and Redis.

### 1. Monitoring Host Metrics with Node Exporter

Node Exporter provides detailed metrics about the host machine's hardware and kernel.

#### Install Node Exporter

```bash
# Download the latest version of Node Exporter
# Check for latest version at https://prometheus.io/download/#node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar -xvf node_exporter-1.9.1.linux-amd64.tar.gz
sudo mv node_exporter-1.9.1.linux-amd64/node_exporter /usr/local/bin/
rm -rf node_exporter-*
```

#### Create and Start Node Exporter Service

```bash
sudo useradd -rs /bin/false node_exporter

# Create the service file
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Start the service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
```
Node exporter will expose metrics on port `9100`.

### 2. Monitoring PostgreSQL with Postgres Exporter

The Postgres Exporter allows you to monitor your PostgreSQL server.

#### Install Postgres Exporter

```bash
# Download the latest version of Postgres Exporter
# Check for latest version at https://github.com/prometheus-community/postgres_exporter/releases
wget https://github.com/prometheus-community/postgres_exporter/releases/download/v0.17.1/postgres_exporter-0.17.1.linux-amd64.tar.gz
tar -xvf postgres_exporter-0.17.1.linux-amd64.tar.gz
sudo mv postgres_exporter-0.17.1.linux-amd64/postgres_exporter /usr/local/bin/
rm -rf postgres_exporter-*
```

#### Create and Start Postgres Exporter Service
This exporter needs credentials to connect to your PostgreSQL instance.

```bash
sudo useradd -rs /bin/false postgres_exporter

# Create an environment file for the service.
# Replace the credentials with your own.
cat <<EOF | sudo tee /etc/default/postgres_exporter
DATA_SOURCE_NAME="postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable"
EOF

# Create the service file
cat <<EOF | sudo tee /etc/systemd/system/postgres_exporter.service
[Unit]
Description=Prometheus PostgreSQL Exporter
After=network-online.target

[Service]
User=postgres_exporter
Group=postgres_exporter
Type=simple
Restart=on-failure
EnvironmentFile=/etc/default/postgres_exporter
ExecStart=/usr/local/bin/postgres_exporter

[Install]
WantedBy=multi-user.target
EOF

# Start the service
sudo systemctl daemon-reload
sudo systemctl start postgres_exporter
sudo systemctl enable postgres_exporter
```
Postgres Exporter will expose metrics on port `9187`.

### 3. Monitoring Redis with Redis Exporter

The Redis Exporter allows you to monitor your Redis server.

#### Install Redis Exporter
```bash
# Download the latest version of Redis Exporter
# Check for latest version at https://github.com/oliver006/redis_exporter/releases
wget https://github.com/oliver006/redis_exporter/releases/download/v1.74.0/redis_exporter-v1.74.0.linux-amd64.tar.gz
tar -xvf redis_exporter-v1.74.0.linux-amd64.tar.gz
sudo mv redis_exporter-v1.74.0.linux-amd64/redis_exporter /usr/local/bin/
rm -rf redis_exporter-*
```

#### Create and Start Redis Exporter Service
```bash
sudo useradd -rs /bin/false redis_exporter

# Create the service file. If your Redis server requires a password, add the --redis.password flag.
cat <<EOF | sudo tee /etc/systemd/system/redis_exporter.service
[Unit]
Description=Prometheus Redis Exporter
After=network-online.target

[Service]
User=redis_exporter
Group=redis_exporter
Type=simple
Restart=on-failure
ExecStart=/usr/local/bin/redis_exporter

[Install]
WantedBy=multi-user.target
EOF

# Start the service
sudo systemctl daemon-reload
sudo systemctl start redis_exporter
sudo systemctl enable redis_exporter
```
Redis Exporter will expose metrics on port `9121`.

## Part 3: Update Prometheus Configuration

Now, update your Prometheus configuration to collect metrics from these new exporters. Edit `/etc/prometheus/prometheus.yml` and add the following job configurations to your existing `scrape_configs` section:

```yaml
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']

  - job_name: 'postgres_exporter'
    static_configs:
      - targets: ['localhost:9187']

  - job_name: 'redis_exporter'
    static_configs:
      - targets: ['localhost:9121']
```

After adding the new jobs, the `scrape_configs` section of your `/etc/prometheus/prometheus.yml` should look similar to this:

```yaml
# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "prometheus"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["localhost:9090"]

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']

  - job_name: 'postgres_exporter'
    static_configs:
      - targets: ['localhost:9187']

  - job_name: 'redis_exporter'
    static_configs:
      - targets: ['localhost:9121']
```

Restart Prometheus to apply the changes:
```bash
sudo systemctl restart prometheus
```

You can now go to the **Status > Targets** page in the Prometheus UI to see the new exporters.

## Part 4: Visualizing with Grafana

Grafana is the best way to visualize the metrics you're collecting.

### 1. Install Grafana
```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana
```

### 2. Start Grafana
```bash
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
```
Grafana will be available on port `3000`. Access it at `http://<your_server_ip>:3000`. The default login is `admin` / `admin`.

### 3. Configure Grafana
1.  Log in and change the default password.
2.  On the left menu, go to **Connections > Add new connection**.
3.  Search for **Prometheus** and select it.
4.  Set the **Prometheus server URL** to `http://localhost:9090`.
5.  Click **Save & test**.

### 4. Import Dashboards
The easiest way to get started is to import pre-made dashboards.
1.  On the left menu, go to **Dashboards > Import dashboard**.
2.  Enter the dashboard ID and click **Load**.
3.  Select your Prometheus data source and click **Import**.

Here are some recommended dashboards:

| Service           | Dashboard Name                                         | ID    |
| ----------------- | ------------------------------------------------------ | ----- |
| Host Metrics      | [Node Exporter Full](https://grafana.com/grafana/dashboards/1860) | 1860  |
| PostgreSQL        | [PostgreSQL Database](https://grafana.com/grafana/dashboards/9628) | 9628  |
| Redis             | [Redis Dashboard](https://grafana.com/grafana/dashboards/763) | 763   |

This completes the monitoring setup.

## Part 5: Basic Alerting with Grafana

The simplest and most valuable alerting setup is to monitor core system health metrics like CPU, memory, and disk usage. This provides immediate, actionable insights into your infrastructure's health with minimal effort.

### Why This Approach is Valuable
- **Simplicity**: Installing Prometheus and Node Exporter is straightforward, and Grafana provides a user-friendly interface for setting up alerts.
- **Immediate Impact**: Alerts on high CPU usage, low memory, or low disk space quickly identify critical problems that could lead to outages.
- **Easy Notifications**: Grafana's alerting UI allows you to easily configure notifications for services like email, Slack, or PagerDuty.
- **Minimal Configuration**: You can start with sensible default thresholds (e.g., CPU > 80%, disk usage > 90%) and refine them over time.

### How to Implement Basic Alerting

This guide assumes you have already:
1.  Installed Prometheus (Part 1).
2.  Installed Node Exporter on your target machines (Part 2).
3.  Installed Grafana and connected it to your Prometheus data source (Part 4).

#### 1. Set Up a Notification Channel (Contact Point)

First, tell Grafana where to send alert notifications. To use email, you must first configure Grafana's SMTP server settings.

##### A. Configure SMTP with Resend

1.  **Prerequisites**: Before configuring Grafana, you need to register your domain on [Resend](https://resend.com) and generate an API key with `Send` permissions.

2.  **Edit `grafana.ini`**: Open `/etc/grafana/grafana.ini` and update the `[smtp]` section with your Resend credentials. Replace `<RESEND_API_KEY>` with your key.

    ```ini
    [smtp]
    enabled = true
    host = smtp.resend.com:465
    user = resend
    # If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
    password = <RESEND_API_KEY>
    ;cert_file =
    ;key_file =
    skip_verify = false
    from_address = ovh1-grafana@555.team
    from_name = OVH1 Grafana
    # EHLO identity in SMTP dialog (defaults to instance_name)
    ;ehlo_identity = dashboard.example.com
    # SMTP startTLS policy (defaults to 'OpportunisticStartTLS')
    startTLS_policy = MandatoryStartTLS
    # Enable trace propagation in e-mail headers, using the 'traceparent', 'tracestate' and (optionally) 'baggage' fields (defaults to false)
    ;enable_tracing = false
    ```

3.  **Restart Grafana**: Apply the changes by restarting the Grafana server.
    ```bash
    sudo systemctl restart grafana-server
    sudo systemctl status grafana-server
    ```

##### B. Create the Email Contact Point

Once SMTP is configured, create the contact point in the Grafana UI.

1.  In the Grafana side menu, go to **Alerting > Contact points**.
2.  Click **Add contact point**.
3.  Give it a **Name** (e.g., "Email Alerts").
4.  Choose an **Integration** type, such as `Email`.
5.  Enter the recipient email address.
6.  Click **Test** to verify it works, then **Save contact point**.

Next, you need to tell Grafana to use this contact point.

1.  Go to the **Notification policies** tab.
2.  Find the `Default policy` and click **Edit**.
3.  In the **Default contact point** dropdown, select the contact point you just created (e.g., "Email Alerts").
4.  Click **Save policy**. All alerts will now use this policy by default.

#### 2. Create an Alert Rule

Let's create an alert for high CPU usage. We'll use the "Node Exporter Full" dashboard we imported earlier.

1.  Go to **Dashboards** and open your "Node Exporter Full" dashboard.
2.  Find a panel that shows overall CPU usage. The name of this panel can change depending on the dashboard version. Look for a title like "CPU Usage" or "CPU Basic". The "Node Exporter Full" dashboard (ID 1860) has changed over time, and in recent versions, a panel like "CPU Basic" is a good candidate.
3.  Click the panel title and select **Edit**.
4.  In the panel editor, go to the **Alert** tab.
5.  Click **Create alert rule**.
6.  Grafana will automatically create a query based on the panel. You'll now configure the alert conditions.
7.  Set the conditions for the alert. You'll see a multi-step editor with queries (`A`, `B`, etc.) and expressions (`G`, `H`, etc.). We need to adjust these to alert when the `idle` CPU drops below 20%.
    - **Queries `A`-`F`**: These represent different CPU states. Identify the query for `idle` time (likely `F`).
    - **Expression `G` (Reduce)**: This expression takes a query and reduces its data to a single value.
        - Look for an expression block labeled `G` with the type `Reduce`.
        - Change its **Input** from the default (likely `A`) to the query for `idle` time (`F`).
        - The function can remain `Last`.
    - **Expression `H` (Threshold)**: This expression evaluates the result of `G`.
        - Look for an expression block labeled `H` with the type `Threshold`.
        - Ensure its **Input** is `G`.
        - Change the condition from `IS ABOVE` to `IS BELOW`.
        - Set the **Threshold** value to `0.20`. **Note:** This value depends on the panel's query. Some panels display percentages on a scale of 0-100 (requiring a threshold of `20`), while others use a 0-1 scale (requiring `0.20`). For recent versions of the "Node Exporter Full" dashboard, `0.20` is typically correct for a 20% threshold.
    - The combined logic now checks if the last value of the `idle` CPU percentage drops below 20% (represented as 0.20).
8.  In the **Alert evaluation behavior** section:
    - **For**: Set this to `5m`. This means the condition must be true for 5 minutes before the alert fires. This prevents flapping (alerts firing and resolving quickly).
9.  Give your alert a descriptive name and add a summary or annotation with useful information.
10. **Save** the rule.

You have now created your first alert. If the CPU usage on your monitored machine stays above 80% for 5 minutes, Grafana will send a notification to the contact point you configured. You can repeat this process for other key metrics like memory usage and disk space.