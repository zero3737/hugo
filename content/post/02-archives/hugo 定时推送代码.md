---
date: 2025-03-10T05:53:27+08:00
title: hugo 定时推送代码
tags:
  - git
  - github
  - shell
  - ubuntu
  - linux
  - 宝塔面板
  - Hugo
  - 笔记
categories: []
image: ./bg/27.webp
author: carlos
---

## 前言

提前配置好 git 仓库，配置好 ssh，该脚本是在 ssh 配置完成下编写，不然要输入用户名和密码

## 实操

新建 sh 文件，内容如下

```shell
cd /root/hugo
hugo
cd /root/hugo/public
git add .
git commit -m "auto commit: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main
sudo nohup sh /root/shell/hugo.sh start &>> /root/shell/shell.log &
```

宝塔创建计划任务

![](../00-assets/Pasted%20image%2020250310054915.png)

宝塔定时执行脚本即可

![](../00-assets/Pasted%20image%2020250310055150.png)

可以手动执行，测试脚本

![](../00-assets/Pasted%20image%2020250310055256.png)



