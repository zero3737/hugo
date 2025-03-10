---
date: 2025-03-06
title: hugo 入门篇
tags:
  - Hugo
  - 笔记
  - obsidian
categories:
  - hugo
  - 笔记
  - obsidian
image: ./bg/49.jpg
author: carlos
---

## 前言

本文是在 ubuntu 环境中安装 hugo。

## 安装

安装命令

```sh
sudo apt update
sudo apt -y install hugo
```

验证是否安装成功

```
hugo version
```

安装成功会显示如下信息。

![3a70e88f90cd0095f62fc5a4db7bea9c.png](../_resources/3a70e88f90cd0095f62fc5a4db7bea9c.png)

## 启动与配置

创建站点目录

```sh
hugo new site quickstart
```

将主题文件放到站点目录中的 themes 目录下

![40b6311d8afdc67f7c5375a424df3e59.png](../_resources/40b6311d8afdc67f7c5375a424df3e59.png)

启动 hugo 服务

```sh
hugo server
```

### 绑定到 0.0.0.0

hugo server 默认绑定到 127.0.0.1（localhost），因此只能在本机访问。

```sh
hugo server --bind="0.0.0.0"
```

在启动 hugo server 时，使用 --bind 参数将其绑定到 0.0.0.0，这样可以监听所有网络接口。

这样，局域网内的其他设备可以通过你的服务器 IP 地址访问 Hugo 服务。例如，如果服务器的 IP 是 192.168.1.100，可以通过 `http://192.168.1.100:1313` 访问。

### 指定端口号

如果需要指定端口号，可以使用 -p 参数：

```sh
hugo server --bind="0.0.0.0" -p 1234
```

### 设置 baseURL

如果页面资源加载失败或样式错乱，可能是因为 baseURL 默认指向 localhost。可以通过 --baseURL 参数指定为服务器的 IP 地址：

```
hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.100/"
```

将 `192.168.1.100` 替换为你的实际服务器 IP。

## 主题

- 把 hugo_blog/themes/hugo-theme-stack/exampleSite/config.yaml 文件拷贝到 hugo_blog 目录下。
- 把 hugo_blog/themes/hugo-theme-stack/exampleSite/content 目录下的文件拷贝到 hugo_blog 目录下。

hugo-theme-stack 主题有样例配置文件作为参考，直接复制粘贴即可。

## 头部元数据

Hugo 的 ‌Front Matter‌（文件头部元数据）定义了内容的核心参数，控制页面生成、URL 结构和内容管理。

| 参数          | 说明                                |
| ----------- | --------------------------------- |
| slug        | 自定义文章 URL 末尾部分，优先级高于标题（title）‌    |
| draft       | 标记是否为草稿（true/false），草稿默认不发布到生产环境‌ |
| categories  | 类别                                |
| tags        | 标签                                |
| image       | 定义文章或页面的封面图                       |
| title‌      | 定义页面标题                            |
| date        | 设置内容发布日期，控制文章在列表中的排序              |
| description | 提供页面摘要描述，用于 SEO 优化和社交媒体分享         |
| weight      | 控制内容在列表或菜单中的排序权重                  |
| author      | 声明文章作者信息，支持多作者配置                  |

categories 和 tags

```yaml
categories = ["技术", "前端"]  # 支持多层级  
tags = ["Hugo", "静态站点"]     # 多个标签以数组形式定义‌:ml-citation{ref="1" data="citationList"}  
```

image 基础用法，需将图片存放在 static 目录下，通过相对路径引用‌。

```yaml
image = "/img/logo3.png"  # 对应 static/img/logo3.png  
```

支持 http 远程调佣

```yaml
image = "https://example.com/cover.jpg"
```

## 文章不同元数据模板

‌TOML 格式‌编写元数据，用来兼容 hugo

```toml
+++
date = "{{date:YYYY-MM-DD}}"
title = "{{title}}"
tags = ["Hugo", "静态站点"]
categories = ["技术", "前端"]
description = "hello world!"
image = "https://api.timelessq.com/bing/random"
author = "carlos"
+++
```

YAML 格式‌编写元数据

```yaml
---
title: "示例文章"
date: 2025-03-06
draft: false
---
```

JSON 格式

```json
{
  "title": "示例文章",
  "date": "2025-03-06",
  "draft": false
}
```