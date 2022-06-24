#!/bin/bash -ea

target=${1-dev}
port=9663


if [ $target == "dev" ]; then
  echo "Prolog dev server"
  swipl main.pl --port=$port --interactive
else
  swipl main.pl --port=$port
  echo "Prolog server daemon started listening on $port."
fi
