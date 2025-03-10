---
date: 2025-03-09
title: hugo stack 主题添加 b 站图标跳转个人主页配置
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/38.jpg
author: carlos
---

## 前言

本文主题是如何实现 hugo stack 主题添加 b 站图标（或者是称作徽标？）跳转个人主页配置

![](../00-assets/Pasted%20image%2020250309023944.png)

就是添加这么一个小图标的功能，点击即可跳到 b 站的个人主页

## 实操

下载对应图标：[地址1](https://tabler.io/icons)

保存格式为 svg，然后将资源放到 `/root/hugo/themes/hugo-theme-stack/assets/icons` 目录下

![](../00-assets/Pasted%20image%2020250309024420.png)

我的文件为 `bilibili.svg`

![](../00-assets/Pasted%20image%2020250309024514.png)

添加对应配置文件即可。

```yaml
menu:
    main: []
    social:
        - identifier: github
          name: GitHub
          url: https://github.com/zero3737
          weight: 1  # 权重值，决定图标在导航栏中的位置，越小越靠前
          params:
              icon: brand-github
        - identifier: bilibili
          name: Bilibili
          url: "https://space.bilibili.com/4069668"  # 替换为你的 B 站个人主页链接
          weight: 2  # 权重值，决定图标在导航栏中的位置，越小越靠前
          params:
              icon: bilibili  # 图标的名称，应与你放置在 `assets/icons/` 目录下的文件名（不带扩展名）一致
```

重启服务器，即可添加完成。

