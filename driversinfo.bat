@echo off
driverquery /FO TABLE /NH > drivers.txt
sort /R drivers.txt /o driverssort.txt