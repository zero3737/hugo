---
date: 2025-03-09T21:52:37+08:00
title: open webui deepseek api 联网
tags:
  - aigc
  - docker
  - deepseek
  - chatgpt
categories:
  - aigc
  - docker
  - deepseek
  - chatgpt
image: ./bg/37.jpg
author: carlos
---

## 火山 api 申请

路径如下

![558020a4688e631f36c1ee25a1b2e700.png](../_resources/558020a4688e631f36c1ee25a1b2e700.png)

申请 api

![e7ce6ac20832b41eda2cdc4c25faa517.png](../_resources/e7ce6ac20832b41eda2cdc4c25faa517.png)

可以查看剩余 token

![a4c9c68e947160e62c43a23bfecbc974.png](../_resources/a4c9c68e947160e62c43a23bfecbc974.png)

## 火山联网

以火山为例：[地址](https://console.volcengine.com/ark)

![0b940231abda1bdab47807ab0c174e7c.png](../_resources/0b940231abda1bdab47807ab0c174e7c.png)

默认即可，点击创建

![0434e823f8fa0908808a8dee717b7a5f.png](../_resources/0434e823f8fa0908808a8dee717b7a5f.png)

需要手动开通联网功能，有免费额度。

![837b27e76f2732129abb108d9a8788de.png](../_resources/837b27e76f2732129abb108d9a8788de.png)

api 调用

![6ad5505749e5d30445d3de310cf45584.png](../_resources/6ad5505749e5d30445d3de310cf45584.png)

选择“openai-sdk”

![c698649b1e53c917c9a1fd1daa2d5ce9.png](../_resources/c698649b1e53c917c9a1fd1daa2d5ce9.png)

联网功能的 api 和默认的 api 不一样，有区别。

![f1262990056a5426a859bb9acca0c799.png](../_resources/f1262990056a5426a859bb9acca0c799.png)

模型 id 也跟默认的不一样。

![604364ecd026d573cd6e18981bacc3d3.png](../_resources/604364ecd026d573cd6e18981bacc3d3.png)

api key 没有变化，按照下图配置即可。

![c02f34c2d6e525bc45dd3129b00a4d6b.png](../_resources/c02f34c2d6e525bc45dd3129b00a4d6b.png)

记得在这里启用，并修改名字。

![446cd6c557abc46b387046de73b42be1.png](../_resources/446cd6c557abc46b387046de73b42be1.png)

主页选择新的模型 api，即可体验联网功能的 deepseek

![0cf0ce5715c4ee25e3324a6fef6781c3.png](../_resources/0cf0ce5715c4ee25e3324a6fef6781c3.png)

## 腾讯

[控制台](https://lke.cloud.tencent.com/lke#/app/home)

![a401dbae5d1b34d26689649480e74480.png](../_resources/a401dbae5d1b34d26689649480e74480.png)

跟着文档走即可：[文档地址](https://cloud.tencent.com/document/product/1759/116006)

## 阿里

[地址1](https://bailian.console.aliyun.com/#/model-market)

创建 api key

![880b5b6e9c60a59b11ab999a4ffc8fc3.png](../_resources/880b5b6e9c60a59b11ab999a4ffc8fc3.png)