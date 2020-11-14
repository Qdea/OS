#!/bin/bash
for pid in $(ps -A -o pid | tail -n +2)
do
memamount=$(grep -E -h -s -i "VmSize" /proc/$pid/status | grep -o "[0-9]\+")
if [[ -z $memamount ]]
then memamount=0
else echo $pid ":" $memamount
fi
done | sort --key=2 -V | tail -n 1 > out6.txt
echo "----------------------" >> out6.txt
top -b -o +VIRT | head -n 8 | tail -n 2 >> out6.txt
