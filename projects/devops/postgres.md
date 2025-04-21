# PostgreSQL: https://www.postgresql.org/support/versioning/
active LTS: 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

sudo apt install postgresql
sudo service postgresql status

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