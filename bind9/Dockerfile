FROM ubuntu:bionic

RUN apt-get install -y dialog bind9 ntp

RUN mkdir -m 777 /var/log/bind/ && touch /var/log/bind/error.log && echo exit 0 > /usr/sbin/policy-rc.d

# Indicamos que este contenedor se comunica por el puerto 53/tcp
EXPOSE 53/tcp 53/udp 123/tcp 123/udp

# Copy configuration files
COPY named.conf* /etc/bind/

# Start service 

CMD service bind9 start && tail -F /var/log/bind/error.log 
CMD ["/usr/sbin/ntpd", "-n"]
