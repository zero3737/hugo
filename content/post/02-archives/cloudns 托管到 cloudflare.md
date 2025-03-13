---
date: 2025-03-13T02:28:40+08:00
title: cloudns 托管到 cloudflare
tags:
  - github
  - cloudflare
  - 域名
categories:
  - 计算机网络
image: ./bg/40.webp
author: carlos
---

## 前言

cloudns(免费域名)托管到 cloudflare，正常购买的域名，只要在域名服务商管理后台添加 2 条 dns 记录，就能正常托管 cloudflare，但是免费域名需要额外配置。

## 操作

注册cloudns：[地址1](https://www.cloudns.net/)

一个账号只能申请一个域名，点击这里申请

![](../00-assets/Pasted%20image%2020250313015351.png)

申请免费域名即可

![](../00-assets/Pasted%20image%2020250313015415.png)

点击申请的域名，进行 dns 记录添加

![](../00-assets/Pasted%20image%2020250313015446.png)

然后 cloudflare 域名托管，默认操作即可，点击下一步，点击下一步

![](../00-assets/Pasted%20image%2020250313015648.png)

域名管理后台添加 dns 记录，根据自己实际情况填写

```txt
类型 NS 主机 留空 指向到 ready.ns.cloudflare.com
类型 NS 主机 留空 指向到 auth.ns.cloudflare.com
类型 NS 主机 _acme-challenge 指向到 ready.ns.cloudflare.com
类型 NS 主机 _acme-challenge 指向到 auth.ns.cloudflare.com
类型 CNAME 主机 * 指向到 ready.ns.cloudflare.com
```

将 ns 记录改成自己的

![](../00-assets/Pasted%20image%2020250313015841.png)

dns 记录配置参考，正常域名只要添加 2 条 ns 记录就能托管在 cloudflare，但是我用的是免费域名

![](../00-assets/Pasted%20image%2020250313020057.png)

添加 7 条 dns 记录，可以不用配置 cloudflare 边缘证书，也不用更改“SSL/TLS 加密”模式

```txt
类型 NS 主机 留空 指向到 ready.ns.cloudflare.com
类型 NS 主机 留空 指向到 auth.ns.cloudflare.com
类型 NS 主机 _acme-challenge 指向到 ready.ns.cloudflare.com
类型 NS 主机 _acme-challenge 指向到 auth.ns.cloudflare.com
类型 NS 主机 maintunnel 指向到 ready.ns.cloudflare.com
类型 NS 主机 maintunnel 指向到 auth.ns.cloudflare.com
类型 CNAME 主机 * 指向到 maintunnel.mydns.ip-ddns.com
```

**如果使用的是7条域名记录，那么须要在cloudflare添加一条CNAME记录**

- 类型 CNAME 主机 maintunnel 指向到 `fast-fast.asuscomm.com`
- 或指向到 `cloudflare.182682.xyz`

看这个域名应该是使用第三方服务，呵呵。

以上是实现了子级域名的基本操作，以后子级域名只需要在cloudflare上操作即可。

对于主域名 mydns.ip-ddns.com 的解析操作分为两种情况（假设服务器IP是 10.20.30.40）
完全走CDN 【推荐使用这种方案】

```txt
#cloudns
类型 A 主机 留空 指向到 104.18.15.19
#cloudflare 开启小黄云
类型 A 主机 @ 指向到 10.20.30.40 并开启小黄云
```

完全不走 CDN 【仅需要原始解析时使用】

```txt
#cloudns
类型 A 主机 留空 指向到 10.20.30.40
#cloudflare 不开启小黄云
类型 A 主机 @ 指向到 10.20.30.40
```

最后回到 cloudflare,大概 5 分钟左右就会看到域名已经生效可用。不管是 A、AAAA 还是隧道都要记得开启小黄云`Proxied`

经过以上的操作就可以让 cloudns 在 cloudflare 上愉快的撒欢了。

我这里为 github pages 套 cdn，cloudflare dns 记录添加 a 记录指向以下 ip 地址即可

```txt
185.199.108.153 
185.199.109.153 
185.199.110.153 
185.199.111.153
```

参考配置

![](../00-assets/Pasted%20image%2020250313021313.png)

然后在 cloudns 域名管理后台添加一条 a 记录，ip 地址为默认 ip，不需要改变，照着抄就可以了，应该是 cloudflare ip 地址

![](../00-assets/Pasted%20image%2020250313021422.png)

## https 访问失败

如果添加 5 条记录，https 访问会不正常，需要域名添加 txt 记录进行认证，边缘证书认证成功截图

![](../00-assets/Pasted%20image%2020250313021641.png)

如果是“txt 待认证”需要在域名管理后台添加 txt 记录进行认证，根据实际情况填写

![](../00-assets/Pasted%20image%2020250313021813.png)

也可以在 cloudflare 进行添加 txt 记录

![](../00-assets/Pasted%20image%2020250313021927.png)

txt 认证成功，删除即可，没什么鸟用，一般都是自动化认证的，呵呵。通过工具（如 `acme.sh` 或 `Certbot`）集成 Cloudflare 的 DNS API，自动完成 TXT 记录的添加和删除。

## 「重定向的次数过多」解决方案

如果浏览器出现「重定向的次数过多」，需要额外配置 ssl 加密模型

![](../00-assets/Pasted%20image%2020250313022409.png)

选择任意两个都可以

![](../00-assets/Pasted%20image%2020250313022432.png)

## 验证成功

域名命令，出现 cf 特殊字段即可表示 cdn 开启成功，我这里给 github pages 套了 cdn

```cmd
curl -I https://www.carlos.ip-ddns.com
```

![](../00-assets/Pasted%20image%2020250313022602.png)

或者 ping 自己的主机名，没有出现 github ip 地址表示开启 cdn 成功

```txt
ping www.carlos.ip-ddns.com
```

![](../00-assets/Pasted%20image%2020250313022806.png)