---
date: 2025-03-06
title: homepage 配置
tags:
  - docker
  - ubuntu
  - linux
categories:
  - docker
  - ubuntu
  - linux
image: ./bg/54.webp
author: carlos
---

## Homepage 主要配置文件功能介绍

1、settings.yaml

homepage的设置文件，用来设置：语言、布局、标题、favicon图标、背景图片等。

2、service.yaml

homepage的服务文件，用来设置：Docker或其他服务导航入口等。

3、widgets.yaml

homepage的小组件文件，用来设置：功能显示如：CPU、内存占用率、温度、上线时间等；搜索框、天气、日期和时间等。

4、bookmarks.yaml

homepage的书签文件，用来设置：网站收藏书签、书签图标、url等。

## settings.yaml

- language：语言设置
- background：背景图片设置

```yaml
providers:
  openweathermap: openweathermapapikey
  weatherapi: weatherapiapikey
  
language: zh-CN
  
background:
  image: https://images.unsplash.com/photo-1502790671504-542ad42d5189?auto=format&fit=crop&w=2560&q=80
  
hideVersion: true
```

## services.yaml

配置模板：

```yaml
- 媒体影音:
    - EmbyServer:
        icon: emby.png
        href: http://x.x.x.x:8096/ # Emby IP:8096
        description: Movies & TV Shows
        ping: 127.0.0.1 # Emby IP
        widget:
          type: emby
          url: http://x.x.x.x:8096
          key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          enableBlocks: true # optional, defaults to false
          enableNowPlaying: true # optional, defaults to true
```

Group 组和 Service 服务之前要用 -，且上下级空格排列，下面参数要多几个空格对齐。

homepage内置自带图标集合。使用的是如下开源图标集：https://github.com/homarr-labs/dashboard-icons/blob/main/ICONS.md

我们可以在icon参数中，直接调用。只要是以上图标集中存在的图标即可。

href 中 url 结尾有 / 比如 `http://xxxx:1234/`，与之后添加组件 widget 中的 url 不需要加 /，两者是不同的。

Homepage支持的服务非常多，每个具体的widget组件参数设置均不相同，具体可以查看：https://gethomepage.dev/widgets/

## widgets.yaml

此为 homepage 的功能组件，注意和 service 的 widgets 服务组件参数区分。

```yaml
# 比如上线时间、CPU使用率、温度范围最低最高等扩展显示
- resources:
    cpu: true
    memory: true
    disk: /
    cputemp: false # disabled by default
    uptime: true # disabled by default
    expanded: true # show the expanded view

# 搜索框设置，可选搜索引擎：如百度、谷歌等，_blank搜索结果开新页面显示
- search:
    provider: [google, baidu]
    target: _blank

# 天气组件
- openmeteo:
    label: 中山小榄 # optional
    latitude:  22.671981
    longitude: 113.243876
    timezone: Asia/Shanghai # optional
    units: metric # or imperial
    cache: 5 # Time in minutes to cache API responses, to stay within limits
```

## bookmarks.yaml

```yaml
- Developer:
    - Github:
        - abbr: GH
          href: https://github.com/
 
- Social:
    - Reddit:
        - icon: reddit.png
          href: https://reddit.com/
          description: The front page of the internet
 
- Entertainment:
    - YouTube:
        - abbr: YT
          href: https://youtube.com/
```

也可使用http/https网页图标，如：https://www.baidu.com/favicon.ico