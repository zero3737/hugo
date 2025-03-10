---
date: 2025-03-10T03:59:47+08:00
title: github 新建仓库以及推送代码
tags:
  - github
  - git
  - 编程
  - ubuntu
  - linux
categories:
  - github
  - git
  - 编程
  - ubuntu
  - linux
image: ./bg/47.jpg
author: carlos
---

## github 新建仓库

github 仓库主页选择 new

![](../00-assets/Pasted%20image%2020250310033650.png)

输入仓库名，‌然后选择公开（Public）或私有（Private）权限‌。

![](../00-assets/Pasted%20image%2020250310033741.png)

划到底部，点击 “Create repository” 即可新建完毕

![](../00-assets/Pasted%20image%2020250310033845.png)

## ubuntu 安装 git

ubuntu 默认安装 git，呵呵，没有安装执行以下命令

一、更新系统软件包列表

```shell
sudo apt update
```

二、执行安装命令

```shell
sudo apt install git -y
```

三、验证安装结果

```shell
git --version
```

## 初始化 git

配置 git 用户名和邮箱

```shell
git config --global user.name "root"
git config --global user.email "root@localhost"‌
```

查看全局配置

```shell
git config --global user.name
git config --global user.email
```

运行结果

![](../00-assets/Pasted%20image%2020250310035219.png)

**补充说明**

Git 全局配置中的用户名和邮箱均可完全自定义（如 `root` 和 `root@localhost`）。这两个命令设置的名字和邮箱会出现在每次提交记录中，而用户名的自定义是允许的，只要符合一定的规范。

在团队项目中，建议使用真实姓名或可识别昵称，便于追溯提交记录‌。

## 关联本地与远程仓库

本地初始化仓库并关联远程地址

```shell
git init
git remote add origin git@github.com:YourName/RepoName.git‌
```

## 上传代码

手动提交命令，提交到本地 git

```shell
git add .          # 添加所有文件到暂存区
git commit -m "提交说明"‌
```

重命名当前分支为 main‌

```shell
git branch -M main
```

**补充说明**

- 若通过 `git init` 初始化仓库后需将默认分支从 `master` 改为 `main`，执行一次 `git branch -M main` 即可永久生效‌。
- 强制重命名当前本地分支‌（例如将默认分支从 master 改为 main），与 GitHub 仓库名无关‌。这是 git 本地命令。

推送到 github 仓库

```shell
git push -u origin main
```

**补充说明**：

- 会将当前本地分支‌推送到远程仓库的 source 分支，并建立追踪关系（-u 参数的作用）‌。若远程 source 分支不存在，此命令会自动创建该分支‌。
- 本地分支名与远程分支名 ‌无需相同‌。例如，本地分支为 main，仍可推送至远程 source 分支‌。
- 后续使用 git push（不带参数）时，默认推送至已关联的远程分支（即 source）‌。

当本地分支名与远程分支名不一致时，‌需通过参数或配置明确指定映射关系‌，否则会因默认规则冲突导致推送失败‌。

```shell
git push -u origin 本地分支名:远程分支名
```

如果是一个人，遇到冲突，不想处理，可以强制推送

```shell
git push -f origin main
```

可执行脚本定时提交

```shell
#!/bin/bash
cd /path/to/your/repo     # 切换到项目目录‌
git add .                 # 添加所有修改到暂存区‌
git commit -m "Auto commit: $(date +'%Y-%m-%d %H:%M:%S')"  # 自动生成带时间的提交说明‌
git push origin main      # 推送代码到远程仓库‌
```

输入 github 账户名以及密码，不是 git 的用户名和密码

![](../00-assets/Pasted%20image%2020250310043619.png)