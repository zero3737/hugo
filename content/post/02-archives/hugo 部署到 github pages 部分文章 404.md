---
date: 2025-03-11T00:33:02+08:00
title: hugo 部署到 github pages 部分文章 404
tags:
  - Hugo
  - 笔记
  - github
  - git
categories:
  - hugo
  - 笔记
  - github
  - git
image: ./bg/02.webp
author: carlos
---

## 前言

我的部分文章是 joplin 导出，而静态资源是存放在 `_resources` 目录。GitHub Pages 默认启用 Jekyll 引擎，会忽略以下划线 `_` 开头的目录（如 `_resources`）‌。

## 解决方案

**禁用 Jekyll 处理**

在项目根目录或发布分支（如 `gh-pages`）中添加空文件 `.nojekyll`，以阻止 Jekyll 过滤特殊命名目录‌。

在 hugo public 目录运行命令

```shell
touch .nojekyll
```

确保 `.nojekyll` 文件被提交到 Git 仓库中。

![](../00-assets/Pasted%20image%2020250311003040.png)

访问成功，不会出现 404 错误。

![](../00-assets/Pasted%20image%2020250311003236.png)