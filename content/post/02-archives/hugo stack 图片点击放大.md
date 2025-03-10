---
date: 2025-03-09
title: hugo stack 图片点击放大
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/40.jpg
author: carlos
---

## 前言

本文主题是实现 hugo stack 主题，点击图片放大的功能。

![](../00-assets/Pasted%20image%2020250309005606.png)

原来图片很小，不方便自己查看，比如这里，根本看不清楚日志。

![](../00-assets/Pasted%20image%2020250309005706.png)

## 实操

修改 config.toml 或者 hugo.yaml

![](../00-assets/Pasted%20image%2020250309005917.png)

添加配置，编辑 `/root/hugo` 主目录下的 hugo.yaml，我的 Ubuntu 环境
```yaml
params:
    fancybox: true
```

路径为`/layouts/_default/_markup/render-image.html` 添加内容为

```html
{{if .Page.Site.Params.fancybox }}
<div class="post-img-view">
	<a data-fancybox="gallery" href="{{ $Permalink }}">
		<img loading='lazy' src="{{ $Permalink }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
	</a>
</div>
{{ end }}
```

路径为 `/root/hugo/themes/hugo-theme-stack/layouts/partials/footer`，编辑 `custom.html` 内容为：

```html
{{if .Page.Site.Params.fancybox }}
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
{{ end }}
```

重启 hugo 服务即可实现点击图片放大功能。