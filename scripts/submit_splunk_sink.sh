#!/bin/bash

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "SPLUNKSINK",
  "config": {
    "confluent.topic.bootstrap.servers": "broker:29092",
    "name": "CISCO_ASA",
    "connector.class": "com.splunk.kafka.connect.SplunkSinkConnector",
    "tasks.max": "1",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
    "value.converter": "org.apache.kafka.connect.storage.StringConverter",
    "topics": "CISCO_ASA",
    "splunk.hec.token": "ef16f05f-40e0-4108-a644-5323e02aaa44",
    "splunk.hec.uri": "https://splunk:8088",
    "splunk.hec.ssl.validate.certs": "false",
    "splunk.hec.json.event.formatted": "true"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
