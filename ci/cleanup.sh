#!/usr/bin/env bash
docker-compose -f jenkins.yml down --rmi all
docker volume prune -f
rm -rf ./volumes