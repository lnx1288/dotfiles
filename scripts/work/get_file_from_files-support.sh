#! /bin/sh -

while getopts n:f: o; do
  case $o in
    (f) FILE=$OPTARG;;
    (n) CASENUMBER=$OPTARG
  esac
done

cd ~

if [ ! -d  ~/case-$CASENUMBER ]
then
    mkdir ~/case-$CASENUMBER
fi

echo "Downloading '$FILE' from Case '$CASENUMBER'"

sftp -i ~/.ssh/id_rsa $GIT_WORK_EMAIL@files.support.canonical.com:/customers/Ericsson/$CASENUMBER/$FILE ~/case-$CASENUMBER/
