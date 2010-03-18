@echo OFF
net stop Taamp.Mysql
net stop Taamp.Apache
..\local\mysql\bin\mysqld.exe -remove Taamp.Mysql
..\local\apache\bin\httpd.exe -k uninstall -n Taamp.Apache
PAUSE