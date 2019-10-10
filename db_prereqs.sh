POSTGRES_HOST=$1
POSTGRES_HOST=$2

psql -h $POSTGRES_HOST -U $POSTGRES_USER -c "CREATE user root
psql -h $POSTGRES_HOST -U $POSTGRES_USER -c "create database root"
psql -h $POSTGRES_HOST -U $POSTGRES_USER -c "ALTER USER root SUPERUSER CREATEDB;"
psql -h $POSTGRES_HOST -U $POSTGRES_USER -c "create extension if not exists pgtap;"
