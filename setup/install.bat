@echo OFF
@set TaAMPServerPath=%cd:~0,-6%
cd "%TaAMPServerPath%\local\apache\"
"%TaAMPServerPath%\local\apache\bin\httpd.exe" -k install -n TaAMP.Apache
"%TaAMPServerPath%\local\mysql\bin\mysqld.exe" --install TaAMP.Mysql --defaults-file="%TaAMPServerPath%\local\mysql\my.ini"
sc create TaAMP.Svn binpath= "%TaAMPServerPath%\local\svn\bin\svnserve.exe --service -r %TaAMPServerPath%\local\svn\svnrepos" depend= tcpip start= auto
net start TaAMP.Mysql
net start TaAMP.Apache
net start TaAMP.Svn
echo ���Ѿ��ɹ���װTaAMP�������׼�,Ϊ�˷�����Ĺ���,��ͨ��
echo %TaAMPServerPath%\Monitor.exe 
echo ���ж�Apache��Mysql���п��ز���
start %TaAMPServerPath%\readme.txt
PAUSE