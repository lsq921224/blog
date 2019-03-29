#!/bin/bash

DEPLOYMENT_DIR="/home/services/blog"

if [[ -d ${DEPLOYMENT_DIR} ]]; then
    rm -rf ${DEPLOYMENT_DIR}
fi
