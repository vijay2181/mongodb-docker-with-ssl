# Mongodb-Docker-Container-with-ssl

## Steps

>The files which are present in 'ssl' folder are empty name files

Create

* ca.pem
* mongodb.pem 

files from the below repo and place those two files in 'ssl' folder

(for this step go to this [repo](https://github.com/vijay2181/mongodb-pem-files))

once pem files are validated then use below commands


```bash
docker build -t mongo:latest .
```

```bash
docker run -d --name vijay-mongo-ssl -p 27017 mongo:latest
```

```bash
docker logs -f vijay-mongo-ssl
```

```bash
docker exec -it vijay-mongo-ssl bash
```

```bash
mongo --host 127.0.0.1:27017 --ssl --sslCAFile /home/mongodb/ssl/ca.pem --sslPEMKeyFile /home/mongodb/ssl/mongodb.pem -u vijay -p --authenticationDatabase test
```

>The _id of the user you created is test.dios. It means you created the user in the test database in "setup_user.sh". However you try to authenticate using the –authenticationDatabase admin. If you want to use this user you have to specify –authenticationDatabase test. We usually create the user in the admin database. You have to issue the command use admin before db.createUser(…)
