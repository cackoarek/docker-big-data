# Spark-Jupyter

Jest to kontener zawierający Jupyter'a z zainstalowanymi językami, które są używane w Spark:
* Scala
* Python
* R

Dla Python preinstalowane są już biblioteki: `pyspark, pandas, matplotlib, scipy, seaborn, scikit-learn`

Dla R: `ggplot2, rcurl`

## Używanie
Wejść do katalagu w którym znajduje się `docker-compose.yml` a następnie wywołać komendę:
> docker-compose up

Wyciagnięcie z dockera całego tree Jupytera:
> docker cp <nazwa_kontenera>:/home/jovyan/* .

Kopiowanie z localhost na Jupytera:
> docker cp <file> <nazwa_kontenera>:/home/jovyan/

## Dokumentacja
Dostępna tutaj:
> https://github.com/jupyter/docker-stacks/tree/master/all-spark-notebook

### Plik konfiguracyjny Jupyter
> /etc/jupyter/jupyter_notebook_config.py