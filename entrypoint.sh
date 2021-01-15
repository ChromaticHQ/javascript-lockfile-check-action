#!/bin/sh

# Fail the job if there are any failures below.
set -e

if [ "$1" = "npm" ]; then
  test -f "package-lock.json" || (echo "Error! Expected a package-lock.json file but none was found." && echo "::set-output name=lockfile-check-result::failure" && exit 1)
  test ! -f "yarn.lock" || (echo "Error! Extraneous yarn.lock file was found." && echo "::set-output name=lockfile-check-result::failure" && exit 1)
  echo "::set-output name=lockfile-check-result::success"
elif [ "$1" = "yarn" ]; then
  test -f "yarn.lock" || (echo "Error! Expected a yarn.lock file but none was found." && echo "::set-output name=lockfile-check-result::failure" && exit 1)
  test ! -f "package-lock.json" || (echo "Error! Extraneous package-lock.json file was found." && echo "::set-output name=lockfile-check-result::failure" && exit 1)
  echo "::set-output name=lockfile-check-result::success"
else
  echo "Error! Unknown package manager type: $1" 1>&2 && echo "::set-output name=lockfile-check-result::failure" && exit 1
fi
