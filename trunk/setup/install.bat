@echo OFF
@set TaAMPServerPath=%cd:~0,-6%
cd "%TaAMPServerPath%\local\apache\"
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k install -n TaAMP.Apache
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" --install TaAMP.Mysql --defaults-file="%TaAMPServerPath%\local\mysql\my.ini"
sc create TaAMP.Svn binpath= "%TaAMPServerPath%\local\svn\bin\svnserve.exe --service -r %TaAMPServerPath%\local\svn\svnrepos" depend= tcpip start= auto
net start TaAMP.Mysql
net start TaAMP.Apache
net start TaAMP.Svn
start %TaAMPServerPath%\Monitor.exe
echo 你已经成功安装TaAMP服务器套件,为了方便你的管理,请通过
echo %TaAMPServerPath%\Monitor.exe 
echo 进行对Apache和Mysql进行开关操作
PAUSE
start http://localhost/phpinfo.php
start %TaAMPServerPath%\readme.txt
PAUSE