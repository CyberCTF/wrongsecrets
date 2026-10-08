#!/bin/sh
# WrongSecrets runs with the Docker (without-vault) profile: the home page lists the challenges,
# and the health endpoint reports UP.
set -u
get() { curl -sS --max-time 20 "$1" 2>/dev/null; }
get http://wrongsecrets:8080/ | grep -qi "wrongsecrets" || { echo "home page"; exit 1; }
get http://wrongsecrets:8080/actuator/health | grep -q '"UP"' || { echo "health"; exit 1; }
echo "WrongSecrets answers and reports UP"
