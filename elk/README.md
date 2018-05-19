ELK DOCKER ENV
===
Requirements
---
* Java 8+
* Installed docker
* Installed docker-compose

Prerequisites
---
In user's home directory should exist `~/elk-dir/data` folder which has to be owned by elasticsearch user.

It can be done by executing `chown -R 1000:1000 ~/elk-dir/data`

`~/elk-dir/data` folder is used by default. It can be changed in `docker-compose.yml` file under
`services.elasticsearch.volumes` property.

## Usage

In elk directory:
```
docker-compose build    - zbudowanie kontenerów
docker-compose up -d    - uruchomienie kontenerów
docker-compose stop     - zatrzymanie kontenerów
docker-compose down     - usunięcie konenerów
docker-compose down --rmi 'all' - j.w ale usuwa również obrazy
```
Example commands:
```
docker logs elk_logstash_1 | less    - logi z kontenera
docker exec -it elk_logstash_1 bash  - wejście na kontener
```