FROM qnib/alpn-jre8 

COPY TIB_ems_8.4.1_linux_x86_64.zip ./

RUN unzip /TIB_ems_8.4.1_linux_x86_64.zip

RUN sh /TIB_ems_8.4.1_linux_x86_64/TIBCOUniversalInstaller-lnx-x86-64.bin -silent

RUN rm -R /TIB_ems_8.4.1_linux_x86_64

RUN chmod -R 775 /home

EXPOSE 7222

ENTRYPOINT ["sh", "/opt/tibco/ems/8.4/bin//tibemsd.sh", "-config", "/home/user/tibco/cfgmgmt/ems/data/tibemsd.conf"]
