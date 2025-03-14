---
date: 2025-03-14T20:23:05+08:00
title: 白嫖腾讯云国际 pages 服务
tags:
  - github
  - 域名
categories: 
image: ./bg/05.webp
author: carlos
---

## 前言

腾讯云国际 pages 服务，呵呵，速度堪忧

## 创建账号

腾讯云不用完成注册，有个账号就行了，什么电话卡和银行卡我都没绑（如果他不让你登录就直接点下面page创建链接即可。

[注册腾讯云国际账号](https://console.tencentcloud.com/edgeone/pages?action=create)

注册完账号，不要绑定信息，我是绑定谷歌账号，填写密码，直接退出，直接点击腾讯控制台就能使用 pages 服务了。我并没有完成注册，也可以登录控制台。

![](../00-assets/Pasted%20image%2020250314201343.png)

## 创建项目

创建项目，github 授权，填写配置就能自动化构建。

![](../00-assets/Pasted%20image%2020250314201633.png)

配置参数

```txt
HUGO_VERSION=0.125.7 HUGO_ENV=production hugo
npm install
```

![](../00-assets/Pasted%20image%2020250314201823.png)

## 自定义域名

如果 https 访问不成功，在域名服务商后台配置 https 证书认证即可。dns 服务器添加 txt 记录认证。

![](../00-assets/Pasted%20image%2020250314202054.png)
