---
date: 2025-03-09T22:22:02+08:00
title: open webui 长时间白屏
tags:
  - aigc
  - docker
  - deepseek
  - chatgpt
categories:
  - aigc
  - docker
  - deepseek
  - chatgpt
image: ./bg/02.jpg
author: carlos
---

## 前言

open webui 进入不了主界面，长时间白屏

![](../00-assets/Pasted%20image%2020250309221804.png)

这是因为前端页面长时间请求外国 api 接口造成的

## 解决方法

关闭  open api 即可解决，这样前端就不会访问外国的 api 接口。外国软件，本地化不是很好。

![](../00-assets/Pasted%20image%2020250309222046.png)