---
date: 2025-03-10T02:24:20+08:00
title: github 使用教程
tags:
  - github
  - git
  - 编程
categories: []
image: ./bg/20.webp
author: carlos
---

## ssh 配置

如果使用 SSH 方式推送代码，需要配置 SSH Key。

把邮件地址换成自己的邮件地址，该命令意思是生成 SSH Key。

```
ssh-keygen -t rsa -C "youremail@example.com"
```

运行命令一路回车，使用默认值即可。如果运行顺利，会在用户主目录生成 .ssh 目录，里面有 id_rsa （私钥）和 id_rsa.pub （公钥）两个文件。

进入用户主目录：

```
cd ~
```

然后登录 github 账号找到 SSH Keys 选项，添加 SSH Key，Key 内容为 id_rsa.pub （公钥）内容。

GitHub 允许你添加多个 Key。假定你有若干电脑，只要把每台电脑的 Key 都添加到 GitHub，就可以在每台电脑上往 GitHub 推送了。

在 GitHub 上免费托管的 Git 仓库，任何人都可以看到（但只有你自己才能改）。

验证 SSH 配置是否成功：

```
ssh -T git@github.com
```

## watch、star 和 fork 的区别

watch:

对于别人的项目，默认自己都处于 Not watching 的状态；当你选择 Watching，表示你以后会关注这个项目的所有动态。这个项目以后只要发生变动，如被别人提交了 push request、被别人发起了 issue 等等情况，你都会在自己的个人通知中心，收到一条通知消息。如果你设置了个人邮箱，那么你的邮箱也可能收到相应的邮件。

star:

类似关注或者点赞，当你点击 star，表示你喜欢这个项目，和对这个项目的支持。

fork:

点击 fork，相当于你自己有了一份原项目的拷贝，当然这个拷贝只是针对当时的项目文件；如果后续原项目文件发生改变，你必须通过其他的方式去同步。

## 添加协作者（push权限）

设置选项，找到协作者（Collaborators）选项，添加用户。

## GitHub Pages 预览 HTML

你的仓库 -> Settings -> Options -> GitHub Pages

Source 中选择 master branch。

找到 GitHub Pages 中的地址，如下图所示：

![](../_resources/1.jpg)

在上面的地址基础上加上你的相对与仓库的文件路径。

**GitHub Pages 自定义域名**

仓库 -> Settings

箭头处填写对应域名即可（允许该域名进行CNAME访问）。

![](../_resources/3-4.png)

等待域名生效，一般为 10 分钟。

补充：DNS 服务器中将记录类型配置成 CNAME（别名记录），记录值填写 GitHub Pages 分配的域名。

## Github 发布二进制文件让其他人下载

仓库主页 -> release

![](../_resources/2.jpg)

点击下图箭头所指按钮。

![](../_resources/3.jpg)

根据下图提示输入相应内容即可。

![](../_resources/4.jpg)

分布完成别人即可下载你的发布内容。

## Github 搜索指令

| 命令                      | 作用                                                |
| :------------------------ | :-------------------------------------------------- |
| stars:>=500               | 搜索 star 大于等于 500 的项目。                     |
| stars:>=500 language:java | 搜索 star 大于等于 500 的项目且为 JAVA 语言的项目。 |
