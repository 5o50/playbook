# Redis: https://github.com/redis/redis/releases - https://redis.io/about/releases/
current stable:7.0.15

# Installation
https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/apt/


redis-server --version
redis-cli --version

/etc/redis/redis.conf
requirepass your_very_strong_password

redis-cli --rdb backup.rdb
scp /path/to/dump.rdb user@destination:/path/to/backup/

redis-cli

PING
INFO
CONFIG GET dir

SET key value
GET key
DEL key
EXISTS key
RENAME old new

KEYS pattern
SCAN cursor match pattern COUNT count
RANDOMKEY
EXPIRE key seconds
TTL key

INCR key increment
DECR key decrement

HSET hash field value
HGETALL hash

SADD set member
SMEMBERS set