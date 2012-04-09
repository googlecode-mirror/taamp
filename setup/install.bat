@echo OFF
@set TaAMPServerPath=%~dp0
@set TaAMPServerPath=%TaAMPServerPath:~ 0,-6%

rem install Apache
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k install -n TaAMP.Apache
(sc query TaAMP.Apache | find "TaAMP.Apache">nul && net start TaAMP.Apache)


rem install Mysql
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" --install TaAMP.Mysql --defaults-file="%TaAMPServerPath%\local\mysql\my.ini"
(sc query TaAMP.Mysql | find "TaAMP.Mysql">nul && net start TaAMP.Mysql)


rem install Svn
sc create TaAMP.Svn binpath= "%TaAMPServerPath%\local\svn\bin\svnserve.exe --service -r %TaAMPServerPath%\local\svn\svnrepos" depend= tcpip start= auto
(sc query TaAMP.Svn | find "TaAMP.Svn">nul && net start TaAMP.Svn)


rem install Memcached
sc create TaAMP.Memcached binpath= "%TaAMPServerPath%\local\memcached\srvany.exe" displayname= "TaAMP.memcached" start= auto
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "Application" /d "%TaAMPServerPath%\\local\\memcached\\memcached.exe")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "AppParameters" /d "")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "AppDirectory" /d "%TaAMPServerPath%\\local\\memcached\\")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && net start TaAMP.Memcached)


echo 你已经成功安装TaAMP服务器套件,为了方便你的管理,请通过
echo %TaAMPServerPath%\Monitor.exe
echo 进行对Apache和Mysql进行开关操作
start %TaAMPServerPath%\readme.txt
PAUSE