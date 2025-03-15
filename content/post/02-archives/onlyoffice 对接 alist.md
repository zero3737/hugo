---
date: 2025-03-15T02:46:09+08:00
title: onlyoffice 对接 alist
tags:
  - docker
  - linux
  - ubuntu
categories: 
image: ./bg/09.webp
author: carlos
---

## 前提说明

onlyoffice 对接 alist 并不能实现在线编辑，而且 onlyoffice 在手机上表现得很不好，连滑动文档都不可以，应该是专为电脑端开发软件。

代替方案，通过同步软件同步 office 文件，然后手机用专业 office 软件打开，也能实现多人编辑，缺点就是步骤繁琐。

OnlyOffice Document Server 并不能直接打开本地 Office 文件进行编辑，必须配合网盘使用，才能实现文档的在线预览和编辑功能，类似腾讯文档，区别就是可以内网使用。

onlyoffice 对接 alist，必须选用版本 7.1.1，因为此版本不会强制 jwt 校验，不然 onlyoffice 打开不了 alist 的 office 文档，必须自己参考官方文档手动开发。

onlyoffice 对接 alist 原理：

1. alist 请求 nginx 中的 view.html。
2. view.html 请求 onlyoffice。

所以 onlyoffice 对接 alist，是通过手动编写 view.html 文件实现对接的。

## 安装 onlyoffice

```yaml
services:
  onlyoffice-documentserver:
    container_name: onlyoffice-documentserver
    image: onlyoffice/documentserver:7.1.1
    depends_on:
      - onlyoffice-postgresql
      - onlyoffice-rabbitmq
    environment:
      - DB_TYPE=postgres
      - DB_HOST=onlyoffice-postgresql
      - DB_PORT=5432
      - DB_NAME=onlyoffice
      - DB_USER=onlyoffice
      - AMQP_URI=amqp://guest:guest@onlyoffice-rabbitmq
      # Uncomment strings below to enable the JSON Web Token validation.
      - JWT_ENABLED=false
      # - JWT_SECRET=secret
      # - JWT_HEADER=Authorization
      # - JWT_IN_BODY=true
    ports:
      - '9875:80'
      - '446:443'      
    stdin_open: true
    restart: always
    stop_grace_period: 60s
    volumes:
      - ./data:/var/www/onlyoffice/Data
      - ./log:/var/log/onlyoffice
      - ./lib:/var/lib/onlyoffice/documentserver/App_Data/cache/files
      - ./public:/var/www/onlyoffice/documentserver-example/public/files
      - ./fonts:/usr/share/fonts
       
  onlyoffice-rabbitmq:
    container_name: onlyoffice-rabbitmq
    image: rabbitmq
    restart: always
    expose:
      - '5672'

  onlyoffice-postgresql:
    container_name: onlyoffice-postgresql
    image: postgres:12
    environment:
      - POSTGRES_DB=onlyoffice
      - POSTGRES_USER=onlyoffice
      - POSTGRES_HOST_AUTH_METHOD=trust
    restart: always
    expose:
      - '5432'
    volumes:
      - ./postgresql_data:/var/lib/postgresql

volumes:
  postgresql_data:
```

## 将 view.html 部署到 nginx

view.html 内容如下：

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OnlyOffice Viewer</title>
</head>
 
<body>
    <div id="placeholder"></div>
    <script type="text/javascript" src="https:/onlyoffice/web-apps/apps/api/documents/api.js"></script>
    <script>
        function getQueryParamValue(name) {
            const searchParams = new URLSearchParams(window.location.search);
            return searchParams.get(name);
        }
        
        const url = decodeURIComponent(getQueryParamValue("src"));
        const fileName = url.substring(url.lastIndexOf('/') + 1, url.lastIndexOf('?') != -1 ? url.lastIndexOf('?') : url.length);
        const fileExtension = fileName.split('.').pop();
        const docEditor = new DocsAPI.DocEditor("placeholder", {
            "document": {
                "fileType": fileExtension,
                "permissions": {
                    "edit": false,
                    "comment": true,
                    "download": true,
                    "print": true,
                    "fillForms": true,
                },
                "title": fileName,
                "url": url,
            },
            "editorConfig": {
                "lang": "zh-CN",
                "mode": "view",
            },
            "height": "1080px",
            "type": "desktop",
        });
    </script>
</body>
</html>
```

其中的https:/onlyoffice/web-apps/apps/api/documents/api.js 地址的domain 替换为自己onlyoffice 的地址。

## alist 预览配置

alist 预览配置指向 nginx 地址即可。

![15292e1a73d09ee8643517eb063bf3d9.png](../_resources/15292e1a73d09ee8643517eb063bf3d9.png)

## onlyoffice 错误：“文档安全令牌未正确形成。”

解决方案：禁用jwt，并且重启服务。

![ecb9e3a4cdd2ef4a7aed4ed9b9977d79.png](../_resources/ecb9e3a4cdd2ef4a7aed4ed9b9977d79.png)

配置文件修改为：JWT_ENABLED=false

![6ec8bb451636c0b0e5bd4d60eff2f25c.png](../_resources/6ec8bb451636c0b0e5bd4d60eff2f25c.png)

或者容器中修改：/etc/onlyoffice/documentserver/local.json

```json
  "token": {
        "enable": {
          "request": {
            "inbox":false,
            "outbox":false
          },
          "browser": false
        },
        "inbox": {
          "header": "Authorization"
        },
        "outbox": {
          "header": "Authorization"
        }
      },
```

将 3 个选项修改为 false。

## onlyoffice 文档下载失败

原因是被禁用了私有IP访问服务，需要打开。

修改配置文件：/etc/onlyoffice/documentserver/default.json

```
"request-filtering-agent" : {
"allowPrivateIPAddress": true,
"allowMetaIPAddress": true
},
```

## vim 操作说明

命令模式 `/` 可以搜索关键字，输入模式小写 n 寻找下一个，大写 N 寻找上一个。