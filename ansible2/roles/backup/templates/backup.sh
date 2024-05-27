#!/bin/bash

USER="{{ mysql_user }}"
PASSWORD="{{ mysql_password }}"
DATABASE="{{ mysql_database }}"
BACKUP_DIR="{{ backup_dir }}"

mkdir -p $BACKUP_DIR

BACKUP_FILE="$BACKUP_DIR/$DATABASE-$(date +%F-%H-%M-%S).sql"

mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_FILE

