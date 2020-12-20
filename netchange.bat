@echo off
net start > nets.txt
net stop dnscache
timeout /t 20
net start > nets2.txt
fc /A nets.txt nets2.txt > delta.txt
net start dnscache