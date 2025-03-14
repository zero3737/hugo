---
date: 2025-03-09
title: hugo nginx 反向代理域名默认加端口号
tags:
  - Hugo
  - 笔记
  - nginx
categories: []
image: ./bg/37.webp
author: carlos
---

## 前言

通过 `hugo server` 命令可以启动为服务端，默认端口为 1313。但如果直接通过 Nginx 的 proxy_pass 反代为公网服务会遇到一些问题，应该加上一些参数启动。

比如搜索页面加载图片失败，wss 一直访问失败

![](../00-assets/Pasted%20image%2020250308235044.png)

点击链接，域名会默认加端口号，导致访问失败 404

![](../00-assets/Pasted%20image%2020250308235159.png)

## 解决方案

- appendPort 参数，这里需要设置为 false，这样你的 baseURL 就不会变成 <域名>:1313。如果不设置为 false，你在使用搜索等功能的时候，浏览器还是会向 1313 端口发送请求。
- baseURL 参数，不然搜索页面中的笔记自动跳转 localhost。
- liveReloadPort 参数，这个是 Hugo 用来实时更新网页内容的 WebSocket 端口。除了要设置 Nginx 支持 WebSocket，这里还要手动指定下 wss 访问的端口为与 https 相同的 443。

完整命令

```shell
hugo server --port=1313 --bind=192.168.15.210 --baseURL=https://www.carlos.lh/ --liveReloadPort 443 --appendPort=false
```