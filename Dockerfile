FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y gcc make binutils gawk x11-utils rpm build-essential libaio1 libaio-dev 
#RUN apt-get install libmotif4
RUN apt-get install -y libtool expat alien ksh pdksh unixODBC unixODBC-dev sysstat elfutils libelf-dev binutils lesstif2 lsb-cxx libstdc++5 wget vim less unzip

RUN ln -sf /bin/bash /bin/sh
RUN ln -s /usr/bin/awk /bin/awk
RUN ln -s /usr/bin/rpm /bin/rpm
RUN ln -s /usr/bin/basename /bin/basename
RUN ln -s /usr/lib/i386-linux-gnu/libpthread_nonshared.a /usr/lib/libpthread_nonshared.a
RUN ln -s /usr/lib/i386-linux-gnu/libc_nonshared.a /usr/lib/libc_nonshared.a
RUN ln -s /lib/i386-linux-gnu/libgcc_s.so.1 /lib/libgcc_s.so.1
RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so.6

RUN addgroup oinstall
RUN addgroup dba
RUN addgroup nobody
RUN usermod -g nobody nobody
RUN useradd -g oinstall -G dba -p password -d /home/oracle -s /bin/bash oracle
RUN mkdir /home/oracle
RUN chown -R oracle:dba /home/oracle

RUN mkdir /etc/rc.d
RUN for i in 0 1 2 3 4 5 6 S; do ln -s /etc/rc$i.d /etc/rc.d/rc$i.d; done

RUN mkdir -p /u01/app/oracle
RUN chown -R oracle:dba /u01


RUN cp /etc/security/limits.conf /etc/security/limits.conf.original
RUN echo "#Oracle 11gR2 shell limits:">>/etc/security/limits.conf
RUN echo "oracle soft nproc 2048">>/etc/security/limits.conf
RUN echo "oracle hard nproc 16384">>/etc/security/limits.conf
RUN echo "oracle soft nofile 1024">>/etc/security/limits.conf
RUN echo "oracle hard nofile 65536">>/etc/security/limits.conf

RUN echo "inventory_loc=ORACLE_BASE/oraInventory" >> /etc/oraInst.loc
RUN echo "inst_group=" >> /etc/oraInst.loc
RUN chmod 777 /etc/oraInst.loc

RUN groupadd dba
RUN useradd nobody

ADD ../oraclezips/database /tmp/oracle/database
ADD db_install.rsp /tmp/db_install.rsp
ADD setKernelParams.sh /tmp/setKernelParams.sh

RUN /tmp/setKernelParams.sh

RUN mv /tmp/oracle/database .
RUN mv /tmp/db_install.rsp .
RUN chmod 777 -R database
RUN chmod 777 db_install.rsp

RUN database/runInstaller -silent -responseFile $PWD/db_install.rsp
RUN /oracle/oracleHome/root.sh

#volumelocation = /oracle/oracleHome
