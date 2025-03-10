---
date: 2025-03-09T22:49:27+08:00
title: hugo 修改时间格式
tags:
  - Hugo
  - 笔记
categories:
  - hugo
  - 笔记
image: ./bg/27.jpg
author: carlos
---

## 前言

hugo stack 默认的文章时间格式是英文的，本土化不是很好

![](../00-assets/Pasted%20image%2020250309224336.png)

## 修改时间格式

配置文件 `hugo.yaml` 搜索 `dateFormat`，注释原本的时间格式

![](../00-assets/Pasted%20image%2020250309224526.png)

添加代码

```yaml
    dateFormat:
        # published: Jan 02, 2006
        # lastUpdated: Jan 02, 2006 15:04 MST
        published: 2006-01-02
        lastUpdated: 2006-01-02 15:04 MST
```

这样就修改成功了

![](../00-assets/Pasted%20image%2020250309224906.png)

## 配置「最后修改于」

配置文件末尾添加代码

```yaml
frontmatter:
  lastmod: [":fileModTime", "lastmod"]
```

效果图

![](../00-assets/Pasted%20image%2020250309224844.png)