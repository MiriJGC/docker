FROM centos/systemd
ENV container dns_server
ENV http_proxy " "
ENV https_proxy " "
RUN yum -y install bind; yum clean all; systemctl enable named
STOPSIGNAL SIGRTMIN+3
EXPOSE 53/tcp 53/udp
COPY named.conf* /etc/
COPY named.ca /var/named/

choose:
v3: CMD ["/usr/sbin/named", "-c", "/etc/named.conf"]
v2: CMD [ "/sbin/init" ]

