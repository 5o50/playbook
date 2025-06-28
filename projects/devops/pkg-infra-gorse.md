# Gorse

https://github.com/kyegomez/Tiktokx

https://gorse.io/

## Install

This guide shows how to install Gorse and run it as a systemd service with a dedicated user.

### 1. Download Gorse Binary

```bash
sudo useradd --system --no-create-home -d /var/lib/gorse -s /bin/false gorse
```

```bash
wget https://github.com/gorse-io/gorse/releases/latest/download/gorse_linux_amd64.zip
unzip gorse_linux_amd64.zip -d gorse_linux_amd64
sudo mv gorse_linux_amd64/* /usr/local/bin/
sudo chown gorse:gorse /usr/local/bin/gorse*
rm -rf gorse_linux_amd64 gorse_linux_amd64.zip
```

### 3. Create Directories and Set Permissions

Create directories for Gorse's configuration, data, and logs, and set the correct ownership.

```bash
sudo mkdir -p /etc/gorse /var/log/gorse /var/lib/gorse
sudo chown -R gorse:gorse /etc/gorse /var/log/gorse /var/lib/gorse
```

### 4. Create Configuration File (Optional) (CHECK END OF THIS FILE)

You can specify configuration via a TOML file. While `gorse-in-one` can run with defaults, a configuration file is recommended for production.

```bash
sudo touch /etc/gorse/config.toml
sudo chown gorse:gorse /etc/gorse/config.toml
```

