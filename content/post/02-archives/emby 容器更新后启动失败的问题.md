---
date: 2025-03-17T20:17:51+08:00
title: emby 容器更新后启动失败的问题
tags:
  - docker
  - emby
categories: 
image: ./bg/51.webp
author: carlos
---

## 前言

优先通过版本回退解决，避免修改配置文件或删除数据。

emby 容器更新，导致容器启动失败，第一想到的是卸载新容器，回退旧容器。而不是删除配置文件，别乱搞配置文件，数据丢失得不偿失。

md，复制了一份 `library.db` 文件，并重命名为 `library.db.bak` ，想回退，md emby 居然不认了，数据库文件重命名不了一点。

![](../00-assets/Pasted%20image%2020250317201229.png)

## 回退旧版容器

‌**停止容器**

```shell
docker stop <新容器名称或ID>
```

**删除容器**

```shell
docker rm <新容器名称或ID>
```

**确认旧镜像版本**

查看本地已有的Emby镜像列表，找到稳定版本标签（如`v4.7.11`）：

```shell
docker images | grep emby
```

**重新启动旧版本容器**

使用旧镜像运行容器，并确保挂载原有配置目录：

```shell
docker run -d \
  --name=emby_old \
  -p 8096:8096 \
  -v /原有配置目录路径:/config \
  linuxserver/emby:<旧版本标签>
```