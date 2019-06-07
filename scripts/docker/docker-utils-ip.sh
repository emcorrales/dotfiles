#!/bin/bash
# Show the ip address of the container.
container="$1"

docker inspect -f "{{ .NetworkSettings.IPAddress }}" ${container}
