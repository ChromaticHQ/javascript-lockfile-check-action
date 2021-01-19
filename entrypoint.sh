#!/bin/sh

# Fail the job if there are any failures below.
set -e

# Function that sets GH Action output and exits w/non-zero code.
emit_error()
{
  # Our action uses the lockfile-check-result set below as part of its output.
  # See `outputs` in the action.yml file in this repo.
  # Ref: https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-commands-for-github-actions#setting-an-output-parameter
  echo "::set-output name=lockfile-check-result::failure" && exit 1
}

# Change to the working directory (default is `./`).
cd "$2"

if [ "$1" = "npm" ]; then
  test -f "package-lock.json" || (echo "Error! Expected a package-lock.json file but none was found." && emit_error)
  test ! -f "yarn.lock" || (echo "Error! Extraneous yarn.lock file was found." && emit_error)
  echo "::set-output name=lockfile-check-result::success"
elif [ "$1" = "yarn" ]; then
  test -f "yarn.lock" || (echo "Error! Expected a yarn.lock file but none was found." && emit_error)
  test ! -f "package-lock.json" || (echo "Error! Extraneous package-lock.json file was found." && emit_error)
  echo "::set-output name=lockfile-check-result::success"
else
  echo "Error! Unknown package manager type: $1" 1>&2 && emit_error
fi
