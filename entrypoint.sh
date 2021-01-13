#!/usr/bin/env bash

# Fail the job if there are any failures below.
set -e

if [ "$1" == "npm" ]; then
  test -f "package-lock.json" || (echo "Error! Expected a package-lock.json file but none was found." && exit 1)
  test ! -f "yarn.lock" || (echo "Error! Extraneous yarn.lock file was found." && exit 1)
elif [ "$1" == "yarn" ]; then
  test -f "yarn.lock" || (echo "Error! Expected a yarn.lock file but none was found." && exit 1)
  test ! -f "package-lock.json" || (echo "Error! Extraneous package-lock.json file was found." && exit 1)
else
  echo "Error! Unknown package manager type: $1" 1>&2 && exit 1
fi
