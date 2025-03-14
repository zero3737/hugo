---
date: 2025-03-15T00:05:46+08:00
title: github pages 默认 cdn
tags:
  - github
  - cdn
categories: 
image: ./bg/46.webp
author: carlos
---

## 前言

介绍 github pages 默认 cdn 服务

## 介绍

GitHub Pages 默认启用了基础的 CDN 加速服务，但其加速范围主要面向全球网络而非特定区域。

 ‌**默认 CDN 情况‌**

- GitHub Pages ‌自带基础 CDN 加速‌，无论使用默认的 xxx.github.io 域名还是自定义域名，均通过 GitHub 的 CDN 分发静态资源‌。
- 该 CDN 的节点分布以‌海外为主‌，国内访问时可能出现速度不稳定或延迟较高的情况‌。

**加速优化方案**

若需提升国内访问速度，可额外配置第三方 CDN 服务

- 海外 CDN‌（如 Cloudflare）：通过修改 DNS 解析将域名指向 CDN 服务商，利用其全球节点加速访问‌。
- 国内 CDN‌（如阿里云/腾讯云）：需备案域名后，将源站设置为 GitHub Pages 默认域名，并通过 CDN 服务商缓存资源，优化国内线路‌。

综上，GitHub Pages 默认提供基础 CDN，但如需针对性优化访问速度（尤其是国内），需自行集成第三方服务‌。

