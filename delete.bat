@echo off
for /f "usebackq skip=1 tokens=*" %A IN (`dir "." /b /a-d /o-d /tw`) DO erase "%A"