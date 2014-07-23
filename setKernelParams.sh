mount -o remount rw /proc/sys

RUN echo "#">> /etc/sysctl.conf
RUN echo "# Oracle 11gR2 entries">> /etc/sysctl.conf
RUN echo "fs.aio-max-nr=1048576" >> /etc/sysctl.conf
RUN echo "fs.file-max=6815744" >> /etc/sysctl.conf
RUN echo "kernel.shmall=2097152" >> /etc/sysctl.conf
RUN echo "kernel.shmmni=4096" >> /etc/sysctl.conf
RUN echo "kernel.sem=250 32000 100 128" >> /etc/sysctl.conf
RUN echo "net.ipv4.ip_local_port_range=9000 65500" >> /etc/sysctl.conf
RUN echo "net.core.rmem_default=262144" >> /etc/sysctl.conf
RUN echo "net.core.rmem_max=4194304" >> /etc/sysctl.conf
RUN echo "net.core.wmem_default=262144" >> /etc/sysctl.conf
RUN echo "net.core.wmem_max=1048586" >> /etc/sysctl.conf
RUN echo "kernel.shmmax=1073741824" >> /etc/sysctl.conf

sysctl -p
