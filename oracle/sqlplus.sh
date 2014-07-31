#! /bin/bash
sudo docker rm sqlclient > /dev/null
sudo docker run -i -t --rm --name=sqlclient --net="container:oracledb"\
	--env='ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe'\
	--env='PATH=$ORACLE_HOME:$ORACLE_HOME/bin:$PATH'\
	--env='ORACLE_SID=XE'\
	wnameless/oracle-xe-11g /u01/app/oracle/product/11.2.0/xe/bin/sqlplus\
	"system/oracle@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=localhost)(Port=1521))(CONNECT_DATA=(SID=xe)))"
