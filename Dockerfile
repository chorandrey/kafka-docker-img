FROM java:openjdk-8-jre

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.6.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

RUN apt-get update -y || exit 0
RUN apt-get install -y wget supervisor dnsutils && apt-get clean && wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

ADD settings/supervisor/kafka.conf settings/supervisor/zookeeper.conf /etc/supervisor/conf.d/
ADD settings/kafka/server.properties settings/kafka/zookeeper.properties /opt/kafka_2.12-2.6.0/config/

EXPOSE 2181 9092
CMD ["/usr/bin/supervisord", "-n"]


