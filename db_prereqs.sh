#!/bin/bash
psql -U postgres -d testdb -c "CREATE user root"
psql -U postgres -d testdb -c "create database root"
psql -U postgres -d testdb -c "ALTER USER root SUPERUSER CREATEDB;"
psql -U postgres -d testdb -c "CREATE TABLE account(   user_id serial PRIMARY KEY,   username VARCHAR (50) UNIQUE NOT NULL, password VARCHAR (50) NOT NULL,   email VARCHAR (355) UNIQUE NOT NULL, created_on TIMESTAMP NOT NULL, last_login TIMESTAMP);"
echo "Done........."