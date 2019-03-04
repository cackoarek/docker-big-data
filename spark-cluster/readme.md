scala:
docker run -it --net spark_network anchormen/spark /opt/spark/bin/spark-shell --master spark://master:7077

python:
docker run -it --net spark_network anchormen/spark /opt/spark/bin/pyspark --master spark://master:7077

URLs:
http://localhost:8080/
http://localhost:4040/
