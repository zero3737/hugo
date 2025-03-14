---
date: 2025-03-11T05:07:03+08:00
title: hugo 配合 github action 自动化部署
tags:
  - github
  - Hugo
  - 笔记
  - git
categories: []
image: ./bg/03.webp
author: carlos
---

## 前言

hugo 配合 github action 实现自动化部署，例如将 hugo 源码推送到 github 仓库，通过 github 服务器的 hugo 服务生成静态文件，最后自动发布到  main 分支。

## 实操

github 创建 source 分支用来存放源码，然后在本地 git 仓库新建 `.github/workflows` 目录，文件名不能改变，这是 github action 默认识别路径。

![](../00-assets/Pasted%20image%2020250311045254.png)

在该目录下创建 `任意名称.yaml`，内容如下：

```yaml
name: Deploy Hugo to GitHub Pages

on:
  push:
    branches: [ source ]  # 仅监控source分支的推送

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: 监测 source 分支
        uses: actions/checkout@v4
        with:
          ref: source  # 明确检出source分支

      - name: hugo 设置
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.125.7'  # 指定Hugo版本
          extended: true  # 启用扩展版

      - name: 删除符号链接
        run: rm -f /home/runner/work/hugo/hugo/static/_resources

      - name: 复制图片
        run: cp -r //home/runner/work/hugo/hugo/static/00-assets/ /home/runner/work/hugo/hugo/static/_resources

      - name: hugo 生成静态文件
        run: hugo --minify --gc

      - name: 发布到 main 分支  
        uses: peaceiris/actions-gh-pages@v4
        with:
          deploy_key: ${{ secrets.SSH_PRIVATE_KEY }}
          publish_dir: ./public  
          publish_branch: main  # 正确参数名称
          force_orphan: true  # 强制覆盖目标分支
        env:  
          # 配置 Git 用户信息  
          GIT_USER_NAME: "root"  
          GIT_USER_EMAIL: "root@localhost"
```

- runs-on 指定环境，可以指定 windows、ubuntu 以及 macos
- on 为事件，自动执行脚本的事件，这里为 push 自动触发脚本
- name 为注释
- uses 为使用模块，这里加载了 `actions/checkout@v4`、`peaceiris/actions-hugo@v2` 等待模块
- run 为执行命令，这里为 ubuntu 环境，所以都是 ubuntu 命令
- `${{ secrets.SSH_PRIVATE_KEY }}` 为变量名，我是通过 ssh  方式推送到 main 分支，用到 `peaceiris/actions-gh-pages@v4` 模块，其他为官方默认配置，不必理会

将本地 git 公钥和私钥配置到 github，我这里默认已经配置好公钥，只需要将私钥配置到 action 即可

要想 github action 识别 `${{ secrets.SSH_PRIVATE_KEY }}` 变量，需要手动配置，找到 Settings

![](../00-assets/Pasted%20image%2020250311050114.png)

注意变量名要一致，我这里为 `SSH_PRIVATE_KEY`，用的时候是 `${{ secrets.SSH_PRIVATE_KEY }}`

![](../00-assets/Pasted%20image%2020250311050215.png)

将 git 仓库推送到 github source 分支即可自动构建，点击进去，即可排查错误

![](../00-assets/Pasted%20image%2020250311050623.png)

