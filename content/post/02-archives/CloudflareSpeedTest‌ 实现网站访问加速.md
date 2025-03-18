---
date: 2025-03-17T02:59:02+08:00
title: CloudflareSpeedTest‌ 实现网站访问加速
tags:
  - cloudflare
  - cdn
  - 域名
  - dns
categories: 
image: ./bg/02.webp
author: carlos
---

## 获取工具与基础配置

**下载项目文件**

访问 [XIU2/CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest) 的 Releases 页面，下载对应系统的可执行文件（支持 Windows/Linux/macOS）‌。

**解压与运行**

- Windows 用户双击运行 CloudflareST.exe；
- Linux/macOS 用户需通过命令行解压并赋予执行权限：

```shell
tar -zxf CloudflareST_linux_amd64.tar.gz
chmod +x CloudflareST
./CloudflareST
```

## 测速与优选 IP

**基础测速命令**

直接运行程序会默认测试 IPv4/IPv6 的延迟和下载速度，输出结果按延迟从低到高排序。示例命令：

```shell
./CloudflareST -dd -tll 90  # 测试延迟≤90ms的IP，并验证下载速度
```

参数说明：

- `-dd`：测试下载速度；
- `-tll`：限制延迟阈值‌。

**筛选最佳 IP**

测速完成后，结果中会标注延迟（Latency）和下载速度（Speed）。推荐选择延迟低且下载速度稳定的 IP 地址‌。

## 应用优选 IP 至网站

**DNS 解析配置**

- 登录 Cloudflare 控制台，进入域名管理页面；
- 修改 A/AAAA 记录，将 IP 地址替换为优选后的 IP；
- 若需动态更新，可结合 DDNS 工具或定时任务定期执行测速并更新解析记录‌。

**CNAME 加速方案（进阶）**

- 将域名 CNAME 指向已优选 IP 的其他域名；
- 通过 Cloudflare SaaS 回源，实现加速与负载均衡（需域名已接入 Cloudflare）‌。

## 其他优化建议

- 定期更新 IP 列表‌：Cloudflare IP 段可能动态调整，建议每周或每月重新测速‌；
- 关闭代理工具‌：测速时需关闭 VPN/代理，避免结果偏差‌；
- ‌多节点备份‌：优选 3-5 个 IP 备用，防止单节点失效‌。

## 总结

通过上述操作，可有效优化 Cloudflare CDN 的访问速度，降低延迟并提升下载性能。若需进一步加速，可结合 Cloudflare Tunnel 实现免端口访问与内网穿透‌。

