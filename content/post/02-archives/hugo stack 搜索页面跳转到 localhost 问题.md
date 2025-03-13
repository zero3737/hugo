---
date: 2025-03-08
title: hugo stack 搜索页面跳转到 localhost 问题
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/46.webp
author: carlos
---

## 前言

我是局域网访问，使用搜索功能的时候，可以搜索出笔记，但是图片加载不出来，点击链接，直接 404，直接访问到 localhost，正常是访问 ip 地址的。

![](../00-assets/Pasted%20image%2020250308220615.png)

这是因为启动命令没有设置 baseURL，添加这个参数即可正常访问。

## 实操

命令添加参数 baseURL

```
hugo server --port=1313 --bind=0.0.0.0 --baseURL="http://192.168.15.210/"
```

加了参数之后，图片能正常加载，也能正常跳转指定的 ip 地址。

![](../00-assets/Pasted%20image%2020250308221013.png)