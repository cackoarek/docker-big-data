ELK
===
Wymagania
---
* Java 8+
* Installed docker
* Installed docker-compose

Pozostała konfiguracja
----------------------
(Opcjonalne) Jeśli chcesz aby dane w Elasticsearch nie były trzymane na kontenerze a na twojej maszynie lokalnej należy
odkomentować w sekcji `volume` elasticsearch pliku `docker-compose.yml` finikję:
> ~/elk-dir/data:/usr/share/elasticsearch/data:rw

A następnie wykonać:
> In user's home directory should exist `~/elk-dir/data` folder which has to be owned by elasticsearch user.
> It can be done by executing `chown -R 1000:1000 ~/elk-dir/data`
> `~/elk-dir/data` folder is used by default. It can be changed in `docker-compose.yml` file under
`services.elasticsearch.volumes` property.

## Użycie

Będąc w terminalu w folderze `elk` można wykonać następujące polecenia:
```
docker-compose build    - zbudowanie kontenerów
docker-compose up       - uruchomienie kontenerów (widać logi)
docker-compose up -d    - j.w ale wraca do terminala i nie widać logów
docker-compose stop     - zatrzymanie kontenerów
docker-compose down     - usunięcie konenerów
docker-compose down --rmi 'all' - j.w ale usuwa również obrazy
```
Example commands:
```
docker logs elasticsearch | less    - logi z kontenera
docker exec -it elasticsearch  - wejście na kontener
```

Po uruchomieniu dockerów dostępne serwisy:
* [http://localhost:9200/](http://localhost:9200/) - Elasticsearch
* [http://localhost:5601/](http://localhost:5601/) - Kibana

## Kafka
Aby używać Kafki - należy odkomentować 2 kontenery: Kafka i Zookeeper. Uruchomić wedle instrukcji powyżej.

## Pozostałe kontenery

* Elastalert - oprogramowanie cyklicznie odpytujące Elasticsearch i wykonujące zaprogramowane akcje
* Logstash - oprogramowanie ułatwiające przetwarzanie logów, które potem trafiają do Elasticsearch
* Filebeat - kolejny produkt z ekosystemu ELK - potrafi obserwować katalogi i wrzucać przytost np. na Logstash