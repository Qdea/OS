#!/bin/bash
ps -a -u $USER pid,command | tail -n +2 | wc -l > out1.txt
ps -a -u $USER pid,command | tail -n +2 | awk '{printf $1 ": " $2 "\n"}' >> out1.txt
