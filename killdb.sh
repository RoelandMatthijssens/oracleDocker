#! /bin/bash

sudo docker stop oracledb > /dev/null
sudo docker rm oracledb > /dev/null
echo "db stopped"
