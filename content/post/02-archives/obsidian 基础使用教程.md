---
date: 2025-03-06
title: obsidian 基础使用教程
tags:
  - 笔记
  - obsidian
categories:
  - 笔记
  - obsidian
image: ./bg/18.jpg
author: carlos
---

## 文件与链接

配置如图
- 内部链接类型选择“相对路径”，兼容markdown
- “使用wiki链接”关闭，兼容markdown
- 修改“附件默认存放路径”，不然图片默认存放根目录，很不美观

![](../00-assets/Pasted%20image%2020250305051412.png)

## 兼容 joplin

joplin 导出 markdown 默认目录结构。

![](../00-assets/Pasted%20image%2020250305051749.png)

obsidian 主流知识库目录结构要符合主流标准，不然很难管理。joplin 附件都是存放在自己的数据文件夹下，用户不用关心附件管理问题。而 obsidian 需要自己设计知识库目录结构，不然管理非常头疼。

我的设计思路非常简单，根目录下穿件 00-assets 目录，用于存放所有附件即可。

![](../00-assets/Pasted%20image%2020250305052330.png)

看起来非常清爽，为了兼容新的目录结构，需要使用符号链接。

先将 `_resources` 目录重命名为 00-assets，然后运行命令

```batch
mklink /D "C:\Users\carlos\Desktop\obsidian\_resources" "C:\Users\carlos\Desktop\obsidian\00-assets"
```

这样导出的 markdown 文件就能在 vscode 中正常显示图片，已经完美兼容 obsidian

## 快捷键

| 快捷键            | 说明                                      |
| -------------- | --------------------------------------- |
| `ctrl+shift+v` | 无格式粘贴                                   |
| `ctrl+o`       | `Ctrl+O` 可直接打开“打开文件”对话框，用于快速选择并加载本地文件‌。 |
| `ctrl+p`       | 调出命令面板                                  |

右键快速插入表格

![](../00-assets/Pasted%20image%2020250305195822.png)

## 元数据

在笔记第 1 行输入 `---` 用于添加元数据。

![](../00-assets/Pasted%20image%2020250305201453.png)

## 双链

反向链接，不用手动链接，当别的笔记提到当前文件名，就会自动提示。

![](../00-assets/Pasted%20image%2020250305202010.png)

不过很鸡肋唉，谁会写笔记的时候复制粘贴别的笔记名啊。

出链，和网页的跳转页面一样，就是跳转到需要链接的笔记。和反向链接一样，输入需要链接的笔记名，就会自动显示。

![](../00-assets/Pasted%20image%2020250305202754.png)

## 白板

侧边栏创建白板

![](../00-assets/Pasted%20image%2020250305203500.png)

简单可视化操作，就是实现思维导图。

![](../00-assets/Pasted%20image%2020250305203241.png)

## 第三方插件

如果网络访问不了官方社区，可以访问第三方社区：[地址1]([PKMer_PKMer](https://pkmer.cn/))

首先关闭安全模式

![](../00-assets/Pasted%20image%2020250305204112.png)

点击浏览即可安装第三方插件，访问的是 github

![](../00-assets/Pasted%20image%2020250305204145.png)

## 模板

开启原生模板插件，点击左下角「设置」→「核心插件」→ 启用「模板」功能‌。

![](../00-assets/Pasted%20image%2020250305212000.png)

在「模板」插件设置中指定模板文件夹（如 Templates）‌。

![](../00-assets/Pasted%20image%2020250305212044.png)

编写模板内容，在 Templates 文件夹新建 hugo-template.md，内容如下

```yaml
+++
date = "{{date:YYYY-MM-DD}}"
author = "carlos"
title = "{{title}}"
description = "hello worlld!"
tags = [
    "hello",
    "world",
]
+++
```

插入模板到新笔记

- 新建笔记 → 点击左侧「插入模板」按钮 → 选择模板文件。
- 手动补充字段

Obsidian 原生模板语法只支持动态插入时间日期，其他需要自己手动填写。





