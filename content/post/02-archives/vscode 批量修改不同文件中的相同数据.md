---
date: 2025-03-13T19:03:44+08:00
title: vscode 批量修改不同文件中的相同数据
tags:
  - vscode
  - 电脑知识
categories: 
image: ./bg/44.webp
author: carlos
---

## 前言

vscode 中有全局搜索功能，然后通过正则匹配需要修改的内容，进行替换即可

## 操作

右键打开项目

![](../00-assets/Pasted%20image%2020250313190149.png)

鼠标聚焦在文件，快捷键 `crtl+shift+f`

![](../00-assets/Pasted%20image%2020250313165435.png)

我这里需要将图片 jpg 后缀改为 webp，通过正则匹配 `\.jpg$` jpg 后缀，然后替换即可