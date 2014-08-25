#! /bin/sh
#exec /sbin/setuser www-data /usr/sbin/apachectl -DFOREGROUND >>/var/log/apache2.log 2>&1
exec /logstash/bin/logstash -f /logstash/logstash.conf #>>/var/log/logstash.log 2>&1

