#!/bin/bash
if [ "$(free | awk '/Mem:/ {print $3 * 100 / $2}' | cut -d. -f1)" -ge 80 ]; then
    echo "$(date): High Memory Usage detected"
else
    echo "$(date): Memory usage is normal"
fi
