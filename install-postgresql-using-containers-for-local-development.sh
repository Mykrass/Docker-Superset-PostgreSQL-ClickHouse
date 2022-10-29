# https://www.perrygeo.com/dont-install-postgresql-using-containers-for-local-development.html

mkdir mnt_data
mkdir pgdata

# run-postgres.sh
set -e
HOST_PORT=5432
NAME=postgres-dev
DOCKER_REPO=postgres
TAG=14.1

docker run --rm --name $NAME \
  --volume `pwd`/pgdata:/var/lib/pgsql/data \
  --volume `pwd`/mnt_data:/mnt/data \
  --volume `pwd`/pg_hba.conf:/etc/postgresql/pg_hba.conf \
  --volume `pwd`/postgresql.conf:/etc/postgresql/postgresql.conf \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_USER=postgres \
  -e PGDATA=/var/lib/pgsql/data/pgdata14 \
  -e POSTGRES_INITDB_ARGS="--data-checksums --encoding=UTF8" \
  -e POSTGRES_DB=db \
  -p 6432:5432 \
  ${DOCKER_REPO}:${TAG} \
  postgres \
    -c 'config_file=/etc/postgresql/postgresql.conf' \
    -c 'hba_file=/etc/postgresql/pg_hba.conf'