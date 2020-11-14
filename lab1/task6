#!/bin/bash

cat /var/log/anaconda/X.log | grep -E "\\] \\(WW\\)" | sed s/\(WW\)/Warning\:/ > full.log
cat /var/log/anaconda/X.log | grep -E "\\] \\(II\\)" | sed s/\(II\)/Information\:/ >> full.log
