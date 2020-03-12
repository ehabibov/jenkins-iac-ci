#!/usr/bin/env bash
docker-compose -f jenkins.yml down --rmi all
rm -rf ./volumes