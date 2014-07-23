mount -o remount -rw /proc/sys

cp /etc/security/limits.conf /etc/security/limits.conf.original
echo "#Oracle 11gR2 shell limits:">>/etc/security/limits.conf
echo "oracle soft nproc 2048">>/etc/security/limits.conf
echo "oracle hard nproc 16384">>/etc/security/limits.conf
echo "oracle soft nofile 1024">>/etc/security/limits.conf
echo "oracle hard nofile 65536">>/etc/security/limits.conf

ln -sf /bin/bash /bin/sh
ln -s /usr/bin/awk /bin/awk
ln -s /usr/bin/rpm /bin/rpm
ln -s /usr/bin/basename /bin/basename
ln -s /usr/lib/i386-linux-gnu/libpthread_nonshared.a /usr/lib/libpthread_nonshared.a
ln -s /usr/lib/i386-linux-gnu/libc_nonshared.a /usr/lib/libc_nonshared.a
ln -s /lib/i386-linux-gnu/libgcc_s.so.1 /lib/libgcc_s.so.1
ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so.6

echo "#">> /etc/sysctl.conf
echo "# Oracle 11gR2 entries">> /etc/sysctl.conf
echo "fs.aio-max-nr=1048576" >> /etc/sysctl.conf
echo "fs.file-max=6815744" >> /etc/sysctl.conf
echo "kernel.shmall=2097152" >> /etc/sysctl.conf
echo "kernel.shmmni=4096" >> /etc/sysctl.conf
echo "kernel.sem=250 32000 100 128" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range=9000 65500" >> /etc/sysctl.conf
echo "net.core.rmem_default=262144" >> /etc/sysctl.conf
echo "net.core.rmem_max=4194304" >> /etc/sysctl.conf
echo "net.core.wmem_default=262144" >> /etc/sysctl.conf
echo "net.core.wmem_max=1048586" >> /etc/sysctl.conf
echo "kernel.shmmax=1073741824" >> /etc/sysctl.conf

sysctl -p
