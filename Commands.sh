# Docker
docker volume create postgres_vol_1
docker volume create postgres_vol_2
docker volume create clickhouse_vol

docker network create app_net

# Postgres
docker run --rm -d \
  --name postgres_1 \
  -e POSTGRES_PASSWORD=postgres_admin \
  -e POSTGRES_USER=postgres_admin \
  -e POSTGRES_DB=test_app \
  -v postgres_vol_1:/var/lib/postgresql/data \
  --net=app_net \
  postgres:14

# Superset
docker run -d --rm --net=app_net -p 80:8088 --name superset apache/superset

docker exec -it superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin
              
docker exec -it superset superset db upgrade
docker exec -it superset superset init

# ClickHouse
docker run --rm -d \
  --name clickhouse \
  --net=app_net \
  -v clickhouse_vol:/var/lib/clickhouse \
  yandex/clickhouse-server

# Superset-clickhouse
docker exec superset pip install clickhouse-sqlalchemy
docker restart superset
