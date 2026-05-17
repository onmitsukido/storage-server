#!/bin/bash

BACKUP_DIR="/home/alexei/projects/storage-server/backups"
CONTAINER="storage-db"
DATE=$(date +%F_%H-%M)
FILE="$BACKUP_DIR/backup_$DATE.sql.gz"

mkdir -p $BACKUP_DIR

docker exec $CONTAINER pg_dump -U admin -d storage_data | gzip > $FILE

echo "Backup created: $FILE"
