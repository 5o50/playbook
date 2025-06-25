# PostgreSQL: https://www.postgresql.org/support/versioning/
stable: 17.5 (Ubuntu 17.5-1.pgdg24.04+1)

**List installed PostgreSQL packages**
dpkg --get-selections | grep postgres

**List running clusters**
pg_lsclusters

[Install](https://wiki.postgresql.org/wiki/Apt)
```
sudo apt update
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt update
sudo apt install postgresql-17

# check version
psql --version

# check status
sudo systemctl status postgresql

## change password
sudo -u postgres psql
\password postgres


```

Extensions to install
- https://github.com/pksunkara/pgx_ulid
```
curl -OL https://github.com/pksunkara/pgx_ulid/releases/download/v0.2.0/pgx_ulid-v0.2.0-pg17-amd64-linux-gnu.deb
sudo apt install ./pgx_ulid-v0.2.0-pg17-amd64-linux-gnu.deb
```


sudo -u postgres psql

sudo -u postgres pg_dumpall > dump.sql
psql -U postgres -f dump.sql

ALTER USER postgres with encrypted password 'postgres';

ALTER DATABASE old_dbname RENAME TO new_dbname;

DROP DATABASE database_name;


SHOW server_version;
\l // list databases
\c name // connect to database
\dt // list tables
\d // describe table
\du // list users
\dn // list schemas
\df // list functions
\s // show search path
\q // quit

\! clear // list files

CREATE DATABASE name;

sudo systemctl restart postgresql.service