#!/bin/sh -e

curl -H "Content-Type: application/json" --data '{"docker_tag": "master"}' -X POST $AUTOMATED_BUILD_TRIGGER_URL
