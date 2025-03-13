---
date: 2025-03-13T18:47:06+08:00
title: hugo 配置 webp 图片压缩
tags:
  - Hugo
  - github
  - linux
  - ubuntu
categories: 
image: ./bg/06.webp
author: carlos
---

## 前言

hugo 整合 cwebp，自动化工作流。

‌cwebp 是谷歌官方开发的工具‌，属于 WebP 技术套件的一部分。该工具专门用于将其他格式的图片（如 PNG、JPEG）转换为 WebP 格式，其核心功能围绕谷歌提出的 WebP 图像格式标准实现‌。

## 安装

**更新软件包列表**

```shell
sudo apt update
```

**安装 webp 工具包**

```shell
sudo apt install webp
```

**验证安装**

```shell
cwebp -version
```

## 压缩脚本

将路径替换成脚本内容

```shell
# 示例脚本：convert_images.sh
# 说明 hugo 图片压缩脚本，需要安装 cwebp
#!/bin/bash

# 遍历 content/images 目录下的 PNG/JPG 图片
find /root/hugo/static/bg -type f -name "*.png" -o -name "*.jpg" | while read img; do
  webp_path="${img%.*}.webp"
  # 调用 cwebp 转换（需提前安装 cwebp 工具）
  cwebp -q 80 "$img" -o "$webp_path"
done
```

## 修改模板文件

修改文章图片

![](../00-assets/Pasted%20image%2020250313184235.png)

`/root/hugo/themes/hugo-theme-stack/layouts/_default/_markup/render-image.html`

```html
{{- $originalURL := $fullURL -}}
{{- $webpURL := replaceRE `(\.[a-z]+)$` `.webp` $originalURL | relURL -}}
{{- $decodedPath := replace $webpURL "%20" " " -}}
{{- $webpExists := fileExists (path.Join "static" (strings.TrimPrefix "/" $decodedPath)) -}}
<a data-fancybox="gallery" 
   href="{{ if $webpExists }}{{ $webpURL }}{{ else }}{{ $originalURL }}{{ end }}"
   data-webp="{{ $webpURL }}"
   data-original="{{ $originalURL }}"
   class="webp-fancybox">
  
  <picture>
    {{ if $webpExists }}
    <!-- 第一重回退：服务端确认存在的 WebP -->
    <source srcset="{{ $webpURL }}" type="image/webp">
    {{ end }}
    
    <!-- 终极回退：原始图片 -->
    <img src="{{ $originalURL }}"
         alt="{{ .Text }}"
         {{ with .Title }}title="{{ . }}"{{ end }}
         loading="lazy"
         data-fallback>
  </picture>
</a>
```

修改封面

![](../00-assets/Pasted%20image%2020250313184258.png)

`/root/hugo/themes/hugo-theme-stack/layouts/partials/article/components/header.html`

```html
<!-- 自定义变量 -->
{{- $originalPath := $image.permalink -}}
{{- $webpPath := replaceRE `(\.[a-z]+)$` `.webp` $originalPath -}}
{{- $webpExists := fileExists (path.Join "static" $webpPath) -}}
<picture class="webp-fallback">
	{{ if $webpExists }}
	  <source srcset="{{ $webpPath }}" type="image/webp">
	{{ end }}
	<img src="{{ $originalPath }}" 
		 loading="lazy" 
		 alt="Featured image of post {{ .Title }}">
  </picture>
```

修改归档图片

![](../00-assets/Pasted%20image%2020250313184331.png)

`/root/hugo/themes/hugo-theme-stack/layouts/partials/article-list/compact.html`

```html
<!-- 自定义变量 -->
{{- $originalPath := $image.permalink -}}
{{- $webpPath := replaceRE `(\.[a-z]+)$` `.webp` $originalPath -}}
{{- $webpExists := fileExists (path.Join "static" $webpPath) -}}
<picture class="webp-fallback">
	{{ if $webpExists }}
	  <source srcset="{{ $webpPath }}" type="image/webp">
	{{ end }}
	<img src="{{ $originalPath }}" 
		 loading="lazy" 
		 alt="Featured image of post {{ .Title }}">
  </picture>
```

## github  action

添加代码

```yaml
      - name: Install cwebp
        run: sudo apt-get install webp

      - name: Compress images
        run: |
          chmod +x /home/runner/work/hugo/hugo/convert_images.sh
          /home/runner/work/hugo/hugo/convert_images.sh
```

完整代码截图，根据自己实际情况添加

![](../00-assets/Pasted%20image%2020250313184553.png)

这样在提交代码的时候，就会自动化压缩图片以及 hugo 生成静态文件