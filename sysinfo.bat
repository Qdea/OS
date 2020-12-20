@echo off
systeminfo | findstr /B /C:"OS Version" > Version.txt
systeminfo | findstr "Mem" > Mem.txt
wmic os get FreePhysicalMemory /format:value > FPM.txt
type FPM.txt >> Mem.txt
wmic os get TotalVisibleMemorySize /format:value > TVM.txt
type TVM.txt >> Mem.txt
wmic logicaldisk list brief > Disk.txt
del FMP.txt
del TVM.txt