#!/bin/sh

HOST_IP="vagrant.dev"

# our metrics collector
docker run -d -p 25826:25826/udp -p 8081:8080 -p 22 lopter/collectd-graphite

# our log friends
docker run -d -p 9200:9200 -p 9300:9300 arcus/elasticsearch
docker run -d -e ES_HOST=$HOST_IP -e ES_PORT=9300 -p 514:514 arcus/logstash
docker run -d -e ES_HOST=$HOST_IP -e ES_PORT=9200 -p 80:80 arcus/kibana

# mysql data container
db=$(docker run --name mysql_data -v /var/lib/mysql busybox)

# our own services
docker run -d -p 2222:22 -e COLLECTD_HOST=$HOST_IP -e LOGSTASH_HOST=$HOST_IP -p 3306:3306 --volumes-from mysql_data morriz/mysql
docker run -d -p 2223:22 -e COLLECTD_HOST=$HOST_IP -e LOGSTASH_HOST=$HOST_IP \
  -e JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8998" \
  -p 8080:8080 -p 8443:8443 -p 8998:8998 morriz/tomcat