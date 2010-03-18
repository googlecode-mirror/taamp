@echo OFF
@set TaAMPServerPath=%cd:~0,-6%
%TaAMPServerPath%\local\apache\bin\httpd.exe -k install -n TaAMP.Apache
%TaAMPServerPath%\local\mysql\bin\mysqld.exe -install TaAMP.Mysql
net start TaAMP.Mysql
net start TaAMP.Apache
xcopy "%TaAMPServerPath%\setup\Monitor.lnk" "%userprofile%\「开始」菜单\程序\启动\"
start http://localhost
PAUSE