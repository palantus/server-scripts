#!/bin/bash
#
# creates backups of essential files
#

if [ "$HOSTNAME" != "xdk9r3i7" ]; then
    printf "\nWrong server! This is made for server 2...\n"
    exit;
fi

DATA="/home/ahk/certificates /root"
CONFIG="/etc"

set $(date)
tar cfz "/home/ahk/backup/data/server2_data_full_$6-$2-$3.tgz" $DATA
tar cfz "/home/ahk/backup/config/server2_config_full_$6-$2-$3.tgz" $CONFIG

#
# create sql dump of databases:
mysqldump -u root --password=6exp2d67p66rDFGD --opt Owncloud > "/home/ahk/backup/database/Owncloud_$6-$2-$3.sql"
mysqldump -u root --password=6exp2d67p66rDFGD --opt roundcube > "/home/ahk/backup/database/roundcube_$6-$2-$3.sql"
gzip "/home/ahk/backup/database/Owncloud_$6-$2-$3.sql"
gzip "/home/ahk/backup/database/roundcube_$6-$2-$3.sql"
rm "/home/ahk/backup/database/*.sql"

rm "/home/ahk/backup/current/*"
cp "/home/ahk/backup/data/server2_data_full_$6-$2-$3.tgz" "/home/ahk/backup/current"
cp "/home/ahk/backup/config/server2_config_full_$6-$2-$3.tgz" "/home/ahk/backup/current"
cp "/home/ahk/backup/database/Owncloud_$6-$2-$3.sql.gz" "/home/ahk/backup/current"
cp "/home/ahk/backup/database/roundcube_$6-$2-$3.sql.gz" "/home/ahk/backup/current"

tar -zcvf "/home/ahk/backup/server2_complete_$6-$2-$3.tar.gz" "/home/ahk/backup/current"
