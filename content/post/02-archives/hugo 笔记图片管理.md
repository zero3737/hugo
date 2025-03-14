---
date: 2025-03-06
title: hugo 笔记图片管理
tags:
  - Hugo
  - 笔记
categories: []
image: ./bg/34.webp
author: carlos
---

## 本地存储方案

一、static 文件夹集中管理

在 Hugo 项目根目录创建 static/images 文件夹，将图片统一存放于此。引用时使用绝对路径：`![描述](/images/图片名.jpg)`。

优势：Hugo 构建时自动复制到网站根目录，路径稳定，适合高频更新且需长期保留的图片‌。

二、内容同级目录管理

在 content 目录下，创建与 Markdown 文件同名的文件夹（如 post.md 对应 post 文件夹），将图片存放其中。引用时使用相对路径：`![描述](./图片名.jpg)。`

优势：图片与笔记文件物理位置绑定，迁移或备份时不易丢失关联，适合单篇笔记专属图片‌。

三、Assets 资源库管理

在 assets/images 中存放全局图片（如头像、Logo），通过配置文件 config.toml 指定路径。示例配置：`avatarURL = "images/avatar.png"`。

优势：统一管理全站公共图片资源，便于复用和维护‌4。

## 符号链接

hugo static 目录可以使用符号链接，而 content/post 目录是不能使用符号链接，hugo 默认忽略 post 中的符号链接。