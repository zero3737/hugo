---
date: 2025-03-17T01:06:08+08:00
title: Cloudflare 配置自定义主机回退源，实现优选 ip
tags:
  - cloudflare
categories: 
image: ./bg/08.webp
author: carlos
---

## 域名准备

- 主域名‌（如a.com），用于对外访问，无需直接接入Cloudflare，但需支持DNS解析‌。
- ‌回源域名‌（如b.com或saas.b.com），需通过NS记录完全托管至Cloudflare，并指向源站服务器IP‌。

## 回源域名配置

**DNS解析设置**

- 添加A记录：将子域名（如origin.b.com）指向源站服务器IP，并开启代理（小黄云）‌。
- 添加CNAME记录：创建CDN子域名（如cdn.b.com），指向Cloudflare提供的泛播IP（如cloudflare.xxx.xyz），关闭代理‌。

**SSL/TLS设置**

- 进入回源域名的SSL/TLS → 自定义主机名 → 设置回退源为origin.b.com‌。
- 添加主域名（a.com）作为自定义主机名，并完成TXT验证（需在主域名DNS中添加指定TXT记录）‌。

## 主域名DNS配置

**CNAME记录**

将主域名（a.com）CNAME指向回源域名的CDN子域名（如cdn.b.com），关闭代理‌。

**子域名扩展**

若需添加子域名（如blog.a.com），需在自定义主机名中添加该子域名，并在主域名DNS中配置对应的CNAME记录‌。

## 验证与优化

**验证生效**

检查主域名解析状态，确保SSL证书已签发（约需10分钟）‌。

**优选IP机制**

- Cloudflare的泛播IP会根据用户地理位置自动分配最优节点，无需手动指定IP‌。
- 若需进一步优化，可通过工具（如`CloudflareSpeedTest`）测试本地最佳IP，并更新CNAME记录‌。

## `cloudflare.xxx.xyz` 域名的来源

**Cloudflare自动分配**

此域名是Cloudflare为每个账户‌自动生成的泛播IP入口‌，用于通过CNAME记录间接接入其全球CDN网络。用户无需手动获取，只需在配置SaaS自定义主机名时，根据提示填入系统提供的默认泛播域名格式（如example.cloudflare.net或cdn.example.cloudflare.com）‌。

**查看方式**

在回源域名的Cloudflare控制面板中，进入 ‌SSL/TLS → 自定义主机名 → 回退源设置‌，系统会显示当前账户绑定的泛播域名，格式通常为`[随机字符].cloudflare.xxx.xyz‌`。
## 费用说明

**基础功能免费**

Cloudflare的泛播IP、CDN加速、SSL证书、基础DNS解析等功能均免费提供，无需绑定信用卡或付费套餐‌。

**高级功能付费**

- SaaS自定义主机名‌：需绑定信用卡验证，但基础使用（如回退源配置）仍免费‌。
- 内网穿透（Cloudflare Tunnel）‌：完全免费，不限流量和节点数量‌。

**注意事项**

付费功能‌：SaaS自定义主机名需绑定信用卡或 PayPal‌。