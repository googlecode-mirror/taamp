@echo OFF
net stop ACGServer
net stop ACGDatabase
..\local\mysql\bin\mysqld.exe -remove Taamp.Mysql
..\local\apache\bin\httpd.exe -k uninstall -n Taamp.Apache
PAUSE