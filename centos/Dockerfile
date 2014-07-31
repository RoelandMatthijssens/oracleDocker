FROM centos

#ADD installPackages.sh /tmp/installPackages.sh
#RUN chmod +x /tmp/installPackages.sh
#RUN /tmp/installPackages.sh
#
#ADD setKernelParams.sh /tmp/setKernelParams.sh
#RUN chmod +x /tmp/setKernelParams.sh
#RUN /tmp/setKernelParams.sh
#
#
#RUN echo "inventory_loc=ORACLE_BASE/oraInventory" >> /etc/oraInst.loc
#RUN echo "inst_group=" >> /etc/oraInst.loc
#RUN chmod 777 /etc/oraInst.loc
#
ADD database /tmp/oracle/database
ADD db_install.rsp /tmp/db_install.rsp

RUN mv /tmp/oracle/database .
RUN mv /tmp/db_install.rsp .
RUN chmod 777 -R database
RUN chmod 777 db_install.rsp

#RUN database/runInstaller -silent -responseFile $PWD/db_install.rsp
#RUN /oracle/oracleHome/root.sh


#volumelocation = /oracle/oracleHome
