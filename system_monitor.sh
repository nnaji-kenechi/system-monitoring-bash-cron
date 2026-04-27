#!/bin/bash

# ============================================
#   System Monitor Script
#   Author: Kelz
#   Description: Collects system info and
#   appends it to a log file every 3 minutes
#   via cron job.
# ============================================

LOG_FILE="$HOME/kc-cron-assignment.log"

# Separator for readability
echo "========================================" >> "$LOG_FILE"

# 1. Date and Time
echo "Timestamp     : $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"

# 2. Logged-in User
echo "Logged-in User: $(whoami)" >> "$LOG_FILE"

# 3. Server IP Address
echo "Server IP     : $(hostname -I | awk '{print $1}')" >> "$LOG_FILE"

# 4. Disk Usage
echo "Disk Usage    :" >> "$LOG_FILE"
df -h --output=source,size,used,avail,pcent | grep -v tmpfs >> "$LOG_FILE"

# 5. Memory Usage
echo "Memory Usage  :" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

echo "========================================" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
