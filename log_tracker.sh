#!/bin/bash

# Log file to monitor
LOG_FILE="/var/log/syslog"   # Ubuntu/Debian
# LOG_FILE="/var/log/messages"  # RHEL/CentOS (uncomment if needed)

echo "Tracking logs from: $LOG_FILE"
echo "Press CTRL + C to stop..."
echo "-----------------------------------"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file does not exist!"
    exit 1
fi

# Track logs in real-time
tail -f $LOG_FILE | while read line
do
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $line"

    # Example: Alert if "error" found
    if echo "$line" | grep -i "error" > /dev/null
    then
        echo "⚠️ ERROR detected in logs!"
    fi
done

