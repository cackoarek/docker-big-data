# Docker wraz ze Spark i Hadoop 2.7.1

### Wymagania
1. Należy zainstalować `docker`'a oraz `docker-compose`
> Docker natywnie działa na linuxach.
> Jeśli posiadasz windowsa należy poszukać sposobu na emulowanie dockera na tym systemie

### Uruchamianie:
1. Należy wejść do folderu w którym umieszony jest plik `docker-compose.yml` (folder spark-with-hadoop)
2. Uruchomić dockera: `docker-compose up`

Od tej chwili na dockerze wstanie Hadoop. Jego poprawność będzie widoczna poprzez wystawione serwisy wylistowane poniżej.

Przydatne komendy Dockera:
> `docker-compose build` - buduje obraz dockera

> `docker-compose up` - uruchamia kontener z Hadoopem pokazując logi

> `docker-compose up -d` - j.w. ale zwalnia konsolę

> `docker exec -it hadoop-spark.2.7.1 bash` - wchodzi na uruchomiony kontener

> `docker-compose stop` - zatrzymuje kontner

> `docker-compose down` - usuwa konener z naszego systemu

### Testowanie poprawności działania

Będąc zalogowanym na kontenerze (`docker exec -it hadoop-spark.2.7.1 bash`) można wydać rozkaz:
> `bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'`
spowoduje to odpalenie na Hadoopie zadania MapReduce - zapis będzie na HDFS po wykoniu zadania. Powyższe polecenie zadziała tylko raz gdyż Hadoop nie dopuści do pownownego zapisu wyników na tej samej ścieżce HDFS. Musisz najpierw usunąć poprzednie dane przez kolejną próbą.

### Serwisy wystawione przez dockera

* [http://localhost:8088/cluster](http://localhost:8088/cluster) - All applications
* [http://localhost:50070](http://localhost:50070) - HDFS
* [http://localhost:8042](http://localhost:8042) - Node manager
* [http://localhost:19888](http://localhost:19888) - historyserver

### Współpraca ze Spark

Spark zainstalowany jest w `/usr/local/spark`
Hadoop zainstalowany jest w `/usr/local/hadoop`

Może się zdarzyć, że będą leciały błędy o zbyt małej pamięci na Javę dla kontenerów. Należy wtedy DODAĆ do dwóch plików nieco konfiguracji:

plik: /usr/local/hadoop/etc/hadoop/yarn-site.xml
```
<property>
      <name>yarn.scheduler.maximum-allocation-mb</name>
      <value>8192</value>
</property>
<property>
    <name>yarn.nodemanager.resource.memory-mb</name>
    <value>8192</value>
</property>
<property>
    <name>yarn.nodemanager.vmem-check-enabled</name>
    <value>false</value>
</property>
```

plik: /usr/local/hadoop/etc/hadoop/mapred-site.xml
```
<property>
  <name>mapreduce.map.memory.mb</name>
  <value>3072</value>
</property>
<property>
  <name>mapreduce.reduce.memory.mb</name>
  <value>3072</value>
</property>
<property>
    <name>mapreduce.map.java.opts</name>
    <value>-Xmx3072m</value>
</property>
<property>
    <name>mapreduce.reduce.java.opts</name>
    <value>-Xmx3072m</value>
</property>
```

Sprawdzenie czy działa Spark:

```
/usr/local/spark/bin/spark-submit --deploy-mode client \
     --class org.apache.spark.examples.SparkPi \
     $SPARK_HOME/examples/jars/spark-examples_2.11-2.3.0.jar 10
```

Python:
```
localnie:
/usr/local/spark/bin/spark-submit $SPARK_HOME/examples/src/main/python/pi.py 1000

na yarn:
/usr/local/spark/bin/spark-submit --master yarn $SPARK_HOME/examples/src/main/python/pi.py 1000

```
W logach po uruchomieniu powinien pojawić się adres serwisu prezentującego status wykonania zlecenia. Będzie również widoczne pod adresem: http://localhost:8088/cluster działającą aplikację.

## Znane problemy:
Wchodząc np. na http://localhost:8088/cluster a następnie przy próbie podejrzenia logów worker'a może się zdarzyć, że link będzie zawierał zamiast `localhost` jakiś niezrozumiały link. Przy próbie ręcznej zamiany owego linka na `localhost` strona się otworzy. Najlepiej sobie z tym poradzić wpisując w /etc/hosts naszej maszyny lokalnej ten adres (127.0.0.1      asdf2324sasdf3fs)

## Notatki jakie robiłem podczas konstruowania tego obrazu (dla innych mało ważne)

Podegranie na kontener instalki Sparka
> docker cp spark-2.3.0-bin-hadoop2.7 hadoop.2.7.1:/root/

### Zmienne środowiskowe
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
export SPARK_HOME=/usr/local/spark
export LD_LIBRARY_PATH=/usr/local/hadoop/lib/native

mv $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf

### Instalacja Javy
yum install -y wget
sudo yum install java-1.8.0-openjdk-devel

/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/ <- prawdziwa Java
unlink /usr/java/default
ln -s /usr/lib/jvm/jre-1.8.0-openjdk.x86_64 /usr/java/default

spark-submit --deploy-mode client \
               --class org.apache.spark.examples.SparkPi \
               $SPARK_HOME/examples/jars/spark-examples_2.11-2.3.0.jar 10

### Konfiguracja

yarn-site.xml ->
<property>
      <name>yarn.scheduler.maximum-allocation-mb</name>
      <value>8192</value>
</property>
<property>
    <name>yarn.nodemanager.resource.memory-mb</name>
    <value>8192</value>
</property>
<property>
    <name>yarn.nodemanager.vmem-check-enabled</name>
    <value>false</value>
</property>

mapred-site.xml
<property>
  <name>mapreduce.map.memory.mb</name>
  <value>3072</value>
</property>
<property>
  <name>mapreduce.reduce.memory.mb</name>
  <value>3072</value>
</property>
<property>
    <name>mapreduce.map.java.opts</name>
    <value>-Xmx3072m</value>
</property>
<property>
    <name>mapreduce.reduce.java.opts</name>
    <value>-Xmx3072m</value>
</property>

dodałem też w /conf/spark-defaults.conf -> spark.driver.memory              5g

https://spark.apache.org/docs/latest/submitting-applications.html
Python:
./spark-submit $SPARK_HOME/examples/src/main/python/pi.py 1000
