# A Modern Observability Stack with Grafana Alloy (Native Installation)
https://blog.prateekjain.dev/mastering-observability-with-grafanas-lgtm-stack-e3b0e0a0e89b?sk=d80a6fb388db5f53cb4f72b4b1c1acf7


https://prometheus.io/docs/introduction/release-cycle/
LTS: Prometheus 2.53
Latest: Prometheus 3.4.1

Tunnel SSH
```
ssh -N -L 60002:127.0.0.1:3000 ovh1
```



This guide details how to set up a comprehensive, modern observability stack on Ubuntu using native installations of Grafana, Loki, Prometheus, and Grafana Alloy.

Grafana Alloy is a powerful, unified agent based on the OpenTelemetry Collector. It replaces the need for multiple, separate agents (like Prometheus, Node Exporter, and Promtail) with a single, efficient binary. This approach simplifies installation, configuration, and maintenance.

This stack consists of:
- **Grafana Alloy**: A single agent to collect metrics and logs.
- **Prometheus**: A time-series database to store metrics.
- **Loki**: A log aggregation system to store logs.
- **Grafana**: A visualization and alerting platform to explore all your data.

---

## Part 1: Install Core Services on Ubuntu

We'll begin by installing Prometheus, Loki, and Grafana directly onto your Ubuntu server.

### 1. Install Prometheus

First, create a dedicated user and directories for Prometheus.

```bash
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

Next, download and install the Prometheus binary. Check the [Prometheus download page](https://prometheus.io/download/) for the latest version.

```bash
# Replace with the latest version number if needed
wget https://github.com/prometheus/prometheus/releases/download/v3.4.1/prometheus-3.4.1.linux-amd64.tar.gz
tar vxf prometheus-*.tar.gz
cd prometheus-*.linux-amd64

# Move binaries
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

# Move configuration file and set ownership
sudo mv prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus
cd ..
rm -rf prometheus-*.linux-amd64*
```

Now, create a `systemd` service file to manage Prometheus. Note the `--web.enable-remote-write-receiver` flag, which is crucial for Alloy to send data to Prometheus.

```bash
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
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
    --web.enable-remote-write-receiver \
    --storage.tsdb.retention.time=30d \
    --storage.tsdb.retention.size=10GB

[Install]
WantedBy=multi-user.target
EOF
```

Finally, start the Prometheus service.

```bash
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

### 2. Install Loki

Create a user and directories for Loki.

```bash
sudo useradd --system -s /bin/false loki
sudo usermod -a -G adm loki
sudo mkdir -p /etc/loki /var/lib/loki
sudo chown -R loki:loki /etc/loki /var/lib/loki
```

