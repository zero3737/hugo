---
date: 2025-03-06
title: hugo 时区问题导致文章未显示
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/15.webp
author: carlos
---

## 前言

在 hugo 中，当文章时间设置为当天的话，将文章发布到国外服务器中并进行构建的话，该文章可能没有显示在文章列表里。

Hugo 时间默认为格林威治时间，因为中国的时间比格林威治时间早 8 个小时，格林威治时间没有到你配置的时间的时候，文章是不会出现在文章列表里的。

## 解决方案

解决方法一： 是在命令后添加 --buildFuture 或 -F 选项 ，来构建未来发布的文章，比如：

```sh
hugo server --buildFuture
hugo --buildFuture
```

解决方法二： 在站点配置文件 config.toml 中添加下面的配置：

```
buildfuture = true
```

我的是 yaml 文件，文件末尾添加即可

![](../00-assets/Pasted%20image%2020250306041658.png)

[^1]: 
