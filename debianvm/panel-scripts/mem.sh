#!/bin/bash
used=$(free -m | awk '/^Mem:/ {printf "%.1f", $3/1024}')
echo "<txt><span foreground='#4be88a'> MEM </span><span foreground='#e8c04b'>${used}G</span></txt>"
