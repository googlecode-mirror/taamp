一、欢迎使用TaAMP的开发套件程序.

TaAMP主要方便新手学习php时使用.另外还为以后我的php开发框架ToAction作为开发环境的基本求要.
包含软件有：

+Apache 2.2.15

+php 5.2.13

+MySQL 5.1.44-community

+phpMyAdmin 3.3.1

+svn 1.6.6

二、安装方法
进入TaAMP\setup目录双击运行install.bat(服务器已经安装完成)
进入TaAMP目录运行Monitor.exe程序（该程序能监控apache及mysql的运行状态）
最后你就可以在TaAMP\www目录下运行你的php程序

Mysql默认管理帐号: root 密码:111111
可以通过 svn://localhost 访问svn仓库，默认情况下svn没有创建任何仓库，如果需要创建仓库，请到setup中运行 svn_creator.bat
程序

三、卸载方法
只需要进行TaAMP\setup目录双击运行uninstall.bat (服务器程序就可以轻松卸载)


四、SVN管理
如何管理svn可以访问 http://atim.cn/go.php/tags/svn/


五、日常管理
Apache 和 Mysql可以通过 Monitor.exe(安装目录下)进行管理。而svn服务将随系统启动。

相关链接
作者博客 http://atim.cn
项目主站 http://www.toaction.cn 或 http://code.google.com/p/taamp