#!/bin/bash

apk add --update curl

curl 'http://admin:admin@localhost:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"Prometheus","type":"prometheus","url":"http://prometheus:9090","access":"proxy","isDefault":true}'



    echo "Creating dashboards"
    curl -v -H 'Content-Type: application/json' -d overview-dash.json http://localhost:3000/api/dashboards/db
    curl -v -H 'Content-Type: application/json' -d @/detail-dash.json http://localhost:3000/api/dashboards/db
