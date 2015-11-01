#!/bin/sh
docker rm -f node1
docker rm -f node2

rm -rf /docker_volume/mongo/db/rs1/*
rm -rf /docker_volume/mongo/db/rs2/*
rm -rf /docker_volume/mongo/log/*

mkdir -p /docker_volume/mongo/db/rs1
mkdir -p /docker_volume/mongo/db/rs2
mkdir -p /docker_volume/mongo/log

touch /docker_volume/mongo/log/rs1.log
touch /docker_volume/mongo/log/rs2.log

chmod -R 777 /docker_volume/mongo

docker run -d --restart=always --name node1 -p 27017:27017 -v /docker_volume/mongo/db/rs1:/data/db -v /docker_volume/mongo/log:/data/log mongo --logpath /data/log/rs1.log --oplogSize 100 --replSet rs --journal
docker run -d --restart=always --name node2 -p 27018:27017 -v /docker_volume/mongo/db/rs2:/data/db -v /docker_volume/mongo/log:/data/log mongo --logpath /data/log/rs2.log --oplogSize 100 --replSet rs --journal
