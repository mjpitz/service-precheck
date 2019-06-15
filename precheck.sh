#!/usr/bin/env bash

## eventually support something like "<protocol>://<service_address>?sleep=<sleep>&attempts=<attempts>"

for service in "$@"; do
    echo "[${service}] checking for a dns entry"

    until nslookup ${service}; do
        echo "[${service}] waiting..."
        sleep 2
    done
done
