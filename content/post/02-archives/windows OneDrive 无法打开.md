---
date: 2025-03-20T05:06:30+08:00
title: windows OneDrive 无法打开
tags:
  - windows
  - 电脑知识
  - 同步
  - 备份
categories: 
image: ./bg/30.webp
author: carlos
---

## 前言

可能装机工具默认禁用 onedrive 的问题

## 操作

同时按Win+R（同时键盘上的Windows图标键和R键），输入gpedit.msc

![](../00-assets/Pasted%20image%2020250320050354.png)

在本地组策略中依次点击：计算机配置-管理模板-Windows组件-OneDrive，双击右侧“禁止使用OneDrive进行文件存储”。

![](../00-assets/Pasted%20image%2020250320050414.png)

点击“未配置”或“已禁用”，重启电脑。默认"未配置"改成"已禁用"

![](../00-assets/Pasted%20image%2020250320050428.png)