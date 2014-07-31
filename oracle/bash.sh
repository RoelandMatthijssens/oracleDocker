#! /bin/bash

sudo docker run -i -t --rm --name=bash --net="container:oracledb" --volumes-from="oracledb" myCentos /bin/bash