Download and install the Loki binary. Check the [Loki releases page](https://github.com/grafana/loki/releases) for the latest version.

```bash
# Replace with the latest version if needed
wget https://github.com/grafana/loki/releases/download/v3.4.4/loki-linux-amd64.zip
unzip loki-linux-amd64.zip
sudo mv loki-linux-amd64 /usr/local/bin/loki
sudo chown loki:loki /usr/local/bin/loki
rm loki-linux-amd64.zip
```

Create Loki's configuration file.

```bash
cat <<EOF | sudo tee /etc/loki/loki-config.yml
auth_enabled: false
server:
  http_listen_port: 3100
common:
  instance_addr: 127.0.0.1
  path_prefix: /var/lib/loki
  storage:
    filesystem:
      chunks_directory: /var/lib/loki/chunks
      rules_directory: /var/lib/loki/rules
  replication_factor: 1
  ring:
    kvstore:
      store: inmemory
schema_config:
  configs:
    - from: 2020-10-24
      store: tsdb
      object_store: filesystem
      schema: v13
      index:
        prefix: index_
        period: 24h
EOF
sudo chown -R loki:loki /etc/loki /var/lib/loki
```

Create the `systemd` service for Loki.

```bash
cat <<EOF | sudo tee /etc/systemd/system/loki.service
[Unit]
Description=Grafana Loki
Wants=network-online.target
After=network-online.target

[Service]
User=loki
Group=loki
Type=simple
ExecStart=/usr/local/bin/loki -config.file=/etc/loki/loki-config.yml

[Install]
WantedBy=multi-user.target
EOF
```

Start the Loki service.

```bash
sudo systemctl daemon-reload
sudo systemctl start loki
sudo systemctl enable loki
```

### 3. Install Grafana

Install Grafana from its official repository.

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
```

Start the Grafana server.

```bash
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
```

Open the necessary firewall ports.
```bash
sudo ufw allow 3000/tcp
sudo ufw allow 9090/tcp
sudo ufw allow 3100/tcp
```
Grafana will be available at `http://<your_server_ip>:3000` (default login: `admin`/`admin`).

---

## Part 2: Install and Configure Grafana Alloy

Now, install the Alloy agent to collect data.

### 1. Create Alloy User and Directories

```bash
sudo groupadd --system alloy
sudo useradd -s /sbin/nologin --system -g alloy alloy
sudo usermod -a -G adm alloy

sudo usermod -a -G grafana alloy
sudo usermod -a -G gorse alloy
sudo usermod -a -G typesense alloy

sudo mkdir /etc/alloy
sudo mkdir -p /var/lib/alloy
sudo chown -R alloy:alloy /etc/alloy /var/lib/alloy
```

### 2. Install Grafana Alloy

```bash
sudo apt-get install -y alloy
```

### 3. Configure Grafana Alloy

Create the Alloy configuration file at `/etc/alloy/config.alloy`. This file defines the entire data collection pipeline.

```alloy
# Use https://grafana.github.io/alloy-configurator/

// Define where to send metrics
prometheus.remote_write "to_prometheus" {
  endpoint {
    url = "http://localhost:9090/api/v1/write"
  }
}

// Define where to send logs
loki.write "to_loki" {
  endpoint {
    url = "http://localhost:3100/loki/api/v1/push"
  }
}

// --- METRICS COLLECTION ---

// 1. Host Metrics (replaces Node Exporter)
prometheus.exporter.unix "host" {}

// 2. PostgreSQL Metrics (replaces Postgres Exporter)
prometheus.exporter.postgres "postgres" {
  data_source_names = ["postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable"]
}

// 3. Redis Metrics (replaces Redis Exporter)
prometheus.exporter.redis "redis" {
  redis_addr = "localhost:6379"
}

// Scrape the metrics from the exporters defined above
prometheus.scrape "agent" {
  targets = concat(
    prometheus.exporter.unix.host.targets,
    prometheus.exporter.postgres.postgres.targets,
    prometheus.exporter.redis.redis.targets,
  )
  forward_to = [prometheus.remote_write.to_prometheus.receiver]
}

// --- LOGS COLLECTION ---

// 1. Systemd Journal Logs
loki.source.journal "journal" {
  max_age    = "24h"
  forward_to = [loki.relabel.journal.receiver]
  labels     = {"job" = "systemd-journal"}
}

// Relabel the journal logs to add the 'unit' label
loki.relabel "journal" {
  forward_to = [loki.write.to_loki.receiver]

  rule {
    source_labels = ["__journal__systemd_unit"]
    target_label  = "unit"
  }
}

// 2. /var/log Files
local.file_match "varlogs" {
  path_targets = [{
    "__path__" = "/var/log/**/*.log",
    "__path_exclude__" = "/var/log/lynis.log",
    "job"      = "varlogs",
  }]
}

loki.source.file "varlogs" {
  targets    = local.file_match.varlogs.targets
  forward_to = [loki.write.to_loki.receiver]
}
```

Set ownership and start the service.
```bash
sudo chown -R alloy:alloy /etc/alloy /var/lib/alloy
sudo systemctl daemon-reload
sudo systemctl start alloy
sudo systemctl enable alloy
```
Check its status with `sudo systemctl status alloy`.

---

## Part 3: Configure and Visualize with Grafana

### 1. Configure Grafana Datasources

1.  Log in to Grafana (`http://<your_server_ip>:3000`).
2.  On the left menu, go to **Connections > Add new connection**.
3.  Search for **Prometheus** and select it.
4.  Set the **Prometheus server URL** to `http://localhost:9090`.
5.  Click **Save & test**.
6.  Go back to **Connections** and add another connection.
7.  Search for **Loki**, select it, and set the **Loki server URL** to `http://localhost:3100`.
8.  Click **Save & test**.

### 2. Import Dashboards

1.  On the left menu, go to **Dashboards > Import dashboard**.
2.  Enter a dashboard ID and click **Load**.
3.  Select your Prometheus data source and click **Import**.

Recommended dashboards:

| Service           | Dashboard Name                                         | ID    |
| ----------------- | ------------------------------------------------------ | ----- |
| Host Metrics      | [Node Exporter Full](https://grafana.com/grafana/dashboards/1860) | 1860  |
| PostgreSQL        | [PostgreSQL Database](https://grafana.com/grafana/dashboards/9628) | 9628  |
| Redis             | [Redis Dashboard](https://grafana.com/grafana/dashboards/763) | 763   |

---

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


---

### 4. Explore Logs in Grafana

You can now query and visualize your logs directly in Grafana.

1.  On the left menu, go to the **Drilldown** view > Logs.
2.  At the top, select the **Loki** data source from the dropdown menu.
3.  Click on **Log browser** to see the labels you've configured, such as `job`, `unit`, or `filename`.
4.  Select a label to filter your logs. For example, choose `job="varlogs"` and `filename="/var/log/auth.log"`.
5.  You can write queries using **LogQL**, which is similar to PromQL. For example, to find all failed password attempts from `auth.log`:
    ```logql
    {job="varlogs", filename="/var/log/auth.log"} |= "Failed password"
    ```
6.  You can also now add **Log panels** to your existing dashboards, right alongside your Prometheus metrics, to create a single pane of glass for all your observability data.