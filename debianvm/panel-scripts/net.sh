IF=ens33
STATE=/tmp/.genmon_net
r=$(cat /sys/class/net/$IF/statistics/rx_bytes 2>/dev/null || echo 0)
t=$(cat /sys/class/net/$IF/statistics/tx_bytes 2>/dev/null || echo 0)
now=$(date +%s)
if [ -f "$STATE" ]; then
  read pr pt pnow < "$STATE"
  dtime=$((now-pnow)); [ "$dtime" -lt 1 ] && dtime=1
  rx=$(( (r-pr)/1024/dtime )); tx=$(( (t-pt)/1024/dtime ))
else
  rx=0; tx=0
fi
echo "$r $t $now" > "$STATE"
echo "<txt><span foreground='#4be88a'> NET </span><span foreground='#7dffb0'>↓${rx}K</span> <span foreground='#e8c04b'>↑${tx}K</span></txt>"
