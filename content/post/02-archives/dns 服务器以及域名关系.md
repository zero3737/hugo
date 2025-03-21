---
date: 2025-03-14T23:12:38+08:00
title: dns 服务器以及域名关系
tags:
  - dns
  - 域名
categories:
  - 计算机网络
image: ./bg/38.webp
author: carlos
---

## 前言

dns 服务器和域名关系，用来确定是否需要搭建 dns 服务器。

## dns 服务器

自建完 dns  服务器需在域名注册商处将域名 NS（Name Server）记录指向您自建的 DNS 服务器 IP 地址，完成域名托管权转移‌。

## 域名

**公网访问的强制要求**

若需通过‌标准域名（如example.com）‌在公网被广泛访问，则必须购买合法域名并完成备案‌。公共DNS系统仅解析已注册且备案的域名，否则外部用户无法通过域名访问您的服务‌。

**私有网络或小范围访问的替代方案**

自定义域名（无需购买）‌：通过自建DNS服务器定义私有域名（如myhome.local），可在局域网或指定设备间直接访问‌。

**完全自定义域名，并且公网解析**

在自建 DNS 服务器中配置权威解析（如`my.site`），并将域名NS记录指向您的服务器 IP

需购买域名并拥有其管理权，否则公共DNS系统不会认可您的解析记录‌

## 自定义顶级域名

在公网上解析完全自定义的顶级域名（如 `baidu.carlos2016`）存在技术限制，因为公共互联网的DNS系统仅识别 ICANN 授权的标准顶级域名（如 .com、.net 等）。

仅需在内部网络使用 `baidu.carlos2016` 这类域名，可自建DNS服务器。使用Bind或CoreDNS等工具搭建私有DNS服务器，并配置权威解析‌。

**公网限制**：自定义顶级域名（如 .carlos2016）无法在公网被全球DNS系统识别，仅适用于私有网络或特定DNS覆盖范围‌。

若需公网访问，必须注册ICANN认可的顶级域名（如 .com、.app）或其子域名‌。

## 域名层级管理

**根域名（Root Domain）**：DNS层级的最顶端，用空标签 `.` 表示（通常省略）。

**示例**：`www.example.com.`（末尾的 `.` 表示根域名，实际使用中常省略为 `www.example.com`）。

**顶级域名**：紧接在根域名之下的层级，分为两类

- ‌通用顶级域名（gTLD）‌：如 .com、.net、.org
- ‌国家/地区顶级域名（ccTLD）‌：如 .cn（中国）、.us（美国）

‌作用‌：标识域名的类别或归属地。

**示例‌**：example.com 中的 .com 是顶级域名。

**次级域名**：位于顶级域名下方，由用户注册的独特名称。标识具体组织、品牌或服务。

**示例**：`example.com` 中的 `example` 是次级域名。

**子域名**：在次级域名下进一步划分的层级，可多层嵌套。用于分类服务（如 `blog.example.com`）、环境（如 `dev.example.com`）或地理位置。

**示例**：`mail.server.example.com` 中的 server 是子域名，mail 是更下一层的子域名。

**主机名**：域名最左侧的部分，标识网络中的具体设备或服务。指向服务器、虚拟机或服务的IP地址。

**示例**‌：`www.example.com` 中的 `www` 是主机名，表示Web服务器。



