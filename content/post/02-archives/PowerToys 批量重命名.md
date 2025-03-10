---
date: 2025-03-07
title: PowerToys 批量重命名
tags:
  - windows
  - 办公
categories:
  - windows
  - 办公
image: ./bg/02.jpg
author: carlos
---
## 前言

本文主题是如何批量重命名文件，从 00 开始递增，强制保留 2 位数

## 使用 PowerRename 批量重命名

右键点击选定的文件，选择“PowerRename”选项，打开 PowerRename 窗口。

![](../00-assets/Pasted%20image%2020250307030309.png)

启用正则表达式，输入 `.*` 匹配任意文件名

在“替换为”字段中输入新的命名格式。使用 `${padding=2;increment=1;start=0}` 来实现从 00 开始的两位数递增编号。

最后点击应用即可。

![](../00-assets/Pasted%20image%2020250307030156.png)


