docker volume create postgres_vol_1
docker volume create postgres_vol_2
docker volume create clickhouse_vol

docker network create app_net

docker run --rm -d \
  --name postgres_1 \
  -e POSTGRES_PASSWORD=postgres_admin \
  -e POSGRES_USER=postgres_admin \
  -e POSGRES_DB=test_app \
  -v postgres_vol_1:/var/lib/postgresql/data \
  --net=app_net \
  postgres:14
