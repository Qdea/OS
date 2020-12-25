1 вариант(копирует файлы из каталога windows без вложенных подпапок(так скорее всего и нужно по заданию)):
@echo off
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path C:\IEWIN7\Temp /Z /Y" 
2 вариант(доработка с рекурсивным копированием файлов из подкаталогов):
@echo off
forfiles /P "C:\Windows" /S /C "cmd /c if @fsize GEQ 2097152 copy @path C:\IEWIN7\Temp /Z /Y" 
