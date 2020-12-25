@echo off
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path C:\IEWIN7\Temp /Z /Y"
