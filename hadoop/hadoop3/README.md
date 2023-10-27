## Założenia

1. Posiadamy zainstalowanego Docker w swoim systemie
2. Posiadamy dostęp do komendy docker-compose (na Windows instalowany wraz z dockerem, na linux należy doinstalować oddzielnie)

## Uruchamianie

Będąc w terminalu (linux) (lub powershell w windows) w katalogu w którym znajdują się pliki `config` i `docker-compose.yml` należy wykonać komendę:
```shell
docker-compose up -d
```

Spowoduje to ściągnięcie obrazów Hadoopa i uruchomienie instancji Hadoop z HDFS i MapReduce

## Używanie

Sprawdzenie czy wszystkie obrazy są uruchomione:

```shell
docker ps
```

przykładowy output:

```text
b723d5e36a54   apache/hadoop:3   "/usr/local/bin/dumb…"   5 seconds ago   Up 4 seconds                                               hadoop3_datanode_1
03c7d6192985   apache/hadoop:3   "/usr/local/bin/dumb…"   5 seconds ago   Up 4 seconds   0.0.0.0:9870->9870/tcp, :::9870->9870/tcp   hadoop3_namenode_1
f70bb1ffb4bb   apache/hadoop:3   "/usr/local/bin/dumb…"   5 seconds ago   Up 4 seconds   0.0.0.0:8088->8088/tcp, :::8088->8088/tcp   hadoop3_resourcemanager_1
5fe7a18b7e68   apache/hadoop:3   "/usr/local/bin/dumb…"   5 seconds ago   Up 4 seconds                                               hadoop3_nodemanager_1
```

Wejście na jakikolwiek kontener:

```shell
docker exec -it hadoop3_resourcemanager_1 bash
```

Zatrzymanie Hadoop:

```shell
docker-compose stop
```

Usunięcie obrazów Hadoopa (posprzątanie):

```shell
docker-compose down
```


