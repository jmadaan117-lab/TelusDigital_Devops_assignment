#!/bin/bash
echo "----- $(date) Starting log cleanup check -----" >> "/var/log/log_cleanup.log"

for file in /var/log/jyoti/*.log; do
    [ -e "$file" ] || continue

    SIZE_MB=$(du -m "$file" | awk '{print $1}')

    if [ "$SIZE_MB" -ge 100 ]; then
        echo "$(date): $file size ${SIZE_MB}MB exceeded threshold 100MB" >> "/var/log/log_cleanup.log"
        gzip "$file"
        echo "$(date): Compressed $file to $file.gz" >> "/var/log/log_cleanup.log"
        touch "$file"
        echo "$(date): Created new empty log file: $file" >> "/var/log/log_cleanup.log"
    else
        echo "$(date): $file within size limit (${SIZE_MB}MB)" >> "/var/log/log_cleanup.log"
    fi
done

