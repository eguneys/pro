#!/bin/bash -ea

target=${1-dev}


if [ $target == "dev" ]; then
  echo "Prolog dev server"
  swipl main.pl --port=3000 --interactive
else
  swipl main.pl --port=3000
  echo "Prolog server daemon started listening on 3000."
fi
