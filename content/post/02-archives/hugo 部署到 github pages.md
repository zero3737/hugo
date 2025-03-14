---
date: 2025-03-10T23:44:35+08:00
title: hugo 部署到 github pages
tags:
  - Hugo
  - github
  - 笔记
  - git
categories: []
image: ./bg/35.webp
author: carlos
---

## 前言

本文主题是 hugo 怎么部署到 github pages

## 实操

设置 baseurl，不然会样式错误。

![](../00-assets/Pasted%20image%2020250310233803.png)

将 public 目录下的静态文件上传到 github，找到 Settings

![](../00-assets/Pasted%20image%2020250310233913.png)

找到 pages，设置分支，设置根目录，保存即可。

![](../00-assets/Pasted%20image%2020250310234041.png)

如果 `username.github.io` 作为仓库名，直接访问即可，我的是 hugo 作为仓库名，所以要在后面加 hugo 目录，完整 url：`username.github.io/hugo`

访问成功截图

![](../00-assets/Pasted%20image%2020250310234348.png)