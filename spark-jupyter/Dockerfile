# https://github.com/jupyter/docker-stacks/tree/master/all-spark-notebook
FROM jupyter/all-spark-notebook

RUN echo $'\nc.NotebookApp.allow_origin = \'*\'' >> /etc/jupyter/jupyter_notebook_config.py

#Hasło: spark
RUN echo $'\nc.NotebookApp.password = u\'sha1:b36148d0939a:dbb7ae719ce3f430062ccb86c8e0544ea6749372\'' >> /etc/jupyter/jupyter_notebook_config.py

