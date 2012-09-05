 一、欢迎使用TaAMP的开发套件程序.

TaAMP主要方便新手学习php时使用.另外还为以后我的php开发框架ToAction作为开发环境的基本求要.
本套件为绿色套件，只要安装路径没有中文目录就可以。
包含软件有：

+Apache 2.2.15

+php 5.3.16

+MySQL 5.5.22 win32-community

+phpMyAdmin 3.5.2.2 zh_cn

+svn 1.7.1

+memcached 1.4.5

+memcache.php 管理memcached的程序
二、安装方法
1)进入TaAMP\setup目录双击运行install.bat(在安装的时候可能会提示调用sc命令,由于需要使用sc安装svn服务.所以请)
2)进入TaAMP目录运行Monitor.exe程序（该程序能监控apache及mysql的运行状态）
3)查看 phpinfo (http://localhost/phpinfo.php)
4)最后你就可以在TaAMP\www目录下运行你的php程序

	Mysql默认管理帐号: root 密码:111111
		可以使用phpMyAdmin进行管理 http://localhost/phpmyadmin/

	Memcach 状态管理程序
		可以访问 http://localhost/memcache/ 进行管理 
		管理页面的帐号: memcache 密码:password
		如果需要修改密码，打开 local/memcache_manage/index.php
		修改
		define('ADMIN_USERNAME','memcache'); 	// Admin Username
		define('ADMIN_PASSWORD','password');  	// Admin Password
	
	Apache 增加虚拟主机
		1) 进入 local/apache/conf/vhost 目录。
		2) 复制000-default 文件，并改名如： 001-toactin.cn。前面的数字为加载的顺序。
		3) 修改具体内容如:

			<VirtualHost *:80>
				ServerAdmin taamp@localhost
				DocumentRoot "../../www/toaction.cn"
				ServerName toaction.cn
				#ServerAlias www.toaction.cn
				ErrorLog "logs/dummy-toaction.cn-error.log"
				CustomLog "logs/dummy-toaction.cn-access.log" common
			</VirtualHost>

三、卸载方法
只需要进行setup目录双击运行uninstall.bat (服务器程序就可以轻松卸载)

四、升级方法
1)将旧版的程序卸载(执行setup\uninstall.bat),并旧版的程序安装目录改名为 old_taamp
2)下载最新版本(下载页面http://code.google.com/p/taamp/downloads/list),并解压为taamp
3)将旧版的服务器套件中的文件复制到新版中 
    a)local\php\php.ini (如果没有更改,将不需要复制)
    b)local\mysql\data\
    c)local\mysql\my.ini (如果没有更改,将不需要复制)
    d)www\ 
    e)local\apache\conf\httpd.conf (如果没有更改,将不需要复制)
    f)local\apache\conf\extra\httpd-vhosts.conf (如果没有更改,将不需要复制)
    g)local\svn\svnrepos (如果添加过svn库,可以不复制)
4)安装新版本 (执行 setup\install.bat)
5)测试有没有产生问题

	*注意：从 0.1.46 版开始，对htepd-vhost.conf进行分离。将每个虚拟主机的配置文件存放到 local\apache\conf\vhost目录下。
	如果从 0.1.46 以前的版本进行升级，需要将 local\apache\conf\extra\httpd-vhosts.conf 内容按域名分割成单个文件然后保存到
	local\apache\conf\vhost 下。具体方法参看 《Apache 增加虚拟主机》的内容

五、SVN管理
如何管理svn可以访问 http://atim.cn/go.php/tags/svn/
可以通过 svn://localhost 访问svn仓库，默认情况下svn没有创建任何仓库，如果需要创建仓库，请到setup目录中运行 svn_creator.bat 程序，该批处程序将帮助你创建svn仓库



六、日常管理
Apache 和 Mysql可以通过 Monitor.exe(安装目录下)进行管理。而svn服务将随系统启动。

相关链接
作者博客 http://atim.cn
项目主站 http://www.toaction.cn 或 http://code.google.com/p/taamp