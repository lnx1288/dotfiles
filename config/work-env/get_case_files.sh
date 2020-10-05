#! /bin/bash

while getopts f:n:c: o; do
  case $o in
    (f) FILE=$OPTARG;;
    (n) CASENUMBER=$OPTARG;;
    (c) CUSTOMER=$OPTARG;;
  esac
done

if [[ -z "$CASENUMBER" || -z "$CUSTOMER" ]];
then
  echo "A case number and customer name must be entered using the '-n' and '-c' flags (e.g., -c 002989078 -n SomeCustomer)"
else
  cd ~

  if [ ! -d  ~/case-$CASENUMBER ]
  then
    mkdir ~/case-$CASENUMBER
  fi

  if [ ! -z "$FILE" ]
  then
    echo "Downloading '$FILE' from Case '$CASENUMBER'"
    sftp -i ~/.ssh/id_rsa $GIT_WORK_EMAIL@files.support.canonical.com:/customers/Ericsson/$CASENUMBER/$FILE ~/case-$CASENUMBER/
  else
    echo "Downloading ALL files from Case '$CASENUMBER'"
    sftp -i ~/.ssh/id_rsa $GIT_WORK_EMAIL@files.support.canonical.com:/customers/$CUSTOMER/$CASENUMBER/* ~/case-$CASENUMBER/
  fi

  cd ~/case-$CASENUMBER

  for f in $(ls | grep xz$) ; do
    tar xJf $f
    rm $f
  done
fi
