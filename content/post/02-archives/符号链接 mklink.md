---
date: 2025-03-06
title: 符号链接 mklink
tags:
  - linux
  - ubuntu
  - windows
  - 电脑知识
categories: 
image: ./bg/13.webp
author: carlos
---

## 前言

符号链接（Symbolic Link）是一种文件系统中的概念，它允许你创建一个指向另一个文件或目录的快捷方式。符号链接在 Windows、Linux 和 Mac 系统中都有支持，但它们的行为和兼容性可能会有所不同。下面我将详细解释符号链接的作用以及为什么在某些情况下可能无法兼容不同路径。

## Windows 使用

在 Windows 系统中，可以使用 mklink 命令来创建符号链接。以下是基本语法：

```
mklink /D "目标目录" "源目录"
```

例如，假设你的 Joplin 导出目录是 D:\JoplinExport，而你的 Obsidian 目录是 C:\ObsidianVault，你可以使用以下命令在 Obsidian 目录中创建一个指向 Joplin 导出目录的符号链接：

```
mklink /D "C:\ObsidianVault\JoplinExport" "D:\JoplinExport"
```

## Linux 使用

在 Linux 或 Mac 系统中，可以使用 ln -s 命令来创建符号链接。以下是基本语法：

```
ln -s 源目录 目标目录
```

例如，假设你的 Joplin 导出目录是 /home/user/JoplinExport，而你的 Obsidian 目录是 /home/user/ObsidianVault，你可以使用以下命令在 Obsidian 目录中创建一个指向 Joplin 导出目录的符号链接：

```
ln -s /home/user/JoplinExport /home/user/ObsidianVault/JoplinExport
```

## 注意事项

- 符号链接只是创建了一个指向实际文件的快捷方式，如果路径不正确，图片仍然无法显示。
- 符号链接的路径是相对于创建时的路径。如果目标文件或目录的路径发生变化，符号链接可能会失效。例如，如果你创建了一个符号链接指向 `D:\JoplinExport`，但后来将 JoplinExport 文件夹移动到了 `D:\NewFolder`，那么原来的符号链接将无法找到目标。
- 不同的文件系统对符号链接的支持程度不同。例如，NTFS 文件系统支持符号链接，但 FAT32 和 exFAT 文件系统不支持。如果你将符号链接从一个支持的文件系统移动到不支持的文件系统，符号链接可能会失效。
- 某些应用程序可能不支持符号链接。例如，某些程序可能无法正确解析符号链接，导致无法访问目标文件或目录。这可能是由于程序的设计或安全限制。
- 在不同操作系统之间移动符号链接可能会导致问题。例如，Windows 和 Linux 系统对符号链接的处理方式不同，如果你在 Windows 上创建了一个符号链接，然后在 Linux 系统上访问，可能会遇到兼容性问题。

### 不支持符号链接功能‌

exFAT是一种为移动存储设备（如U盘、SD卡）设计的轻量级文件系统，主要目标是‌跨平台兼容性‌（Windows/macOS/Linux）和‌大文件支持‌，但未包含符号链接等高级功能‌。

### 与NTFS的对比
‌
NTFS、ext4等文件系统支持符号链接，因为它们具备更复杂的元数据管理能力。而exFAT的设计简化了文件结构以提高兼容性，牺牲了此类高级特性‌。

## 案例

假设你的 Joplin 导出目录是 D:\JoplinExport，而你的 Obsidian 目录是 C:\ObsidianVault，你可以使用以下命令在 Obsidian 目录中创建一个指向 Joplin 导出目录的符号链接：

```
mklink /D "C:\ObsidianVault\JoplinExport" "D:\JoplinExport"
```

注意，JoplinExport 目录下的资源文件夹一定要存在，不然无法加载资源，例如图片、视频、办公文件等。JoplinExport 目录下存在 images 目录，那么 `C:\ObsidianVault\JoplinExport` 目录下也必须有 images 目录，不然无法加载图片资源。

## 软链接与硬链接

 一、跨文件系统支持
 - 软链接：可跨不同文件系统或分区创建，仅需存储目标文件的路径信息即可实现间接引用‌。
 - 硬链接：仅能在同一文件系统内创建，因依赖共享同一inode的特性，无法跨越不同存储设备或分区‌。

二、目标类型支持
- 软链接：若目标文件被删除或移动，软链接会失效（成为“悬挂链接”）‌。
- 硬链接：删除任一硬链接不会影响其他链接，只有当所有硬链接被删除后，文件数据才会被释放‌。

三、目标文件删除后的行为
- 软链接：若目标文件被删除或移动，软链接会失效（成为“悬挂链接”）‌。
- 硬链接：删除任一硬链接不会影响其他链接，只有当所有硬链接被删除后，文件数据才会被释放‌。