addgroup oinstall
addgroup dba
addgroup nobody
usermod -g nobody nobody
useradd -g oinstall -G dba -p password -d /home/oracle -s /bin/bash oracle
mkdir /home/oracle
chown -R oracle:dba /home/oracle

mkdir /etc/rc.d
for i in 0 1 2 3 4 5 6 S; do ln -s /etc/rc$i.d /etc/rc.d/rc$i.d; done

mkdir -p /u01/app/oracle
chown -R oracle:dba /u01


