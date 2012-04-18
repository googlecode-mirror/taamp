@echo OFF
@set TaAMPServerPath=%~dp0
@set TaAMPServerPath=%TaAMPServerPath:~ 0,-6%
echo ��������������������������������������������������������
echo �� ׼����װ TaAMP�������׼�                           ��
echo �� �ڰ�װ�Ĺ����У����ܻ���ɱ�������ʾ����ȫ����     ��
echo �� �磺���� sc ���ϵͳ����Ĳ��������           ��
echo �� ��ѡ����������׼����򽫲����������С�           ��
echo �� ���׼�����ֻ��Ϊ�˷����ѧ���ܿ������÷��������� ��
echo ��������������������������������������������������������
set input=
set /p input=������ף�������ok:
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
echo ���Ѿ��ɹ���װTaAMP�������׼�,Ϊ�˷�����Ĺ���,��ͨ��
echo %TaAMPServerPath%\Monitor.exe
echo ���ж�Apache��Mysql���п��ز���
start %TaAMPServerPath%\readme.txt
PAUSE
exit

:exit_install
echo �˳���װ����
pause
exit