#!/usr/bin/env bash

TARGET=$1
BACKUP=$2
DATE=$(date +%Y%m%d)

# we need to make sure that there is a directory we can put the tar file in
# if the directory is already made this line does not do anything
mkdir -p "$BACKUP"

# go into the directory from target and create a tar.gz backup
tar -czf "logs-$DATE.tar.gz" "$TARGET"

# move the backup into the correct backup directory
mv "logs-$DATE.tar.gz" "$BACKUP"

# in the backup directory find all tar.gz files older than 3 days and delete them
find "$BACKUP" -type f -name "*.tar.gz" -mtime +3 -delete
