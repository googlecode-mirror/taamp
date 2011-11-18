@echo OFF
set TaAMPServerPath=%cd:~0,-6%
goto getname

:getname
	set /P newdirname=请输入新的SVN仓库的名称（只限英文及数字）:
	set newdirpath=%TaAMPServerPath%\local\svn\svnrepos\%newdirname%
	IF NOT EXIST %newdirpath% goto createsvn
	IF NOT EXIST  %newdirpath% goto reget

:reget
	echo 已经存在该svn仓库
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
	echo 成功建立了%newdirpath%仓库
	echo 你可以通过 svn://localhost/%newdirname% 进行访问

PAUSE