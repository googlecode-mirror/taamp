һ����ӭʹ��TaAMP�Ŀ����׼�����.

TaAMP��Ҫ��������ѧϰphpʱʹ��.���⻹Ϊ�Ժ��ҵ�php�������ToAction��Ϊ���������Ļ�����Ҫ.
���׼�Ϊ��ɫ�׼���ֻҪ��װ·��û������Ŀ¼�Ϳ��ԡ�
��������У�

+Apache 2.2.15

+php 5.2.17.17

+MySQL 5.5.17 win32-community

+phpMyAdmin 3.4.7.1 all languages

+svn 1.7.1

+memcached 1.4.5

������װ����
1)����TaAMP\setupĿ¼˫������install.bat(�ڰ�װ��ʱ����ܻ���ʾ����sc����,������Ҫʹ��sc��װsvn����.������)
2)����TaAMPĿ¼����Monitor.exe���򣨸ó����ܼ��apache��mysql������״̬��
3)�鿴 phpinfo (http://localhost/phpinfo.php)
4)�����Ϳ�����TaAMP\wwwĿ¼���������php����

MysqlĬ�Ϲ����ʺ�: root ����:111111
����ʹ��phpMyAdmin���й��� http://localhost/phpmyadmin/

����ж�ط���
ֻ��Ҫ����setupĿ¼˫������uninstall.bat (����������Ϳ�������ж��)

�ġ���������
2)���ɰ�ĳ���ж��(ִ��setup\uninstall.bat),���ɰ�ĳ���װĿ¼����Ϊ old_taamp
1)�������°汾(����ҳ��http://code.google.com/p/taamp/downloads/list),����ѹΪtaamp
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

�塢SVN����
��ι���svn���Է��� http://atim.cn/go.php/tags/svn/
����ͨ�� svn://localhost ����svn�ֿ⣬Ĭ�������svnû�д����κβֿ⣬�����Ҫ�����ֿ⣬�뵽setupĿ¼������ svn_creator.bat ���򣬸��������򽫰����㴴��svn�ֿ�



�����ճ�����
Apache �� Mysql����ͨ�� Monitor.exe(��װĿ¼��)���й�����svn������ϵͳ������

�������
���߲��� http://atim.cn
��Ŀ��վ http://www.toaction.cn �� http://code.google.com/p/taamp