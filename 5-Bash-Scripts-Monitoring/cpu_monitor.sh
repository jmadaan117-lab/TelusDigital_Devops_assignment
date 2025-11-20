#!/bin/bash
if [ "$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)" -ge 80 ]; then
    echo "$(date): High CPU Usage detected"
else
    echo "$(date): CPU Usage is normal"
fi
