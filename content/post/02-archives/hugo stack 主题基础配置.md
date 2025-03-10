---
date: 2025-03-07
title: hugo stack 主题基础配置
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/09.jpg
author: carlos
---

## 前言

本文是说明 hugo 基础配置，比如配置网站图标以及汉化主题等等。

## hugo 网站图片

hugo 配置文件，搜索 favicon 即可，填入图标地址即可。

![](../00-assets/Pasted%20image%2020250307035003.png)

## stack 网站主页头像

要修改 hugo 主页头像，不同主题修改方式不一样，以 stack 主题为例，将头像放到对应目录即可。

![](../00-assets/Pasted%20image%2020250307043911.png)

我的是 `/root/hugo/themes/hugo-theme-stack/assets/img` 目录下。

## 配置推广链接

我使用的 stack 主题，不同主题修改方式不同。

搜索 github，修改成自己 github 主页地址。

![](../00-assets/Pasted%20image%2020250307054226.png)

## 侧边栏汉化

侧边栏部分英文，需要修改页面数据。

![](../00-assets/Pasted%20image%2020250308013647.png)

找到对应目录，编辑 md 文件即可。

![](../00-assets/Pasted%20image%2020250308013407.png)

以 archives 为例，修改成“归档”即可。

![](../00-assets/Pasted%20image%2020250308013933.png)

## Language

如果只想保持一种语言，则 config 中的 language 只保留一种语言，如中文：

```yaml
languages:
    zh-cn:
        languageName: 中文
        weight: 1
```

![](../00-assets/Pasted%20image%2020250308023414.png)

## 友链、归档多列显示

`/root/hugo/themes/hugo-theme-stack/assets/scss` 自定义 `custom.scss` 样式

```css
@media (min-width: 1024px) {
  .article-list--compact {
    display: grid;
    // 目前是两列，如需三列，则后面再加一个1fr，以此类推
    grid-template-columns: 1fr 1fr;
    background: none;
    box-shadow: none;
    gap: 1rem;

    article {
      background: var(--card-background);
      border: none;
      box-shadow: var(--shadow-l2);
      margin-bottom: 8px;
      margin-right: 8px;
      border-radius: 16px;
    }
  }
}
```

## 删除归档页面中的分类

定位 `/root/hugo/themes/hugo-theme-stack/layouts/_default` 目录，编辑 `archives.html` 文件即可

![](../00-assets/Pasted%20image%2020250308035843.png)

注释图中 html 片段即可

![](../00-assets/Pasted%20image%2020250308040444.png)

## 归档页面添加标签

在 `layouts/_default/archives.html` 里的 `</header>` 后面加上如下代码：

```html
{{- $taxonomy := $.Site.GetPage "taxonomyTerm" "tags" -}}
{{- $terms := $taxonomy.Pages -}}
{{ if $terms }}
<section class="widget tagCloud">
<h2 class="section-title">{{ $taxonomy.Title }}</h2>

    <div class="tagCloud-tags">
        {{ if ne (len $.Site.Taxonomies.tags) 0 }}
            {{ range $name, $taxonomy := $.Site.Taxonomies.tags }}
                {{ $tagCount := len $taxonomy.Pages }}
                <a href="{{ "/tags/" | relURL }}{{ $name | urlize }}" class="tagCloud-tags">
                    {{ $name }}<span class="tagCloud-count">{{ $tagCount }}</span>
                </a>
            {{ end }}
        {{ end }}
    </div>
<section>
{{ end }}
```

`/root/hugo/themes/hugo-theme-stack/assets/scss` 自定义 `custom.scss` 样式

```css
.tagCloud {
    .tagCloud-count {
        color: var(--body-text-color);
    }
}
```

## 引入动态背景


定位 `/root/hugo/themes/hugo-theme-stack/layouts/partials/footer` 编辑 `custom.html`

```html
<div id="particles-js"></div>

<script src="https://cdn.bootcdn.net/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
<script>
  particlesJS.load('particles-js', "https://letere-gzj.github.io/hugo-stack/background/particles/particlesjs-config.json", function() {
    console.log('particles.js loaded - callback');
  });
</script>

<style>
  #particles-js {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: -1;
  }
</style>
```

## 图片懒加载

注：Stack 主题默认有懒加载，不需要自行添加

实现：`/layouts/_default/_markup` 中新建 `render-image.html` 然后丢入代码：

```html
<p class="md_image">
  <img loading='lazy' src="{{ $Permalink }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</p>
```