@echo OFF
@set TaAMPServerPath=%~dp0
@set TaAMPServerPath=%TaAMPServerPath:~ 0,-6%
echo ┌──────────────────────────┐
echo │ 准备安装 TaAMP服务器套件                           │
echo │ 在安装的过程中，可能会有杀毒软件提示不安全操作     │
echo │ 如：调用 sc 命令（系统服务的操作命令）。           │
echo │ 请选择允许否则本套件程序将不能正常运行。           │
echo │ 本套件程序只是为了方便初学者能快速配置服务器程序。 │
echo └──────────────────────────┘
set input=
set /p input=如果明白，请输入ok:
echo %input%
if not "x%input%"=="xok" goto exit_install

call "%TaAMPServerPath%\setup\uninstall.bat" from_install

rem install Apache
cd "%TaAMPServerPath%\local\apache\"
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k install -n TaAMP.Apache
(sc query TaAMP.Apache | find "TaAMP.Apache">nul && net start TaAMP.Apache)
cd "%TaAMPServerPath%"

rem install Mysql
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" --install TaAMP.Mysql --defaults-file="%TaAMPServerPath%\local\mysql\my.ini"
(sc query TaAMP.Mysql | find "TaAMP.Mysql">nul && net start TaAMP.Mysql)


rem install Svn
sc create TaAMP.Svn binPath= "%TaAMPServerPath%\local\svn\bin\svnserve.exe --service -r %TaAMPServerPath%\local\svn\svnrepos" depend= tcpip displayname= "TaAMP.Svn" start= auto
(sc query TaAMP.Svn | find "TaAMP.Svn">nul && net start TaAMP.Svn)


rem install Memcached
sc create TaAMP.Memcached binPath= "%TaAMPServerPath%\local\memcached\srvany.exe" displayname= "TaAMP.memcached" start= auto
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "Application" /d "%TaAMPServerPath%\\local\\memcached\\memcached.exe")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "AppParameters" /d "")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TaAMP.Memcached\Parameters" /v "AppDirectory" /d "%TaAMPServerPath%\\local\\memcached\\")
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && net start TaAMP.Memcached)




:final_install
echo 你已经成功安装TaAMP服务器套件,为了方便你的管理,请通过
echo %TaAMPServerPath%\Monitor.exe
echo 进行对Apache和Mysql进行开关操作
start %TaAMPServerPath%\readme.txt
PAUSE
exit

:exit_install
echo 退出安装程序
pause
exit