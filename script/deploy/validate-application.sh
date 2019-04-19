#!/bin/bash

function check_status {
  response=$(curl --max-time 15 --write-out %{http_code} --silent --output /dev/null http://localhost:80/health_check)

  if [[ "$response" -eq "200" ]]; then
    echo "deployment valid"
    exit 0
  fi
}

for i in {1..3}
do
  check_status
  sleep 5s
done

echo "Could not get a successful status response, deployment is invalid!"
exit 1
