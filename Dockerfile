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

#RUN echo "#">> /etc/sysctl.conf
#RUN echo "# Oracle 11gR2 entries">> /etc/sysctl.conf
#RUN echo "fs.aio-max-nr=1048576" >> /etc/sysctl.conf
#RUN echo "fs.file-max=6815744" >> /etc/sysctl.conf
#RUN echo "kernel.shmall=2097152" >> /etc/sysctl.conf
#RUN echo "kernel.shmmni=4096" >> /etc/sysctl.conf
#RUN echo "kernel.sem=250 32000 100 128" >> /etc/sysctl.conf
#RUN echo "net.ipv4.ip_local_port_range=9000 65500" >> /etc/sysctl.conf
#RUN echo "net.core.rmem_default=262144" >> /etc/sysctl.conf
#RUN echo "net.core.rmem_max=4194304" >> /etc/sysctl.conf
#RUN echo "net.core.wmem_default=262144" >> /etc/sysctl.conf
#RUN echo "net.core.wmem_max=1048586" >> /etc/sysctl.conf
#RUN echo "kernel.shmmax=1073741824" >> /etc/sysctl.conf

#RUN sysctl -p

RUN cp /etc/security/limits.conf /etc/security/limits.conf.original
RUN echo "#Oracle 11gR2 shell limits:">>/etc/security/limits.conf
RUN echo "oracle soft nproc 2048">>/etc/security/limits.conf
RUN echo "oracle hard nproc 16384">>/etc/security/limits.conf
RUN echo "oracle soft nofile 1024">>/etc/security/limits.conf
RUN echo "oracle hard nofile 65536">>/etc/security/limits.conf

ADD linux_11gR2_database_1of2.zip /tmp/oraceleZip1.zip
ADD linux_11gR2_database_2of2.zip /tmp/oraceleZip2.zip

RUN unzip /tmp/oraceleZip1.zip -d /home/oracle
RUN unzip /tmp/oraceleZip2.zip -d /home/oracle

RUN chmod 777 -R database
#runuser -l oracle -c "/home/oracle/database/runInstaller -ignoreSysPrereqs"
