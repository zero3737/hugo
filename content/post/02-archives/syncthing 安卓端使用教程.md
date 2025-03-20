---
date: 2025-03-20T00:59:22+08:00
title: syncthing 安卓端使用教程
tags:
  - docker
  - ubuntu
  - linux
  - 同步
  - 备份
categories: 
image: ./bg/22.webp
author: carlos
---

## 添加设备

手机端客户端安装地址

[syncthing/syncthing-android: Wrapper of syncthing for Android.](https://github.com/syncthing/syncthing-android)

docker 版服务端点击连接，获取标识二维码，用来添加设备。

![f63ef6431cacb006ad5023cdcee47c50.png](../_resources/f63ef6431cacb006ad5023cdcee47c50.png)

手机端顶部选项卡点击“设备”按钮。

![a931d66383d1cb67f6bfe23f82bc3385.png](../_resources/a931d66383d1cb67f6bfe23f82bc3385.png)

点击二维码添加设备。

![5e7450e67a2a5112ae384366610514e1.png](../_resources/5e7450e67a2a5112ae384366610514e1.png)

## 添加文件夹

手机端右上方点击“+”号按钮。

![af2dc2de135e60c8d980787f3633de81.png](../_resources/af2dc2de135e60c8d980787f3633de81.png)

点击文件夹图标，选择目录。

![ef8cb3a6e8c5e306d54049602838ec72.png](../_resources/ef8cb3a6e8c5e306d54049602838ec72.png)

选择好目录，点击“允许访问”。

![c3916577048330ffa7085525072e4093.png](../_resources/c3916577048330ffa7085525072e4093.png)

“文件夹类型”选择“仅发送”。

![b41585f6b5e648c03076f0733e064858.png](../_resources/b41585f6b5e648c03076f0733e064858.png)

docker 版服务端选择添加文件夹即可。

![b8a9e47f2e8ee6ee5aa41c16ee80a433.png](../_resources/b8a9e47f2e8ee6ee5aa41c16ee80a433.png)

设置好同步目录。

![8402f0ac56d48dd656cb068aa18b5f53.png](../_resources/8402f0ac56d48dd656cb068aa18b5f53.png)

服务端选择“仅接受”。

![445e8d6943d74d34253301f46f6e3f25.png](../_resources/445e8d6943d74d34253301f46f6e3f25.png)

## 服务端忽略删除操作

如果想让服务端忽略发送端（发送端：手机作为发送端）的删除操作，别称：无视删除操作。比如服务端同步好数据，这时候想节省手机内存，想删除手机备份好的数据，又不想影响服务端已经备份好的数据。

软件网页端“操作-高级-文件夹-Ignore Delete”打勾，即可忽略发送端删除操作。

![5faf55973e12fea0bc081446f3a9fd9b.png](../_resources/5faf55973e12fea0bc081446f3a9fd9b.png)

选择“文件夹”。

![c772effc12d648b5551384cd7e2d4142.png](../_resources/c772effc12d648b5551384cd7e2d4142.png)

“忽略删除”选项打勾，然后滑动到底部保存即可。

![14240aad2b427aa586829459bce04eac.png](../_resources/14240aad2b427aa586829459bce04eac.png)

