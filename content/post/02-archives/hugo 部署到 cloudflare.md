---
date: 2025-03-11T21:12:53+08:00
title: hugo 部署到 cloudflare
tags:
  - Hugo
  - cloudflare
  - github
  - git
categories:
  - hugo
  - cloudflare
  - github
  - git
image: ./bg/52.jpg
author: carlos
---

## 前言

本文主题是 hugo 如何部署到 cloudflare，访问效果在国内其实和 github pages 差不多，呵呵

## 实操

选择 pages

![](../00-assets/Pasted%20image%2020250311210040.png)

选择仓库

![](../00-assets/Pasted%20image%2020250311061153.png)

根据自己实际情况填写，构建命令

```shell
hugo --gc --minify --environment production
```

![](../00-assets/Pasted%20image%2020250311210217.png)

我这里因为 github page 已经部署过了，所以再单独创建一份配置用来区分

在 `/root/hugo/config/production` 创建 `hugo.yaml` 文件，然后上传到 github，通过 `--environment production` 参数用来指定配置文件

通过 `HUGO_VERSION` 指定 hugo 版本，我这里选择 `0.125.7` 版本

![](../00-assets/Pasted%20image%2020250311210743.png)

点击“保存并部署”即可将 github 的 hugo 源文件克隆到 cloudflare，cloudflare 就会自动生成 hugo 静态文件并发布

## 删除项目

点击设置，划到最底部，点击删除即可。

![](../00-assets/Pasted%20image%2020250311061506.png)

## 补充说明

如果样式错误，可以通过参数 `--baseURL "https://custom-url.com/"` 强制指定域名完整命令

```shell
hugo --baseURL "https://custom-url.com/"
```


