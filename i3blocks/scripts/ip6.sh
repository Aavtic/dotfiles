#!/bin/bash
ip -6 addr show | awk '/inet6/ && !/fe80/ {print $2}' | cut -d/ -f1 | head -n 1
