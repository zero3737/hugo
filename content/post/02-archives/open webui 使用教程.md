---
date: 2025-03-09T21:56:49+08:00
title: open webui 使用教程
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
image: ./bg/49.webp
author: carlos
---

## open webui 导入模型 api

open webui 支持 3 种方式导入模型，分别是：OpenAI API、Ollama API 和直接连接。

![9e12b9fa9798cdd67e1a13d408bd2027.png](../_resources/9e12b9fa9798cdd67e1a13d408bd2027.png)

主流方式是 OpenAI API，许多第三方 api 都提供  OpenAI API 方式接入，比如腾讯、字节和百度。

Ollama API 是模型本地部署方案。所以 open webui 支持对接第三方 api 以及 Ollama 本地模型。

one api 只能通过“直接连接”方式对接 open webui

![90a1ccefa40829851812ebf768521e1c.png](../_resources/90a1ccefa40829851812ebf768521e1c.png)

点击加号即可对接 one api

![46f4a567d9983609698d465bf6f1fbc3.png](../_resources/46f4a567d9983609698d465bf6f1fbc3.png)

还可以通过函数方式创建模型，用来支持 deepseek 思维链功能。

![7acfae58c81f9a908f0656733390d24e.png](../_resources/7acfae58c81f9a908f0656733390d24e.png)