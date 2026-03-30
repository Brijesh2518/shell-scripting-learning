#!/bin/bash

LOG_FILE="system_health.log"

echo "===== System Health Report ====="
echo "Date: $(date)"
echo "--------------------------------"

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_INT=${CPU%.*}

echo "CPU Usage: $CPU%"

if [ "$CPU_INT" -gt 80 ]; then
    echo -e "\e[31m⚠️ High CPU Usage!\e[0m"
fi

# Memory Usage
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
MEM_INT=${MEM%.*}

echo "Memory Usage: $MEM%"

if [ "$MEM_INT" -gt 80 ]; then
    echo -e "\e[31m⚠️ High Memory Usage!\e[0m"
fi

# Disk Usage
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Disk Usage: $DISK%"

if [ "$DISK" -gt 80 ]; then
    echo -e "\e[31m⚠️ Disk Almost Full!\e[0m"
fi

# Top 5 Processes by CPU
echo ""
echo "Top 5 CPU Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

# Save to log
echo "Report saved to $LOG_FILE"
echo "--------------------------------" >> $LOG_FILE
date >> $LOG_FILE
echo "CPU: $CPU%" >> $LOG_FILE
echo "Memory: $MEM%" >> $LOG_FILE
echo "Disk: $DISK%" >> $LOG_FILE
echo "" >> $LOG_FILE
