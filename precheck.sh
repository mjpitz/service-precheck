#!/usr/bin/env bash

for service in "$@"; do
    echo "[${service}] checking for a dns entry"

    until nslookup ${service}; do
        echo "[${service}] waiting..."
        sleep 2
    done
done
