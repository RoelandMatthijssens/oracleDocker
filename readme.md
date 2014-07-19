Install docker

```
$ sudo docker pull wnameless/oracle-xe-11g
$ sudo docker run -d -p 1521:1521 --name=oracledb wnameless/oracle-xe-11g
```

now you should have a oracle db deamon running, listening on the default port (1521)

To inspect the database either run your sqlclient.
```
$ sudo docker run -i -t --rm --name=sqlclient --net="container:oracledb" wnameless/oracle-xe-11g /u01/app/oracle/product/11.2.0/xe/bin/sqlplus
```
