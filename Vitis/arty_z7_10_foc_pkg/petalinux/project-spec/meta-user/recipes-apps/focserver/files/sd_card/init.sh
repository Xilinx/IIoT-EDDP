#! /bin/sh

# Sample initialization file.
# Lines starting with '#' are comments.
# Remove the #-sign from the lines you want to be executed.
# This by default just starts the FOC server application.

echo "++ init.sh running..."

#echo "++ Copying the configuration file"
#cp -av /mnt/focserver.conf /etc

echo "++ Starting FOC"
nohup /usr/bin/focserver >& /tmp/focserver-log.txt &

