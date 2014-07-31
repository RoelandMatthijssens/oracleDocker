#! /bin/bash

sudo docker run -d -p 1521:1521 --volume="/u01/app/oracle/oradata:/tmp/databases" --name=oracledb mycentos
