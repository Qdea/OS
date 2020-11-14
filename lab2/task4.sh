#!/bin/bash
for i in $(ls /proc/ | grep "[0-9]\+")
do
sum_exec_runtime=$(cat /proc/$i/sched 2>/dev/null | grep "sum_exec_runtime" | awk '{print $3}')
nr_switches=$(cat /proc/$i/sched 2>/dev/null | grep "nr_switches" | awk '{print $3}')
ppid="$(cat /proc/$i/status 2>/dev/null | grep "PPid" | awk '{print $2}')"
if [[ -z $ppid ]]
then ppid=0
fi
if [[ -z $sum_exec_runtime || -z $nr_switches ]]
then ART=0
else ART=$( echo "scale=5; $sum_exec_runtime/$nr_switches" | bc)
fi
result="$i $ppid $ART"
echo "$result"
done | sort -n -k 2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3""}' > out4.txt
