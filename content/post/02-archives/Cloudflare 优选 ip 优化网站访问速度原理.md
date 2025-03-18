---
date: 2025-03-17T02:48:02+08:00
title: Cloudflare 优选 ip 优化网站访问速度原理
tags:
  - cloudflare
  - 域名
  - cdn
categories:
  - 计算机网络
image: ./bg/02.webp
author: carlos
---

## 优选 IP 优化原理

**节点优选**

通过筛选全球范围内延迟最低、带宽最优的 Cloudflare 节点 IP，将用户请求定向到最佳边缘节点，减少数据传输距离和网络拥堵‌。

**缓存加速**

静态资源（如图片、CSS/JS 文件）缓存在优选节点，用户可直接从边缘节点获取内容，降低源服务器负载和响应时间‌。

**智能路由**

Cloudflare 实时分析全球网络状态，动态调整路由路径，避开拥堵或故障线路，提升访问稳定性‌。

## 控制台操作流程（优选 IP 配置）

**域名准备**

- 主域名（如 `www.example.com`）用于常规访问，DNS 解析托管在原有服务商（如阿里云）
- 次要域名（如 cf.example.com）接入 Cloudflare，用于绑定优选 IP 和源服务器‌。‌

### Cloudflare 配置步骤

**添加次要域名**

登录 Cloudflare 控制台，添加次要域名并完成 DNS 解析验证‌。

**设置 DNS 记录**

- 创建 A 或 CNAME 记录（如 `cloudflare.example.com`），指向源服务器 IP 或域名。
- 启用代理状态（小黄云图标亮起），开启 CDN 加速‌。

**SSL/TLS 设置**

选择“完全”或“灵活”模式，绑定自定义主机名并配置证书‌。

**优选 IP 绑定与分流**

- 在 DNS 记录中添加优选 IP 的 A 记录（如 优选IP1、优选IP2），设置权重或分线路（如境外线路）‌。
- 通过 ‌Page Rules‌ 或 ‌Workers‌ 脚本实现动态 IP 调度（如根据用户地理位置分配节点）‌。

**性能优化与测试**

- 缓存策略‌：在 ‌Caching‌ 中设置 Browser/Cache TTL，启用 Tiered Cache 分层缓存‌。
- ‌性能测试‌：使用 Cloudflare Observatory 或第三方工具（如 WebPageTest）验证加载速度和首屏时间‌。

## 动态调度进阶方案

- Workers 脚本‌：编写脚本实现智能路由，例如根据用户 IP 所在地区自动分配最优节点‌。
- 双 CDN 分流‌：国内用户走本地 CDN（如阿里云），境外用户通过 Cloudflare 优选 IP 加速‌。

