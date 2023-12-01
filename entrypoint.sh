#!/bin/bash

required_variables=("BW_CLIENTID" "BW_CLIENTSECRET" "BW_PASSWORD")

for var in "${required_variables[@]}"; do
    if [[ -z "${!var}" ]]; then
        echo "Error: $var is not defined. Please set all required environment variables."
        exit 1
    fi
done

set -e

if [[ -n "${BW_HOST}" ]]; then
    bw config server "${BW_HOST}"
fi

bw login --apikey --raw

export BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)

bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection
