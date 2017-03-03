#!/bin/bash
echo "--Start"
for d in */; do

  echo "Checking $d"
  cd $d
  # Check if the current directory is a git directory
  if git rev-parse --git-dir > /dev/null 2>&1
    then
    OLDREMOTE="$(git config --get remote.origin.url)"

    if [[ $OLDREMOTE == http*bitbucket.org/vizucom* ]]
      then
      # Strip everything until /vizucom
      OLDSUFFIX=${OLDREMOTE#*/vizucom}
      # Replace the beginning
      NEWREMOTE="git@bitbucket.org:vizucom${OLDSUFFIX}"
      git remote set-url origin ${NEWREMOTE}
      echo "-Updated remote to:" ${NEWREMOTE}
      echo "-Old remote was:   " ${OLDREMOTE}

    elif [[ $OLDREMOTE == http*github.com/Vizucom* ]]
      then
        OLDSUFFIX=${OLDREMOTE#*/Vizucom}
        NEWREMOTE="git@github.com:Vizucom${OLDSUFFIX}"
        git remote set-url origin ${NEWREMOTE}
        echo "-Updated remote to:" ${NEWREMOTE}
        echo "-Old remote was:   " ${OLDREMOTE}
    else
        if [[ $OLDREMOTE != *vizucom* ]] && [[ $OLDREMOTE != *Vizucom* ]]
        then
          echo "-Not a Vizucom Github/Bitbucket repository"
        else
          echo "-Already using SSH authentication"
        fi

    fi
  else
    echo "-Not a git repository"
  fi
  echo ""
  cd ..
done

echo "--Done."
