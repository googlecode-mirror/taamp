@echo OFF
set TaAMPServerPath=%cd:~0,-6%
goto getname

:getname
	set /P newdirname=�������µ�SVN�ֿ�����ƣ�ֻ��Ӣ�ļ����֣�:
	set newdirpath=%TaAMPServerPath%\local\svn\svnrepos\%newdirname%
	IF NOT EXIST %newdirpath% goto createsvn
	IF NOT EXIST  %newdirpath% goto reget

:reget
	echo �Ѿ����ڸ�svn�ֿ�
	goto getname

:createsvn
	mkdir %newdirpath%
	%TaAMPServerPath%\local\svn\bin\svnadmin.exe create %newdirpath%
	IF EXIST %TaAMPServerPath%\local\svn\svnserve.conf goto copy_conf
	goto ok

:copy_conf
	@copy %TaAMPServerPath%\local\svn\svnserve.conf %newdirpath%\conf\
	goto ok
:ok
	echo �ɹ�������%newdirpath%�ֿ�
	echo �����ͨ�� svn://localhost/%newdirname% ���з���

PAUSE