#!/bin/bash

echo "************************************************************"
echo "Setting up users..."
echo "************************************************************"

# create root user
nohup gosu mongodb mongo testdb --eval "db.createUser({user: 'admin', pwd: 'admin', roles:[{ role: 'root', db: 'testdb' }, { role: 'read', db: 'local' }]});"

# create app user/database
nohup gosu mongodb mongo --eval 'db.createUser({user: "vijay", pwd: "vijay", roles:[{ role: "userAdminAnyDatabase", db: "admin"}]})'


echo "************************************************************"
echo "Shutting down"
echo "************************************************************"
nohup gosu mongodb mongo admin --eval "db.shutdownServer();"
