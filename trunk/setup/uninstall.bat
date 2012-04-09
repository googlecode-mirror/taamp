@echo OFF
@set TaAMPServerPath=%~dp0
@set TaAMPServerPath=%TaAMPServerPath:~ 0,-6%
(sc query TaAMP.Mysql | find "TaAMP.Mysql">nul && net stop TaAMP.Mysql && "%TaAMPServerPath%\local\mysql\bin\mysqld.exe" -remove Taamp.Mysql)
(sc query TaAMP.Apache | find "TaAMP.Apache">nul && net stop TaAMP.Apache && "%TaAMPServerPath%\local\apache\bin\httpd.exe" -k uninstall -n Taamp.Apache)
(sc query TaAMP.Svn | find "TaAMP.Svn">nul && net stop TaAMP.Svn && sc delete TaAMP.Svn)
(sc query TaAMP.Memcached | find "TaAMP.Memcached">nul && net stop TaAMP.Memcached && sc delete TaAMP.Memcached)

PAUSE