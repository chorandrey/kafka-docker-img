# kafka-docker-img

Kafka and zookeeper image for running in a single container for development purposes.

Build image:
  docker build -t kafkatest:1 .

Run image:
  docker run -d -p 9092:9092 -p 2181:2181 --rm kafkatest:1


