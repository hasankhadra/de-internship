# Task 2 - MySQL source connector with Kafka

_Provectus-Internship, 2021_

In this project, we created a MySQL source connector to table `user` with Kafka.

## Table of contents
1. [ Description ](#struct)
2. [ Installation and Running ](#install)
---
<a name="struct"></a>
### 1. Description
We first installed the MySQL source connector in Kafka in 
[Dockerfile](https://github.com/hasankhadra/de-internship/blob/issue%239/kafka/docker/kafka-connect/Dockerfile).
Then, we added the configuration for the MySQL source connector in the file 
[mysql-source-logging-user.json](https://github.com/hasankhadra/de-internship/blob/issue%239/kafka/connectors/source/mysql-source-logging-user.json).
After we installed and configured the connector, let's add some code in the initializing script 
[]() which will create the table `user` with the following columns `(id bigint, firstname varchar(10), lastname varchar(10), age integer)` and insert the following rows:
```
(1, 'hasan', 'khadra', 20),
(2, 'kamil', 'sabbagh', 21),
(3, 'mohammad', 'shahin', 21)
```
<a name="install"></a>
### 2. Installation and Running

#### Prerequisites
* Linux/Unix-like OS  (x86 architecture)
* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [docker-compose](https://docs.docker.com/compose/) or just enable _**Docker Compose v2**_
* [jq](https://stedolan.github.io/jq/download/) for pretty formatting of JSON
* Fork this Github repository

### Deployment
* Build Docker images using `docker-compose`
```shell
docker-compose build
```

* Deploy services in detached mode (background) 
```shell
docker-compose up -d
```
* To check the progress of deployment, please use the following:
```shell
docker-compose ps
```

#### Kafka Connect
* Validate status of deployed connectors by running the following command:
```shell
curl -XGET "http://localhost:8083/connectors?expand=status" | jq
```

#### ksqlDB
* Once you deploy services, connect to ksqldb-cli
```shell
docker-compose exec ksqldb ksql http://ksqldb:8088
```
* Make sure that you established connection with ksqlDB server and see the following **Server Status: RUNNING**
```text
CLI v0.22.0, Server v0.22.0 located at http://ksqldb:8088
Server Status: RUNNING
```
* By default, the ksqlDB is configured to consume messages from the latest offset. So, you need to run the following command to 
get messages from the beginning
```shell
SET 'auto.offset.reset'='earliest';
```

#### Checking results
* Now you can go to http://localhost:8080/ and check the topic `logging.user` and see the messages. We'll notice 3 new messages which refer to the 3 added rows to our `user` table.


#### Stopping 
* To stop services use `down` command
```shell
docker-compose down
```
