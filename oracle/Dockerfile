FROM mycentos

RUN echo "LETS GO" \
	&& echo "kernel.shmall = 2097152" >> /etc/sysctl.conf \
	&& echo "kernel.shmmax = 536870912" >> /etc/sysctl.conf \
	&& echo "kernel.shmmni = 4096" >> /etc/sysctl.conf \
	&& echo "kernel.sem = 250 32000 100 128" >> /etc/sysctl.conf \
	&& echo "net.ipv4.ip_local_port_range = 9000 65500" >> /etc/sysctl.conf \
	&& /sbin/sysctl -p \
	&& yum install -y binutils-2*x86_64* \
	&& yum install -y glibc-2*x86_64* nss-softokn-freebl-3*x86_64* \
	&& yum install -y glibc-2*i686* nss-softokn-freebl-3*i686* \
	&& yum install -y compat-libstdc++-33*x86_64* \
	&& yum install -y glibc-common-2*x86_64* \
	&& yum install -y glibc-devel-2*x86_64* \
	&& yum install -y glibc-devel-2*i686* \
	&& yum install -y glibc-headers-2*x86_64* \
	&& yum install -y elfutils-libelf-0*x86_64* \
	&& yum install -y elfutils-libelf-devel-0*x86_64* \
	&& yum install -y gcc-4*x86_64* \
	&& yum install -y gcc-c++-4*x86_64* \
	&& yum install -y ksh-*x86_64* \
	&& yum install -y libaio-0*x86_64* \
	&& yum install -y libaio-devel-0*x86_64* \
	&& yum install -y libaio-0*i686* \
	&& yum install -y libaio-devel-0*i686* \
	&& yum install -y libgcc-4*x86_64* \
	&& yum install -y libgcc-4*i686* \
	&& yum install -y libstdc++-4*x86_64* \
	&& yum install -y libstdc++-4*i686* \
	&& yum install -y libstdc++-devel-4*x86_64* \
	&& yum install -y make \
	&& yum install -y numactl-devel-2*x86_64* \
	&& yum install -y compat-libstdc++-33*i686* \
	&& yum install -y compat-libcap* \
	&& yum install -y passwd \
	&& yum install -y expect \
	&& yum install -y vim \

	&& groupadd -g 501 oinstall \
	&& groupadd -g 502 dba \
	&& groupadd -g 503 oper \
	&& groupadd -g 504 asmadmin \
	&& groupadd -g 506 asmdba \
	&& groupadd -g 505 asmoper

RUN echo "LETS TAKE A SHORT BREATH" \
	&& yum install -y libXext \
	&& useradd -u 502 -g oinstall -G dba,asmdba,oper oracle \
	&& echo "root soft nproc unlimited" > /etc/security/limits.d/20-nproc.conf \
	&& echo "* - nproc 16384" >> /etc/security/limits.d/20-nproc.conf \
	&& echo "oracle              soft    nproc   16384" >> /etc/security/limits.conf \
	&& echo "oracle              hard    nproc   16384" >> /etc/security/limits.conf \
	&& echo "oracle              soft    nofile  4096" >> /etc/security/limits.conf \
	&& echo "oracle              soft    stack   10240" >> /etc/security/limits.conf \
	&& echo "oracle              hard    nofile  65536" >> /etc/security/limits.conf.bak \
	&& { echo "osudioadmin"; echo "osudioadmin"; } | passwd oracle \
	&& mkdir -p /oraclehome/app/oracle/product/11.2.0/db_1 \
	&& chown -R oracle:oinstall /oraclehome \
	&& chmod -R 775 /oraclehome

ADD oracleprofile /home/oracle/.bash_profile
RUN chown oracle:oinstall /home/oracle/.bash_profile
ADD db_install.rsp /db_install.rsp

#RUN su oracle -c "/database/runInstaller -silent -responseFile /db_install.rsp"
