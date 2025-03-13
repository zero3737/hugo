---
date: 2025-03-09
title: Linux 中查看进程以及杀死进程的方法
tags:
  - linux
  - ubuntu
  - 运维
categories:
  - linux
  - ubuntu
  - 运维
image: ./bg/10.webp
author: carlos
---

## 查看进程

**ps 命令**：命令用于报告当前系统的进程状态。常用的组合有 `ps aux`

- `a`：显示所有用户的进程
- `u`：以用户友好的格式显示
- `x`：显示没有控制终端的进程

```shell
ps aux | grep 进程名
```

![](../00-assets/Pasted%20image%2020250309003651.png)

第二列为 pid，关闭进程的时候会用到。

## 关闭进程

**`kill` 命令**：`kill` 命令用于向进程发送信号，最常用的信号是 `SIGTERM`（终止）和 `SIGKILL`（强制终止）。

```shell
kill 进程ID          # 发送 SIGTERM 信号
kill -9 进程ID       # 发送 SIGKILL 信号，强制终止
```

**`pkill` 命令**：`pkill` 命令可以根据进程名或其他属性直接终止进程，而无需先查找进程 ID。

```shell
pkill 进程名
```

**`killall` 命令**：`killall` 命令可以根据进程名终止所有匹配的进程。

```shell
killall 进程名
```



