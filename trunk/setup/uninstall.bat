@echo OFF
@set TaAMPServerPath=%cd:~0,-6%

net stop Taamp.Mysql
net stop Taamp.Apache
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" -remove Taamp.Mysql
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k uninstall -n Taamp.Apache
del "%userprofile%\「开始」菜单\程序\启动\Monitor.lnk"
PAUSE