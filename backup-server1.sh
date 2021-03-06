#!/bin/bash
#
# creates backups of essential files
#

if [ "$HOSTNAME" != "pytm7re3" ]; then
    printf "\nWrong server! This is made for server 1...\n"
    exit;
fi

DATA="/home/ahk/certificates /root /home/ahk/prod2 /home/ahk/Mail /home/anders/Mail"
CONFIG="/etc"

set $(date)
tar cfz "/home/ahk/backup/data/server2_data_full_$6-$2-$3.tgz" $DATA
tar cfz "/home/ahk/backup/config/server2_config_full_$6-$2-$3.tgz" $CONFIG

rm /home/ahk/backup/current/*
cp "/home/ahk/backup/data/server2_data_full_$6-$2-$3.tgz" "/home/ahk/backup/current"
cp "/home/ahk/backup/config/server2_config_full_$6-$2-$3.tgz" "/home/ahk/backup/current"

tar -zcvf "/home/ahk/backup/server1_complete_$6-$2-$3.tar.gz" "/home/ahk/backup/current"

/usr/local/bin/aws s3 cp "/home/ahk/backup/server1_complete_$6-$2-$3.tar.gz" s3://dk.ahkpro.backup.webserver
