FROM opensciencegrid/software-base:fresh

RUN yum -y install cronie && \
    yum -y install supervisor && \
    yum -y install glideinwms-vofrontend-standalone && \
    yum -y install vim

RUN mkdir -p /var/log/supervisor

ADD frontends_supervisor_startup.sh /usr/local/sbin/osg
ADD 10-gwms-fe.conf /etc/supervisord.d/
ADD image-config.d/* /etc/osg-frontends/image-config.d/

CMD ["sh" , "-c" , "/usr/local/sbin/osg/frontends_supervisor_startup.sh"] 
