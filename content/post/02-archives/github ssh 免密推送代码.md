---
date: 2025-03-10T05:08:44+08:00
title: github ssh 免密推送代码
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
image: ./bg/44.webp
author: carlos
---

## 前言

如果使用 https 方式推送代码，每次推送代码都需要输入用户名和密码，不方便，也不利于创建脚本

## 生成 SSH 密钥对

**执行密钥生成命令**

```shell
ssh-keygen -t rsa -b 4096 -C "root@localhost"
```

这里的账户填写本地 git 账户，而非 github 账号

默认回车 3 次

![](../00-assets/Pasted%20image%2020250310044611.png)

密钥生成后，id_rsa 为私钥（需保密），id_rsa.pub 为公钥（需上传）‌

**查看公钥内容**

```shell
cat ~/.ssh/id_rsa.pub
```

## github 添加公钥

主页头像 -> "Settings"

![](../00-assets/Pasted%20image%2020250310044947.png)

找到 "New SSH key"

![](../00-assets/Pasted%20image%2020250310045237.png)

输入 github 账户密码

![](../00-assets/Pasted%20image%2020250310045511.png)

## 配置 git 使用 ssh 协议

查看当前远程仓库协议

```shell
git remote -v
```

![](../00-assets/Pasted%20image%2020250310050519.png)

若为 https 协议，需改为 ssh 格式

```shell
git remote set-url origin git@github.com:zero3737/hugo.git
```

仓库改为自己的

![](../00-assets/Pasted%20image%2020250310051040.png)
## 测试 ssh 连接

验证密钥配置是否成功

```shell
ssh -T git@github.com
```

## 推送代码

出现 `Are you sure you want to continue connecting (yes/no/[fingerprint])?` 输入 yes 即可，此提示是 SSH 客户端的安全验证机制，在首次连接到某台服务器时触发。

![](../00-assets/Pasted%20image%2020250310051908.png)
