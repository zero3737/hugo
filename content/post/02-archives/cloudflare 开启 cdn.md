---
date: 2025-03-13T00:39:30+08:00
title: cloudflare 开启 cdn
tags:
  - cloudflare
categories:
  - 计算机网络
image: ./bg/30.webp
author: carlos
---

## 前言

本文主要介绍网站如何在 cloudflare 上开启 cdn

## 操作

在 cloudflare 上添加域名

![](../00-assets/Pasted%20image%2020250312184752.png)

默认下一步即可，这里保存名称服务器（Name Servers）

![](../00-assets/Pasted%20image%2020250312184915.png)

在域名注册商后台添加 ns 记录（Name Servers），我这里的是免费域名：[地址1](https://www.cloudns.net/)

![](../00-assets/Pasted%20image%2020250312185307.png)

不同域名注册商操作不一样，但是都是大同小异，都是添加 dns 记录，成功截图

![](../00-assets/Pasted%20image%2020250312185451.png)

在 Cloudflare 的 DNS 管理页面中，每个解析记录左侧的云朵图标‌需处于橙色点亮状态（表示流量经过 CDN）。灰色状态则代表直连服务器，未启用加速。

要求域名支持托管，不然任何设置都白费。

![](../00-assets/Pasted%20image%2020250312185627.png)

我这里主机名是 blog，橙色云朵表示已经开启 cdn

**SSL/TLS 模式配置**

需在 Cloudflare 后台的 SSL/TLS 设置中选择 ‌Full‌ 或 ‌Full (Strict)‌ 模式，否则 HTTPS 请求可能无法通过 CDN 加密传输。

![](../00-assets/Pasted%20image%2020250313003453.png)

使用 CloudFlare 导致网站「重定向的次数过多」，记得点击一下，选择“完全”或者“完全（严格）”

## 验证 CDN 是否生效

**Ping 检测**

在终端执行 `ping yourdomain.com`，若返回的 IP 地址与源服务器不同（显示为 Cloudflare 边缘节点 IP），则 CDN 生效 ‌。

我这里 `ping www.carlos.ip-ddns.com`，记录 ip 地址，这里是 github 地址，cdn 开启不成功

![](../00-assets/Pasted%20image%2020250312192236.png)

命令 `curl -I https://www.carlos.ip-ddns.com` ，返回 github，没有 cf 特俗字段，cdn 还是没有开启成功

![](../00-assets/Pasted%20image%2020250312204322.png)

ubuntu 命令 `dig www.carlos.ip-ddns.com +short`，返回 github，懂的都懂，cdn 还是没有开启成功。

![](../00-assets/Pasted%20image%2020250312210715.png)

正常情况，根域名添加 ns 记录，cf 控制台添加子域名 cname 记录，根域名 a 记录指向你的服务器 ip 地址，应该是可以开启 cdn 的，可能免费域名的缘故，没有开启 cdn 成功。

![](../00-assets/Pasted%20image%2020250312204135.png)

cloudflare 域名管理那里手动添加同样的 dns 记录，我这个免费域名不支持托管，心累

![](../00-assets/Pasted%20image%2020250312192459.png)




