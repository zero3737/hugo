---
date: 2025-03-10T02:20:13+08:00
title: git 入门使用 2
tags:
  - git
  - github
  - 编程
categories: []
image: ./bg/13.webp
author: carlos
---

## 放弃本地修改并强制拉取更新

```
git fetch --all
git reset --hard origin/master
```

`git fetch` 指令是下载远程仓库最新内容，不做合并。

`git reset` 指令把HEAD指向master最新版本。
## git 忽略特殊文件

在 Git 工作区的根目录下创建一个特殊的 .gitignore 文件。忽略指定文件：

```
test.md
index.html
```

如果要忽略某一类文件，内容如下：

```
*.class
*.html
```

## git ssh 远程连接服务器

git bash 输入 `ssh root@192.168.1.102` 命令，接着输入密码即可连接远程服务器。

root 为用户名，@ 符号紧跟 IP 地址。

**退出连接**：`Ctrl + D` 退出连接

## git 服务器搭建

**本地 git 服务器搭建方案**

- [Gogs](https://gogs.io/)
- [GitLab](https://about.gitlab.com/)

