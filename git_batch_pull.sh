#!/bin/bash
echo "--Start"

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'

for d in */; do

  printf "${NOCOLOR}Checking $d..."
  cd $d
  # Check if the current directory is a git directory
  if git rev-parse --git-dir > /dev/null 2>&1
    then
      # Get the output message (combined stdout and stderr) and status code
      PULL_OUTPUT="$(git pull 2>&1)"
      PULL_STATUS=$?
      if [[ $PULL_STATUS == 1 ]]
        then
        printf "${RED} ERROR - "
      else
        printf "${GREEN} OK - "
      fi
      printf "${PULL_OUTPUT}"
  else
    printf "${YELLOW} SKIPPED -not a git repository"
  fi
  echo ""
  cd ..
done
printf "${NOCOLOR}"
echo "--Done."
