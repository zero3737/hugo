---
date: 2025-03-08
title: hugo stack 局域网中代码块不能复制
tags:
  - Hugo
  - 笔记
  - nginx
  - https
categories: []
image: ./bg/13.webp
author: carlos
---

## 前言

在局域网中复制代码，提示报错信息

```txt
Uncaught TypeError: Cannot read properties of undefined (reading 'writeText')
    at HTMLButtonElement.<anonymous> (main.0761bcd8210a6cd3dc991b9464d19e763381e47bd94d7f30c1a0df2d68d6eb33.js:486:31)
```

![](../00-assets/Pasted%20image%2020250308225610.png)

而在本地却能正常复制粘贴，比如 localhost 可以正常复制粘贴。这可能是因为在局域网环境下，浏览器对剪贴板的访问权限被限制，导致`navigator.clipboard`对象不可用，从而引发该错误。

## 解决方案

**使用HTTPS**：浏览器在非安全上下文（如HTTP）中可能会限制对剪贴板的访问。因此，建议在局域网中使用HTTPS来启动Hugo服务器。可以通过生成自签名的TLS证书来实现HTTPS，虽然浏览器可能会提示不安全，但对于本地开发和测试来说已经足够。

nginx 配置 https 即可

```nginx
server {
    listen 80;
    server_name www.carlos.lh;

    # 强制HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name www.carlos.lh;
    ssl_certificate /root/ssl/server.crt;
    ssl_certificate_key /root/ssl/server.key.unsecure;

	  ssl_session_cache    shared:SSL:10m;
    ssl_session_timeout  5m;
  
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers  on;
    
    location / {
    
      proxy_pass http://192.168.15.210:1313;  # 将请求转发到本地的8080端口

      proxy_set_header Host $http_host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Real-Port $remote_port;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-Host $host;
      proxy_set_header X-Forwarded-Port $server_port;
      proxy_set_header REMOTE-HOST $remote_addr;
      
      proxy_connect_timeout 60s;
      proxy_send_timeout 600s;
      proxy_read_timeout 600s;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      
    }
    # 其他配置...
}
```

局域网配置 https 即可正常复制，非常完美

![](../00-assets/Pasted%20image%2020250308230546.png)