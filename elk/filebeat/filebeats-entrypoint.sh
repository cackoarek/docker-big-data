#!/usr/bin/env bash
set -xe

# If user don't provide any command
# Run filebeat

exec /usr/share/filebeat/filebeat -e -c /usr/share/filebeat/filebeat.yml