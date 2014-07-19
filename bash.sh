#! /bin/bash

sudo docker run -i -t --rm --name=bash --net="container:oracledb" --volumes-from="oracledb" wnameless/oracle-xe-11g /bin/bash
