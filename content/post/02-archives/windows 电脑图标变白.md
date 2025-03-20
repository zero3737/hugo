---
date: 2025-03-20T04:28:24+08:00
title: windows 电脑图标变白
tags:
  - 电脑知识
  - windows
categories: 
image: ./bg/24.webp
author: carlos
---

## 前言

win 11 图片变白

![](../00-assets/Pasted%20image%2020250320042743.png)

## 操作

按下组合键 WIN+R ， 输入 regedit 再按回车运行，这时候会有一个提示，选择 “是”。

一层一层找到 计算机`\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons\` 这个路径

根据自己变成空白的硬盘盘符（我这里是盘符 Y），右键点击DriveIcons建立一个跟你硬盘盘符同名的项，然后再次右击刚建立的项，建立一个名为 DefaultIcon的项。

![](../00-assets/Pasted%20image%2020250320042641.png)

选中刚刚创建的 DefaultIcon，在右边面板双击默认，然后会弹出一个面板，直接确定即可。此步必须做，否则不生效！！！

![](../00-assets/Pasted%20image%2020250320042712.png)