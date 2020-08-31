#! /bin/sh -

while getopts n:f: o; do
  case $o in
    (f) file=$OPTARG;;
    (n) casenumber=$OPTARG
  esac
done

cd ~

if [ ! -d  ~/case-$casenumber ]
then
    mkdir ~/case-$casenumber
fi

echo "Downloading '$file' from Case '$casenumber'"

sftp -i ~/.ssh/id_rsa alejandro.santoyo@canonical.com@files.support.canonical.com:/customers/Ericsson/$casenumber/$file /home/ubuntu/case-$casenumber/
