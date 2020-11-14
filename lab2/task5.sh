#!/bin/bash
average_ART=0
count=0
ART_sum=0
ppid=0
while read line
do
new_ppid=$(echo $line | awk -F" : " '{print $2}' | awk -F= '{print $NF}')
if [[ "$new_ppid" -eq "$ppid" ]]
then
count=$((count + 1))
else
average_ART=$(echo "scale=4; $ART_sum/$count" | bc)
count=1
ART_sum=0
echo "-Average_Sleeping_Children_Of_ParentID=$ppid is $average_ART" >> out5.txt
ppid=$new_ppid
fi
echo $line >> out5.txt
ART=$(echo $line | awk -F" : " '{print $NF}' | awk -F= '{print $NF}')
ART_sum=$(echo "scale=4; $ART_sum+$ART" | bc)
done < out4.txt
echo "-Average_Sleeping_Children_Of_ParentID=$ppid is $average_ART" >> out5.txt
