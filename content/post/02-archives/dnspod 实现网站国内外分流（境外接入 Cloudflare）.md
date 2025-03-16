---
date: 2025-03-16T23:39:50+08:00
title: dnspod 实现网站国内外分流（境外接入 Cloudflare）
tags:
  - cloudflare
  - dnspod
  - dns
  - 域名
categories: 
image: ./bg/50.webp
author: carlos
---

## 前言

阿里云云解析 DNS / 腾讯云 DNSPod 支持境内外分线解析，`blog.uuanqin.top` 将根据用户 IP 选择合适的线路。由于 `blog.uuanqin.top` 配置的是 CNAME 的记录类型，访客对于分线过程无感知，浏览器地址栏不变。

境内用境内 CDN，境外用境外 CDN，取长补短。为了更加节省开支或避免由于攻击造成的高额账单，国内线路可以不用 CDN，直接连接国内源站。

阿里云云解析 DNS / 腾讯云 DNSPod 支持境内外分线解析，`blog.uuanqin.top` 将根据用户 IP 选择合适的线路。由于 `blog.uuanqin.top` 配置的是 `CNAME` 的记录类型，访客对于分线过程无感知，浏览器地址栏不变。

至于国内 CDN 或源站的选择看你自己的情况，文章主要将介绍两个操作重点：

- 使用腾讯云 DNSPod 进行线路选择
- CNAME 方式接入 Cloudflare

dnspod 实现网站国内外分流，需两个域名配合。免费域名托管到 Cloudflare 开启免费  cdn，收费域名托管在 DNSPod，用来实现 dns 负载均衡（别称智能 dns???）

## Cloudflare 控制台

根据自己情况，添加 dns 记录，用来开启 Cloudflare cdn 服务。我这里填写免费域名，用来开启 cdn

![](../00-assets/Pasted%20image%2020250316232157.png)

## DNSPod 控制台

DNSPod 配置 3 条线路类型：国内、国外、默认。国内路线解析到国内源站，国外线路解析到 Cloudflare 免费 cdn 域名，实现国内外分流

![](../00-assets/Pasted%20image%2020250316233413.png)

## 验证

连接机场节点测试，返回 Cloudflare 特有的标记

![](../00-assets/Pasted%20image%2020250316233703.png)

关闭机场节点测试，返回国内源站特有信息。

![](../00-assets/Pasted%20image%2020250316233800.png)

国内外测试返回不同的信息，证明 DNSPod dns 负载均衡配置成功。





