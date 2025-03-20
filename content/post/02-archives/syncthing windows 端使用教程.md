---
date: 2025-03-20T02:24:02+08:00
title: syncthing windows 端使用教程
tags:
  - windows
  - ubuntu
  - docker
  - linux
  - 同步
  - 备份
categories: 
image: ./bg/02.webp
author: carlos
---

## 安装

官网地址

[Bill-Stewart/SyncthingWindowsSetup: Syncthing Windows Setup](https://github.com/Bill-Stewart/SyncthingWindowsSetup)

默认下一步即可

## 初始化

设置开启局域网访问

![](../00-assets/Pasted%20image%2020250320020412.png)

删除默认文件夹

![](../00-assets/Pasted%20image%2020250320020526.png)

## 添加设备

找到标识

![](../00-assets/Pasted%20image%2020250320020657.png)

服务端复制 id

![](../00-assets/Pasted%20image%2020250320020735.png)

windows 端添加远程设备

![](../00-assets/Pasted%20image%2020250320020748.png)

服务端添加设备

![](../00-assets/Pasted%20image%2020250320020911.png)

## windwos 端添加文件夹

添加文件夹

![](../00-assets/Pasted%20image%2020250320022340.png)

设置同步目录，分别是名称和路径

![](../00-assets/Pasted%20image%2020250320021157.png)

打勾表示共享给服务端

![](../00-assets/Pasted%20image%2020250320021244.png)

仅发送，表示不接受服务端的修改

![](../00-assets/Pasted%20image%2020250320021345.png)

扫描并不是开始同步，我也不知道干什么，让他扫就行

![](../00-assets/Pasted%20image%2020250320021509.png)

## 服务端接受分享

添加，接受分享

![](../00-assets/Pasted%20image%2020250320021655.png)

设置服务端同步目录

![](../00-assets/Pasted%20image%2020250320022020.png)

设置共享

![](../00-assets/Pasted%20image%2020250320022047.png)

设置仅接受

![](../00-assets/Pasted%20image%2020250320022128.png)

## 强制同步

服务端仅接受，如果和远程不一样，有一个强制还原的选项，还原远程更改

![](../00-assets/Pasted%20image%2020250320033040.png)

同理，如果本地和远程不一样，windows 端会有一个强制还原的选项

![](../00-assets/Pasted%20image%2020250320033223.png)

##  设置开机启动

保存 syncthing.bat 脚本文件

```cmd
# 打开 “记事本” 软件，将以下代码复制进去，另存为 syncthing.bat。
start "Syncthing" syncthing.exe -no-console -no-browser
```

如果上面的脚本不起作用改用 vbs 脚本

```vbs
CreateObject("WScript.Shell").Run """C:\Users\carlos\AppData\Local\Programs\Syncthing\syncthing.exe"" -no-console -no-browser", 0
```

复制脚本文件到 syncthing.exe 同级目录。找到 syncthing.exe 所在目录，将 syncthing.bat 脚本文件复制到该目录。

将脚本文件快捷方式添加到 “启动” 菜单

1. 选中 syncthing.bat 脚本文件，右键创建快捷方式
2. 按下 win + R，输入 “shell:startup” 打开 “启动” 文件夹
3. 将快捷方式复制到 “启动” 文件夹



