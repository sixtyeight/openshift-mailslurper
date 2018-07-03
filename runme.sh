#!/bin/sh

mkdir /tmp/mailslurper && cd /tmp/mailslurper
cp /app/mailslurper .
cp /config/config.json .

./mailslurper
