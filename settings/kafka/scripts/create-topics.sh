# some pause to let kafka start
sleep 60
xargs --max-args 1 --no-run-if-empty --arg-file=/root/topic-list /opt/kafka_2.12-2.6.0/bin/kafka-topics.sh --create --bootstrap-server=localhost:9092 --topic