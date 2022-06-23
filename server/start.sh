#!/bin/bash -ea

target=${1-dev}


if [ $target == "dev" ]; then
  echo "Prolog dev server"
  swipl main.pl --port=8080 --interactive
else
  swipl main.pl --port=8080
  echo "Prolog server daemon started listening on 8080."
fi
