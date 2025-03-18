---
date: 2025-03-17T03:29:46+08:00
title: GitHub Pages 自定义域名绑定规则
tags:
  - github
  - 域名
  - dns
categories: 
image: ./bg/46.webp
author: carlos
---

## 官方限制

**每个仓库仅支持1个自定义域名**

无论是用户/组织主站（`username.github.io`）还是项目站点（`username.github.io/repo`），每个仓库的 CNAME 文件中只能包含‌一个域名‌，且仅首个域名生效‌。

**用户/组织主站的特殊限制**

每个 GitHub 账户只能存在一个用户/组织主站仓库（即 `username.github.io`），且该主站仅能绑定‌1个自定义域名‌‌。

## 突破限制的实践方案

**多仓库绑定不同域名**

通过创建多个项目仓库（如 project1、project2），每个仓库可独立绑定不同的自定义域名。例如：

- project1 仓库绑定 `domain1.com`
- project2 仓库绑定 domain2.com‌。

**通过外部服务实现多域名指向**

利用 DNS 或 CDN 服务（如 Cloudflare）进行域名重定向或转发：

- 将多个域名的 DNS 解析指向同一 GitHub Pages 仓库的服务器 IP；
- 通过 CDN 的 URL 转发规则，将不同域名跳转到目标页面‌。

## 总结

综上，‌单个 GitHub Pages 仓库仅支持1个自定义域名‌，但通过多仓库或外部服务可实现多域名间接绑定‌。