---
date: 2025-03-20T21:09:11+08:00
title: windows robocopy 同步备份不同分区的目录
tags:
  - windows
  - 电脑知识
  - 同步
  - 备份
categories: 
image: ./bg/11.webp
author: carlos
---

## 前言

本来想通过符号链接将文件备份到 onedrive，可是软链接对 onedrive 兼容不是很好，某些目录不能上传  onedrive

## robocopy 和复制区别

‌**robocopy**

- 是专业的命令行文件复制工具，专为大规模数据迁移设计，支持多线程加速（/MT参数）‌；
- 支持断点续传（网络中断后可恢复复制）‌3、增量备份（仅复制新增或修改的文件）‌；
- 可保留文件属性（如时间戳、ACL权限）‌；
- 提供日志记录（/LOG参数）和错误重试机制（/R和/W参数）‌。

‌**常规复制**

- 图形界面复制（右键复制粘贴）依赖剪贴板，仅适用于少量文件‌；
- copy/xcopy命令为单线程操作，无法处理复杂场景（如网络中断恢复）‌；
- 默认不保留部分元数据（如权限），且无日志记录功能‌。

## robocopy 定时同步

```bat
robocopy "Y:\usb01\08_doc" "C:\Users\carlos\OneDrive\附件\doc" /MIR /MT:12 /R:2 /W:10 /B /MON:1 /MOT:60 /XF ~$* *.tmp Thumbs.db
```

- `/MIR`：镜像模式（删除目标中多余文件，慎用！）
- `/R:2 /W:10`：失败重试 2 次，每次等待 10 秒
- `/MON:1 /MOT:60`：检测到 1 个文件变化后触发同步，每隔 60 分钟检查一次
- `/MT:64`：参数（64 线程），显著提升文件复制速度，尤其是处理大量小文件时。线程数建议设置为 CPU 核心数的 2~4 倍（如 4 核 CPU 用 8~16 线程）。

## 中文乱码问题

修改为 gbk 编码

在简体中文系统中，ANSI 等同于 ‌GBK‌；在繁体中文系统中可能映射为 ‌Big5‌，日文系统中则为 ‌Shift_JIS‌‌。

记事本另存为

![](../00-assets/Pasted%20image%2020250320190137.png)

选择 ANSI 编码，保存即可

![](../00-assets/Pasted%20image%2020250320190238.png)

## 设置开机启动

batch 脚本，检查 rclone 盘符是否挂载

```cmd
@echo off
setlocal enabledelayedexpansion

rem 设置源目录和目标目录
set "source_dir=Y:\usb01\08_doc"
set "target_dir=C:\Users\carlos\OneDrive\附件\doc"

rem 检查 Y: 盘是否挂载的函数
:check_drive
if exist "Y:\" (
    echo Y: 盘已挂载。
    goto start_backup
) else (
    echo 等待 Y: 盘挂载...
    timeout /t 10 >nul
    goto check_drive
)

:start_backup
rem 执行 robocopy 命令
robocopy "!source_dir!" "!target_dir!" /MIR /MT:12 /R:2 /W:10 /MON:1 /MOT:60 /XF ~$* *.tmp Thumbs.db /LOG:D:\script\backup\logfile.txt

echo 备份完成。

pause
```

vbs 脚本，隐藏 cmd 窗口

```vbs
WshShell.Run chr(34) &"D:\script\backup\backup.bat"& chr(34), 0
```

