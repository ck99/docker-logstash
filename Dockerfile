FROM ck99/java:0.0.2
MAINTAINER Ciaran Kelly <ciaran.kelly@gmail.com>

ENV LOGSTASH_VERSION 1.4.2

RUN $HOME/docker-tools/unpack-remote-tarball-to \
    https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz \
    /logstash

# install optional plugins
RUN cd /logstash && bin/plugin install contrib

ADD config/logstash.conf /logstash/logstash.conf

RUN mkdir /etc/service/logstash
ADD config/service.sh /etc/service/logstash/run
RUN chmod 755 /etc/service/logstash/run
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
EXPOSE 5000
EXPOSE 3333

