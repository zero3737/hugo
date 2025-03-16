---
date: 2025-03-14T21:12:12+08:00
title: 腾讯 dnspod dns 负载均衡
tags:
  - 域名
  - dns
  - dnspod
categories:
  - 计算机网络
image: ./bg/12.webp
author: carlos
---

## 前言

dnspod 智能 dns，别称 dns 负载均衡，呵呵，概念很好，网站访问速度 0 提升。

如果你有境内外分线解析的需要可以配置。`www.example.com` 将根据用户 IP 选择合适的线路。由于 `www.example.com` 配置的是 `CNAME` 的记录类型，访客对于分线过程无感知，浏览器地址栏不变。

cloudflare 也提供同样的服务，一般 dns 服务商都会提供这个服务，但是 cloudflare 收费，dnspod 免费，不过对网站访问速度 0 提升。而且 dnspod 只能解析 2 条域名。

![](../00-assets/Pasted%20image%2020250314202832.png)

需要额外购买域名，免费域名不支持托管 dnspod，比如：[cloudns](https://www.cloudns.net/)，一直认证失败，呵呵呵

通过以下域名比价工具购买低价域名，该工具可能随时跑路，呵呵呵呵，手慢无

[哪煮米 - 全网域名,一站比价](https://www.nazhumi.com/)

我选择 Spaceship 域名服务商，好像 7 块钱 1 年，用来测试足够了

[启动您的网站、想法和未来 - Spaceship](https://www.spaceship.com/zh/)

![](../00-assets/Pasted%20image%2020250314204957.png)

## 添加域名

将域名托管在 dnspod

![](../00-assets/Pasted%20image%2020250314205153.png)

dnspod 添加域名就能获取 dns 服务器地址

![](../00-assets/Pasted%20image%2020250314205844.png)

复制以下 dns 服务器地址，粘贴到域名服务商后台的名称服务器即可。

![](../00-assets/Pasted%20image%2020250314205925.png)

设置 dns 服务器，别称 ns 记录、name server 或者名称服务器？？？总之到你的域名服务商后台修改 dns 服务器

![](../00-assets/Pasted%20image%2020250314205512.png)

把这个改成 dnspod 提供的 dns 服务器即可，然后你的任务就是“只需等待”

![](../00-assets/Pasted%20image%2020250314205536.png)

## 智能 dns

配置智能 dns，别称 dns 负载均衡？？？

添加 2 条相同的 cname 记录就会实现 dns 负载均衡，非常的傻瓜哦。

![](../00-assets/Pasted%20image%2020250314210527.png)

还可以设置解析线路，这也太棒了吧。

![](../00-assets/Pasted%20image%2020250314210629.png)

## https 访问失败

找到“SSL 证书”

![](../00-assets/Pasted%20image%2020250314210914.png)

申请免费证书

![](../00-assets/Pasted%20image%2020250314211002.png)

默认下一步即可，认证成功就能访问 https 了

![](../00-assets/Pasted%20image%2020250314211045.png)

自动添加 txt 记录，自动认证，非常的傻瓜哦

![](../00-assets/Pasted%20image%2020250314211143.png)



