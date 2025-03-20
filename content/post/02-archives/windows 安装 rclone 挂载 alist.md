---
date: 2025-03-19T21:53:54+08:00
title: windows 安装 rclone 挂载 alist
tags:
  - 挂载
  - windows
  - 电脑知识
  - 同步
  - 备份
categories: 
image: ./bg/54.webp
author: carlos
---

## 安装命令

```cmd
winget install Rclone.Rclone
winget install WinFsp.WinFsp
```

## rclone添加alist服务器地址

```cmd
rclone config
```

输入 n。

![20dff48b3a5ba11575a27468ac08aa95.png](../_resources/20dff48b3a5ba11575a27468ac08aa95.png)

输入名字。这个名字之后命令会用到。

![38e8f560c63257e38a92bdf07030b918.png](../_resources/38e8f560c63257e38a92bdf07030b918.png)

这里选择 webdav，根据自己的 rclone 版本号选择。

![3acd186c19d6090332528599206b7988.png](../_resources/3acd186c19d6090332528599206b7988.png)

输入 alist 服务器地址，注意 /dav。

![f5a83b7b9a646a4b9f5e2f1be7c91df1.png](../_resources/f5a83b7b9a646a4b9f5e2f1be7c91df1.png)

输入6（根据自己版本号选择，描述一样即可，版本号不同，编号就不痛），再输入用户名，再输入y，后面填两次密码后一路回车即可。

![519c1135c49c2c9934715f44bf746e78.png](../_resources/519c1135c49c2c9934715f44bf746e78.png)

3 次回车，按 q 退出。

![332c409b5b63238994f0111b63cf6a0e.png](../_resources/332c409b5b63238994f0111b63cf6a0e.png)

## 挂载alist

输入命令即可挂载，该命令是挂载成本地磁盘的形式。

```cmd
rclone mount smb: Z: ^
  --cache-dir "D:\rclone_cache\smb" ^
  --vfs-cache-mode full ^
  --cache-chunk-size 64M ^
  --multi-thread-streams 16 --multi-thread-cutoff 32M --transfers 8 ^
  --buffer-size 128M ^
  --vfs-cache-max-size 2G --vfs-cache-max-age 6h ^
  --vfs-fast-fingerprint ^
  --no-modtime ^
  --file-perms 0755 ^
  --links ^
  --dir-cache-time 24h ^
  --poll-interval 5m ^
  --attr-timeout 5s
```

注意 `--cache-dir D:alist` 参数，这里把缓存路径改成 d 盘 alist。

## rclone 403 错误

![ffa60f7ccd0d13c364a0789f9982e478.png](../_resources/ffa60f7ccd0d13c364a0789f9982e478.png)

alist 后台，把权限全部打开即可解决。

![831307c1bbbe4ba9183e45aa77f944a2.png](../_resources/831307c1bbbe4ba9183e45aa77f944a2.png)

## rclone eof 错误

把 alist ftp 驱动改成 smb 即可，可能由于 rclone 不兼容 alist ftp驱动吧。用 raidrive 就没有问题，但是该软件有广告。