You should edit `/etc/gorse/config.toml` to match your needs. Refer to the [Gorse configuration documentation](https://gorse.io/docs/master/config/config.html).

### 5. Create systemd Service File

Create a systemd unit file to manage the Gorse service.

Create `/etc/systemd/system/gorse.service` with your editor, for example:
`sudo nano /etc/systemd/system/gorse.service`

And add the following content:

```ini
[Unit]
Description=Gorse, an open source recommender system service written in Go.
After=network.target

[Service]
User=gorse
Group=gorse
Type=simple
Restart=always
ExecStart=/usr/local/bin/gorse-in-one -c /etc/gorse/config.toml \
--log-path /var/log/gorse/gorse.log \
--cache-path /var/lib/gorse/gorse.data

[Install]
WantedBy=multi-user.target
```

### 6. Start and Enable Gorse Service

Reload the systemd daemon, then enable and start the Gorse service.

```bash
sudo systemctl daemon-reload
sudo systemctl enable gorse.service
sudo systemctl start gorse.service
```

You can check the service status with:

```bash
sudo systemctl status gorse.service
```



```toml
# /etc/gorse/config.toml
[database]

# The database for caching, support Redis, MySQL, Postgres and MongoDB:
#   redis://<user>:<password>@<host>:<port>/<db_number>
#   rediss://<user>:<password>@<host>:<port>/<db_number>
#   redis+cluster://<user>:<password>@<host1>:<port1>,<host2>:<port2>,...,<hostN>:<portN>
#   postgres://bob:secret@1.2.3.4:5432/mydb?sslmode=verify-full
#   postgresql://bob:secret@1.2.3.4:5432/mydb?sslmode=verify-full
#   mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
#   mongodb+srv://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
cache_store = "redis://localhost:6379/0"

# The database for persist data, support MySQL, Postgres, ClickHouse and MongoDB:
#   mysql://[username[:password]@][protocol[(address)]]/dbname[?param1=value1&...&paramN=valueN]
#   postgres://bob:secret@1.2.3.4:5432/mydb?sslmode=verify-full
#   postgresql://bob:secret@1.2.3.4:5432/mydb?sslmode=verify-full
#   clickhouse://user:password@host[:port]/database?param1=value1&...&paramN=valueN
#   chhttp://user:password@host[:port]/database?param1=value1&...&paramN=valueN
#   chhttps://user:password@host[:port]/database?param1=value1&...&paramN=valueN
#   mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
#   mongodb+srv://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
#data_store = "mysql://gorse:gorse_pass@tcp(localhost:3306)/gorse"
data_store = "postgres://postgres:postgres@127.0.0.1:5432/gorse"

# The naming prefix for tables (collections, keys) in databases. The default value is empty.
table_prefix = ""

# The naming prefix for tables (collections, keys) in cache storage databases. The default value is `table_prefix`.
cache_table_prefix = ""

# The naming prefix for tables (collections, keys) in data storage databases. The default value is `table_prefix`.
data_table_prefix = ""

[master]

# GRPC port of the master node. The default value is 8086.
port = 8086

# gRPC host of the master node. The default values is "0.0.0.0".
host = "0.0.0.0"

# HTTP port of the master node. The default values is 8088.
http_port = 8088

# HTTP host of the master node. The default values is "0.0.0.0".
http_host = "0.0.0.0"

# AllowedDomains is a list of allowed values for Http Origin.
# The list may contain the special wildcard string ".*" ; all is allowed
# If empty all are allowed.
http_cors_domains = []

# AllowedMethods is either empty or has a list of http methods names. Checking is case-insensitive.
http_cors_methods = []

# Number of working jobs in the master node. The default value is 1.
n_jobs = 1

# Meta information timeout. The default value is 10s.
meta_timeout = "10s"

# Username for the master node dashboard.
dashboard_user_name = "gorse"

# Password for the master node dashboard.
dashboard_password = "gorse"

# Secret key for admin APIs (SSL required).
admin_api_key = ""

[server]

# Default number of returned items. The default value is 10.
default_n = 10

# Secret key for RESTful APIs (SSL required).
api_key = ""

# Clock error in the cluster. The default value is 5s.
clock_error = "5s"

# Insert new users while inserting feedback. The default value is true.
auto_insert_user = true

# Insert new items while inserting feedback. The default value is true.
auto_insert_item = true

# Server-side cache expire time. The default value is 10s.
cache_expire = "10s"

[recommend]

# The cache size for recommended/popular/latest items. The default value is 10.
cache_size = 500

# Recommended cache expire time. The default value is 72h.
cache_expire = "24h"

[recommend.data_source]

# The feedback types for positive events.
positive_feedback_types = ["like", "share", "watch_complete", "comment", "save"]

# The feedback types for read events.
read_feedback_types = ["watch_start", "view", "impression"]

# The time-to-live (days) of positive feedback, 0 means disabled. The default value is 0.
positive_feedback_ttl = 0

# The time-to-live (days) of items, 0 means disabled. The default value is 0.
item_ttl = 180

[recommend.popular]

# The time window of popular items. The default values is 4320h.
popular_window = "720h"

[recommend.user_neighbors]

# The type of neighbors for users. There are three types:
#   similar: Neighbors are found by number of common labels.
#   related: Neighbors are found by number of common liked items.
#   auto: If a user have labels, neighbors are found by number of common labels.
#         If this user have no labels, neighbors are found by number of common liked items.
# The default value is "auto".
neighbor_type = "similar"

# Enable approximate user neighbor searching using vector index. The default value is true.
enable_index = true

# Minimal recall for approximate user neighbor searching. The default value is 0.8.
index_recall = 0.8

# Maximal number of fit epochs for approximate user neighbor searching vector index. The default value is 3.
index_fit_epoch = 3

[recommend.item_neighbors]

# The type of neighbors for items. There are three types:
#   similar: Neighbors are found by number of common labels.
#   related: Neighbors are found by number of common users.
#   auto: If a item have labels, neighbors are found by number of common labels.
#         If this item have no labels, neighbors are found by number of common users.
# The default value is "auto".
neighbor_type = "similar"

# Enable approximate item neighbor searching using vector index. The default value is true.
enable_index = true

# Minimal recall for approximate item neighbor searching. The default value is 0.8.
index_recall = 0.8

# Maximal number of fit epochs for approximate item neighbor searching vector index. The default value is 3.
index_fit_epoch = 3

[recommend.collaborative]

# Enable approximate collaborative filtering recommend using vector index. The default value is true.
enable_index = true

# Minimal recall for approximate collaborative filtering recommend. The default value is 0.9.
index_recall = 0.9

# Maximal number of fit epochs for approximate collaborative filtering recommend vector index. The default value is 3.
index_fit_epoch = 3

# The time period for model fitting. The default value is "60m".
model_fit_period = "30m"

# The time period for model searching. The default value is "360m".
model_search_period = "180m"

# The number of epochs for model searching. The default value is 100.
model_search_epoch = 150

# The number of trials for model searching. The default value is 10.
model_search_trials = 15

# Enable searching models of different sizes, which consume more memory. The default value is false.
enable_model_size_search = false

[recommend.replacement]

# Replace historical items back to recommendations. The default value is false.
enable_replacement = false

# Decay the weights of replaced items from positive feedbacks. The default value is 0.8.
positive_replacement_decay = 0.8

# Decay the weights of replaced items from read feedbacks. The default value is 0.6.
read_replacement_decay = 0.6

[recommend.offline]

# The time period to check recommendation for users. The default values is 1m.
check_recommend_period = "30s"

# The time period to refresh recommendation for inactive users. The default values is 120h.
refresh_recommend_period = "12h"

# Enable latest recommendation during offline recommendation. The default value is false.
enable_latest_recommend = true

# Enable popular recommendation during offline recommendation. The default value is false.
enable_popular_recommend = true

# Enable user-based similarity recommendation during offline recommendation. The default value is false.
enable_user_based_recommend = true

# Enable item-based similarity recommendation during offline recommendation. The default value is false.
enable_item_based_recommend = false

# Enable collaborative filtering recommendation during offline recommendation. The default value is true.
enable_collaborative_recommend = true

# Enable click-though rate prediction during offline recommendation. Otherwise, results from multi-way recommendation
# would be merged randomly. The default value is false.
enable_click_through_prediction = true

# The explore recommendation method is used to inject popular items or latest items into recommended result:
#   popular: Recommend popular items to cold-start users.
#   latest: Recommend latest items to cold-start users.
# The default values is { popular = 0.0, latest = 0.0 }.
explore_recommend = { popular = 0.2, latest = 0.3 }

[recommend.online]

# The fallback recommendation method is used when cached recommendation drained out:
#   item_based: Recommend similar items to cold-start users.
#   popular: Recommend popular items to cold-start users.
#   latest: Recommend latest items to cold-start users.
# Recommenders are used in order. The default values is ["latest"].
fallback_recommend = ["item_based", "latest"]

# The number of feedback used in fallback item-based similar recommendation. The default values is 10.
num_feedback_fallback_item_based = 10

[tracing]

# Enable tracing for REST APIs. The default value is false.
enable_tracing = false

# The type of tracing exporters should be one of "jaeger", "zipkin", "otlp" and "otlphttp". The default value is "jaeger".
exporter = "jaeger"

# The endpoint of tracing collector.
collector_endpoint = "http://localhost:14268/api/traces"

# The type of tracing sampler should be one of "always", "never" and "ratio". The default value is "always".
sampler = "always"

# The ratio of ratio based sampler. The default value is 1.
ratio = 1
```