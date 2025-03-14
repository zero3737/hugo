---
date: 2025-03-08
title: windows 开机执行bat脚本，含隐藏命令窗口
tags:
  - windows
  - 运维
categories: []
image: ./bg/30.webp
author: carlos
---

## 启动文件夹

按 Win + R 键打开“运行”对话框。

输入 shell:startup 并按 Enter 键，这将打开“启动”文件夹。这个文件夹中的所有程序都会在系统启动时自动运行。

将脚本放入“启动”文件夹‌。

## 隐藏命令窗口

创建文件，内容如下：

```
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) &"C:\path\to\your\batchfile.bat"& chr(34), 0
```

替换"C:\path\to\your\batchfile.bat"为你的批处理文件的实际路径。

保存文件，扩展名为.vbs，例如runBatchSilent.vbs。

将 vbs 文件放到“启动”文件夹，bat 文件放到自己喜欢的目录即可，vbs 中的路径一定要指向 bat 文件，原理是通过 vbs 隐藏命令窗口。