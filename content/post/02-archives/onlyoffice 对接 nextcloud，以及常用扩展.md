---
date: 2025-03-15T02:46:46+08:00
title: onlyoffice 对接 nextcloud，以及常用扩展
tags:
  - docker
  - ubuntu
  - linux
categories: 
image: ./bg/46.webp
author: carlos
---

## nextcloud

Nextcloud 是 ownCloud 创始人发起的分支项目，是一款用于自建企业云存储（私有网盘）的开源软件。支持 PC、IOS 和 Android 三个同步客户端，用户可以很方便地与服务器上存储的文件、日程安排、通讯录、书签等重要数据保持同步。它还支持将数据保存到第三方存储中：Amazon S3、Dropbox、FTP、Google Drive、SMB、WebDAV、SFTP等。

## 连接外部存储

登录 Nextcloud 后台，通过 应用 管理，启用 External storage support 扩展。

![83f79a306ab27e5078ff8dfc76739f5f.png](../_resources/83f79a306ab27e5078ff8dfc76739f5f.png)

打开：【管理设置】>【外部存储】>【Add storage】>【External Storage】，选择一个外部存储服务。

![df31c5ba8abb023b70681ca59344f2b7.png](../_resources/df31c5ba8abb023b70681ca59344f2b7.png)

根据实际情况配置，连接到相应的对象存储。建议选择本地，也可以选择 ftp、webdav 等方式挂载。我尝试过 webdav 挂载 alist，但是 onlyoffice 打不开 alist 上的文件，换成本地就能正常打开。

![e1751296db7b366f44e8ff81ea465317.png](../_resources/e1751296db7b366f44e8ff81ea465317.png)

## 手动安装扩展

nextcloud 官方插件地址：https://apps.nextcloud.com/

点击图片红框下载即可。

![e5b752ce7dd322768d549a8c90f6cf4b.png](../_resources/e5b752ce7dd322768d549a8c90f6cf4b.png)

将下载的文件解压到 docker 容器中的 /var/www/html/apps 目录即可。每个版本的扩展目录都不一样。

我是如下版本号。

![fa0f7e9f49c907da417f4497e0733db6.png](../_resources/fa0f7e9f49c907da417f4497e0733db6.png)

具体目录参考官方文档：https://hub.docker.com/_/nextcloud/

## 集成 onlyoffice

手动安装完 onlyoffice，在“已禁用的应用”中启用。我这里已经启用，所以没有 onlyoffice。

![84c5d05c308f37bae6fce72857096817.png](../_resources/84c5d05c308f37bae6fce72857096817.png)

onlyoffice 配置如下。记得关闭 jwt，并且外部存储挂载方式选择“本地”。

![4537091e299671b165ddb3225bd3000d.png](../_resources/4537091e299671b165ddb3225bd3000d.png)

nextcloud 默认使用系统盘，使用系统盘兼容性最好，打开 onlyoffice 不会报错，通过 webdav 方式挂载 alist 会报错。或者也可以使用“本地”方式挂载。

onlyoffice 集成 nextcloud 是不能直接保存 office 本地文件，也就是说在线编辑完，是不能对本地文件直接修改。但是会在线保存文件，通过 web 端访问，上一次修改的记录还在，要保存，必须保存为副本，然后下载到本地。

## 集成 mail

手动安装 mail 扩展，实现邮件统一管理。不过需要邮件服务器密码，不是账号密码。所以没有手机号，是登录不了谷歌邮箱的，没有手机号，是获取不了应用密码，也就无法登录。

## 集成 talk

手动安装 talk，实现局域网文本传输。