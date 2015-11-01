#!/bin/bash
if [ -f /resource/setup.js ] 
then
	mongod --fork --logpath=/data/db/mongologs.log --replSet rs
	sleep 5
	mongo --shell /resource/setup.js
	sleep 2
	mongoimport -d meteor -c ip2country /resource/ip2country_fixture.txt
	mongod --shutdown
	rm /resource/setup.js
	rm /resource/ip2country_fixture.txt
fi
mongod --replSet rs