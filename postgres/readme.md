# Postgres with pgadmin4

To start use in terminal
```shell script
docker-compose up -d
```

### Access to *pgadmin4* via browser:
```text
http://localhost:5050
``` 

### Login to pgadmin
login/password: admin/admin

### Connection to database in pgadmn

To connect pgadmin with postgres
1. Add new server
1. Put any name
1. In connection section:
   1. **Host**: postgres
   1. **Port**: 5432
   1. **Login**: admin
   1. **Password**: admin
   
Connect. Enjoy!