@echo OFF
@set TaAMPServerPath=%~dp0
@set TaAMPServerPath=%TaAMPServerPath:~ 0,-6%

rem ֹͣ TaAMP.Svn ��Ȼ��ж�� TaAMP.Svn
(sc query TaAMP.Mysql | find "4  RUNNING">nul && net stop TaAMP.Mysql)
(sc query TaAMP.Mysql | find "TaAMP.Mysql">nul && "%TaAMPServerPath%\local\mysql\bin\mysqld.exe" -remove Taamp.Mysql)


rem ֹͣ TaAMP.Svn ��Ȼ��ж�� TaAMP.Svn
(sc query TaAMP.Apache | find "4  RUNNING">nul && net stop TaAMP.Apache)
(sc query TaAMP.Apache | find "TaAMP.Apache">nul && "%TaAMPServerPath%\local\apache\bin\httpd.exe" -k uninstall -n Taamp.Apache)

rem ֹͣ TaAMP.Svn ��Ȼ��ж�� TaAMP.Svn
(sc query TaAMP.Svn | find "4  RUNNING">nul && net stop TaAMP.Svn)
(sc query TaAMP.Svn | find "TaAMP.Svn">nul && sc delete TaAMP.Svn)


rem ֹͣ TaAMP.Memcached ��Ȼ��ж�� TaAMP.Memcached
(sc query TaAMP.Memcached | find "4  RUNNING">nul && net stop TaAMP.Memcached)
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul &&sc delete TaAMP.Memcached)

PAUSE