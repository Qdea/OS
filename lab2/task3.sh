#!/bin/bash
ps -A -o pid,stime | tail -n +2 | tail -1 | awk '{printf $1 "\n"}'
