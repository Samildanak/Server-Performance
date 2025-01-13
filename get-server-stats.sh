#!/bin/bash
# Get CPU Usage
cpu_used=$(top -n 1 | awk '/Cpu/ {printf("%.1f", $2)}')
echo "CPU Usage : $cpu_used%"
# Get Total Memory usage
memory_used=$(free -h | awk '/Mem:/ {printf("%s", $3)}')
memory_free=$(free -h | awk '/Mem:/ {printf("%s", $4)}')
memory_free_percent=$(free | awk '/Mem:/ {printf("%2.f", $4/$2 * 100)}')
echo "Total memory used : $memory_used"
echo "Total memory free : $memory_free"
echo "Percent of memory available : $memory_free_percent%"
# Get Total disk Usage
disk_free=$(df --total -h | awk '/total/ {printf("%s", $4)}')
disk_used=$(df --total -h | awk '/total/ {printf("%s", $3)}')
disk_used_percent=$(df --total -h | awk '/total/ {printf("%s", $5)}')
echo "Total disk available : $disk_free"
echo "Total disk used : $disk_used"
echo "Disk utilization in percent : $disk_used_percent"
# Get Top 5 processes by CPU Usage
echo "Top 5 processes by CPU Usage"
top -b -o %CPU -n 1 | grep -A5 "PID"

# Get Top 5 processes by memory Usage
echo "Top 5 processes by memory Usage"
top -b -o %MEM -n 1 | grep -A5 "PID"
