---
date: 2025-03-09T21:54:56+08:00
title: open webui 对接 deepseek
tags:
  - aigc
  - docker
  - deepseek
  - chatgpt
categories: []
image: ./bg/56.webp
author: carlos
---

## 前言

主流大模型平台的 API：

- SiliconFlow (硅基流动)
- 百度云 千帆
- 字节跳动 火山方舟
- 阿里云 百炼
- 腾讯 知识引擎

[详细地址](https://note.youdao.com/ynoteshare/index.html?id=06a6ee8b16f8bac5048db5aeeee9a181&type=notebook&_time=1740688679358)

## 火山

创建 api key：[地址](https://console.volcengine.com/ark)

![c2737dbbb941d2af59d096ebd328572d.png](../_resources/c2737dbbb941d2af59d096ebd328572d.png)

创建接入点

![1f7dbe20c67bf9666199f6b25a40e6f6.png](../_resources/1f7dbe20c67bf9666199f6b25a40e6f6.png)

没有实名认证，必须实名认证

![837a4ced5dd4f31832c4296e162694f4.png](../_resources/837a4ced5dd4f31832c4296e162694f4.png)

one api 接入配置

![f8e9b0efaa447a2b304f4ddeb3e3264b.png](../_resources/f8e9b0efaa447a2b304f4ddeb3e3264b.png)

oben webui 通过“外部链接”方式对接 one api，one api 统一管理所有 api 接口。 

![3a11b9a7391484f94ca105b50fd7b515.png](../_resources/3a11b9a7391484f94ca105b50fd7b515.png)

这里 v1 为固定写法，不要钻牛角尖。秘钥填 one api 的。

![4975450d6bdfc18aa9d2b3eb8283dd9c.png](../_resources/4975450d6bdfc18aa9d2b3eb8283dd9c.png)

填这个秘钥即可。

![abd9981b1c2f3d54b8e9c7cf43887431.png](../_resources/abd9981b1c2f3d54b8e9c7cf43887431.png)

## 腾讯

创建 api key：[地址](https://console.cloud.tencent.com/lkeap/api)，必须要实名认证。

![ff2790aa1bed7c9a8d63951b7e59d80d.png](../_resources/ff2790aa1bed7c9a8d63951b7e59d80d.png)

查看文档即可，只有 r1 和 v3。

![fbba04c7b5371eee746323b8d05c3fe9.png](../_resources/fbba04c7b5371eee746323b8d05c3fe9.png)

## 百度

申请地址：[地址1](https://console.bce.baidu.com/qianfan/modelcenter/model/buildIn/list)

申请 api key 即可

![6d0f0245a5d81b9d660424836afa45a6.png](../_resources/6d0f0245a5d81b9d660424836afa45a6.png)

参数填 deepseek-r1 即可

![8a402c9041b659fd33298a6a464a1617.png](../_resources/8a402c9041b659fd33298a6a464a1617.png)

这里可查看哪些模型可以使用

![188d0c91d796544e7353288ac5c933df.png](../_resources/188d0c91d796544e7353288ac5c933df.png)