STATE=/tmp/.genmon_cpu
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
if [ -f "$STATE" ]; then
  read ptotal pidle < "$STATE"
  dt=$((total-ptotal)); di=$((idle-pidle))
  [ "$dt" -gt 0 ] && usage=$(( 100*(dt-di)/dt )) || usage=0
else
  usage=0
fi
echo "$total $idle" > "$STATE"
echo "<txt><span foreground='#4be88a'> CPU </span><span foreground='#e8c04b'>${usage}%</span></txt>"
