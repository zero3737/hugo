---
date: 2025-03-14T23:57:31+08:00
title: cloudflare worker 反代实现 dns 负载均衡
tags:
  - cloudflare
categories: 
image: ./bg/31.webp
author: carlos
---

## 前言

dns 负载均衡一般都是根据用户的地理位置以及网络延迟来解析不同的域名，根据网络延迟实现负载均衡，自己实现太过困难，呵呵

反向代理应把握其作为"中间人"的定位，主要负责请求的智能路由和基础服务，不涉及业务逻辑处理或页面渲染。渲染工作实际上是由客户端浏览器或后端服务器的服务端渲染(SSR)功能完成的。

如果反代返回纯文本，添加对应的响应头即可。反向代理未正确处理后端返回的 Content-Type 响应头，导致浏览器无法识别为 HTML。

## 代码

根据网络延迟选择最优路线，玩具级别代码，只能说能用级别，呵呵呵

```js
addEventListener("fetch", event => {
  event.respondWith(handleRequest(event.request));
});

const backends = [
  "https://tencent.carlos.ip-ddns.com",
  "https://github.carlos.ip-ddns.com",
  "https://blog.carlos.ip-ddns.com"
];

async function checkLatency(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 3000);

  const start = Date.now();
  try {
    await fetch(url, { method: "HEAD", signal: controller.signal });
    return Date.now() - start;
  } catch (err) {
    return Infinity; // 超时或失败时返回最大值
  } finally {
    clearTimeout(timeout);
  }
}

async function handleRequest(request) {
  let latencies = await Promise.all(
    backends.map(async url => ({ url, latency: await checkLatency(url) }))
  );

  latencies = latencies.filter(entry => entry.latency !== Infinity);
  
  if (latencies.length === 0) {
    return new Response("All backends are down", { status: 503 });
  }

  latencies.sort((a, b) => a.latency - b.latency);
  const bestBackend = latencies[0].url;

  const modifiedRequest = new Request(bestBackend + new URL(request.url).pathname, request);

  return fetch(modifiedRequest);
}
```