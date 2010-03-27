@echo OFF
@set TaAMPServerPath=%cd:~0,-6%

net stop TaAMP.Mysql
net stop TaAMP.Apache
net stop TaAMP.Svn
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" -remove Taamp.Mysql
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k uninstall -n Taamp.Apache
sc delete TaAMP.Svn
PAUSE