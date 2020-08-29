FROM ubuntu:bionic

RUN apt-get install -y --no-install-recommends apt-utils libterm-readline-gnu-perl dialog bind9 chrony

# Enable IPv4
#RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9

RUN mkdir -m 777 /var/log/bind/ && touch /var/log/bind/error.log 

# Indicamos que este contenedor se comunica por el puerto 53/tcp
EXPOSE 53/tcp 53/udp 123/tcp 123/udp

# Copy configuration files
COPY named.conf* /etc/bind/
COPY chrony.conf /etc/chrony/

# Start service 

CMD service bind9 start && tail -F /var/log/bind/error.log 
