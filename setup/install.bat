@echo OFF
..\local\apache\bin\httpd.exe -k install -n Taamp.Apache
..\local\mysql\bin\mysqld.exe -install Taamp.Mysql

net start Taamp.Mysql
net start Taamp.Apache
PAUSE