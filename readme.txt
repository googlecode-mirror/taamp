 һ����ӭʹ��TaAMP�Ŀ����׼�����.

TaAMP��Ҫ��������ѧϰphpʱʹ��.���⻹Ϊ�Ժ��ҵ�php�������ToAction��Ϊ���������Ļ�����Ҫ.
���׼�Ϊ��ɫ�׼���ֻҪ��װ·��û������Ŀ¼�Ϳ��ԡ�
��������У�

+Apache 2.2.15

+php 5.3.16

+MySQL 5.5.22 win32-community

+phpMyAdmin 3.5.2.2 zh_cn

+svn 1.7.1

+memcached 1.4.5

+memcache.php ����memcached�ĳ���
������װ����
1)����TaAMP\setupĿ¼˫������install.bat(�ڰ�װ��ʱ����ܻ���ʾ����sc����,������Ҫʹ��sc��װsvn����.������)
2)����TaAMPĿ¼����Monitor.exe���򣨸ó����ܼ��apache��mysql������״̬��
3)�鿴 phpinfo (http://localhost/phpinfo.php)
4)�����Ϳ�����TaAMP\wwwĿ¼���������php����

	MysqlĬ�Ϲ����ʺ�: root ����:111111
		����ʹ��phpMyAdmin���й��� http://localhost/phpmyadmin/

	Memcach ״̬�������
		���Է��� http://localhost/memcache/ ���й��� 
		����ҳ����ʺ�: memcache ����:password
		�����Ҫ�޸����룬�� local/memcache_manage/index.php
		�޸�
		define('ADMIN_USERNAME','memcache'); 	// Admin Username
		define('ADMIN_PASSWORD','password');  	// Admin Password
	
	Apache ������������
		1) ���� local/apache/conf/vhost Ŀ¼��
		2) ����000-default �ļ����������磺 001-toactin.cn��ǰ�������Ϊ���ص�˳��
		3) �޸ľ���������:

			<VirtualHost *:80>
				ServerAdmin taamp@localhost
				DocumentRoot "../../www/toaction.cn"
				ServerName toaction.cn
				#ServerAlias www.toaction.cn
				ErrorLog "logs/dummy-toaction.cn-error.log"
				CustomLog "logs/dummy-toaction.cn-access.log" common
			</VirtualHost>

����ж�ط���
ֻ��Ҫ����setupĿ¼˫������uninstall.bat (����������Ϳ�������ж��)

�ġ���������
1)���ɰ�ĳ���ж��(ִ��setup\uninstall.bat),���ɰ�ĳ���װĿ¼����Ϊ old_taamp
2)�������°汾(����ҳ��http://code.google.com/p/taamp/downloads/list),����ѹΪtaamp
3)���ɰ�ķ������׼��е��ļ����Ƶ��°��� 
    a)local\php\php.ini (���û�и���,������Ҫ����)
    b)local\mysql\data\
    c)local\mysql\my.ini (���û�и���,������Ҫ����)
    d)www\ 
    e)local\apache\conf\httpd.conf (���û�и���,������Ҫ����)
    f)local\apache\conf\extra\httpd-vhosts.conf (���û�и���,������Ҫ����)
    g)local\svn\svnrepos (�����ӹ�svn��,���Բ�����)
4)��װ�°汾 (ִ�� setup\install.bat)
5)������û�в�������

	*ע�⣺�� 0.1.46 �濪ʼ����htepd-vhost.conf���з��롣��ÿ�����������������ļ���ŵ� local\apache\conf\vhostĿ¼�¡�
	����� 0.1.46 ��ǰ�İ汾������������Ҫ�� local\apache\conf\extra\httpd-vhosts.conf ���ݰ������ָ�ɵ����ļ�Ȼ�󱣴浽
	local\apache\conf\vhost �¡����巽���ο� ��Apache ��������������������

�塢SVN����
��ι���svn���Է��� http://atim.cn/go.php/tags/svn/
����ͨ�� svn://localhost ����svn�ֿ⣬Ĭ�������svnû�д����κβֿ⣬�����Ҫ�����ֿ⣬�뵽setupĿ¼������ svn_creator.bat ���򣬸��������򽫰����㴴��svn�ֿ�



�����ճ�����
Apache �� Mysql����ͨ�� Monitor.exe(��װĿ¼��)���й�����svn������ϵͳ������

�������
���߲��� http://atim.cn
��Ŀ��վ http://www.toaction.cn �� http://code.google.com/p/taamp