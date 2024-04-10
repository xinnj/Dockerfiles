#!/bin/sh
set -e

kubectl exec -i --tty=false deploy/gitea -c gitea -- bash << EOF
set -e

cd /backup-data/
gitea manager flush-queues -c /data/gitea/conf/app.ini
gitea dump -c /data/gitea/conf/app.ini --tempdir /backup-data/ --type tar.gz

echo "Keep last ${KEEP_LAST_NUMBER} backups"
ls -l
ls -r *.zip | tail -n +$((KEEP_LAST_NUMBER + 1)) | xargs -I {} echo "Delete {}" && rm -f {}
EOF