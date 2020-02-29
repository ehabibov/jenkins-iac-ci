#!/usr/bin/env bash
docker-compose --verbose -f jenkins.yml down --rmi all
rm -rf volumes