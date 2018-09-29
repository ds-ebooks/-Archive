---
title: Linux编译程序
date: 2018-09-21 23:29:08
updated: 2018-09-21 23:29:08
description: Shell必备基础
categories:
- linux
- 技术
tags:
- shell
- ubuntu
- 技术
---

## 编译程序

```shell
make - 维护程序的工具
```

### 构建程序

大多数程序通过一个简单的，两个命令的序列构建：

```makefile
./configure
make
```

这个 configure 程序是一个 shell 脚本，由源码树提供.它的工作是分析程序构建环境。大多数源码会设计为可移植的。configure 命令会创建了几个新文件。最重要一个是 Makefile。Makefile 是一个配置文件， 指示 make 程序究竟如何构建程序。make 程序把一个 makefile 文件作为输入（通常命名为 Makefile），makefile 文件 描述了包括最终完成的程序的各组件之间的关系和依赖性。

### 安装程序

```shell
sudo make install
```

## Linux命令总结
[linux命令总结.pdf](linux命令总结.pdf)

