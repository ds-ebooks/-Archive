# Git基本概念
> 参考：[CyC2018-Git](https://github.com/CyC2018/Interview-Notebook/blob/master/notes/Git.md)

[TOC]

## Git常用命令步骤

### 第一次提交

```shell
//初始化本地仓库
git init

//登录信息
git config --global user.name "ds19991999"
git config --global user.email "2508328787@qq.com"

//添加到暂存区
git add .

//提交到工作区
git commit -m "first commit"

//添加远程Git仓库
git remote add origin https://github.com/ds-ebooks/jupyter-notebook.git

//在本地产生一个gh-pages分支，前提是你的Github上面也有一个gh-pages分支
git branch gh-pages

//切换本地分支
git checkout gh-pages

//查看分支
git branch -a

//查看当前状态
git status

//合并pull两个不同的项目
//解决fatal: refusing to merge unrelated histories
//远端中的文件，本地如果不存在会保留，这一步可以跳过
git pull origin master --allow-unrelated-histories

//使用强制push的方法：
git push -u origin master -f
```

### 之后的本地提交

```shell
git add .

git commit -m "..."

//这一步可以忽略
git pull origin master --allow-unrelated-histories

git push -u origin master -f
```

## 集中式和分布式

* Git 属于分布式版本控制系统，而 SVN 属于集中式。
* 集中式版本控制只有中心服务器拥有一份代码，而分布式版本控制每个人的电脑上就有一份完整的代码。 
* 集中式版本控制有安全性问题，当中心服务器挂了所有人都没办法工作了。 
* 集中式版本控制需要连网才能工作，如果网速过慢，那么提交一个文件的会慢的无法让人忍受。而分布式版本控制不需要连网就能工作 。
* 分布式版本控制新建分支、合并分支操作速度非常快，而集中式版本控制新建一个分支相当于复制一份完整代码。 

## Git 的中心服务器

* Git 的中心服务器用来交换每个用户的修改。 
* 没有中心服务器也能工作，但是中心服务器能够 24 小时保持开机状态，这样就能更方便的交换修改。Github 就是一种 Git 中心服务器。 

## 工作流

* 新建一个仓库之后，当前目录就成为了工作区，工作区下有一个隐藏目录 .git，它属于 Git 的版本库 

* Git 版本库有一个称为 stage 的暂存区，还有自动创建的 master 分支以及指向分支的 HEAD 指针

  ![image](https://raw.githubusercontent.com/CyC2018/Interview-Notebook/master/pics/46f66e88-e65a-4ad0-a060-3c63fe22947c.png)

* git add files 把文件的修改添加到暂存区

* git commit 把暂存区的修改提交到当前分支，提交之后暂存区就被清空了

* git reset -- files 使用当前分支上的修改覆盖暂存区，用来撤销最后一次 git add files

* git checkout -- files 使用暂存区的修改覆盖工作目录，用来撤销本地修改

![](https://github.com/CyC2018/Interview-Notebook/raw/master/pics/17976404-95f5-480e-9cb4-250e6aa1d55f.png)

可以跳过暂存区域直接从分支中取出修改或者直接提交修改到分支中 :

* git commit -a 直接把所有文件的修改添加到暂缓区然后执行提交，也就是git add . 与git commit -m "..."两步操作
* git checkout HEAD -- files 取出最后一次修改，可以用来进行回滚操作

## 分支实现

* Git 把每次提交都连成一条时间线。分支使用指针来实现，例如 master 分支指针指向时间线的最后一个节点，也就是最后一次提交。HEAD 指针指向的是当前分支。 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712120215.png)

* 新建分支是指新建一个指针指向时间线的最后一个节点，并让HEAD指针指向新建分支表示当前新分支成为当前分支。

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712121910.png)

* 每次提交只会让当前分支向前移动，而其它分支不会移动 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712122228.png)





* 合并分支也只需要改变指针即可 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712122411.png)



## 冲突

* 当两个分支都对同一个文件进行了修改，在分支合并时就会产生冲突

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712122857.png)

* Git自身会用<<<<<<< ，`=======`，>>>>>>> 标记出不同分支的内容，只需要把不同分支中冲突部分修改成一样就能解决冲突。 

```
<<<<<<< HEAD
Creating a new branch is quick & simple.
=======
Creating a new branch is quick AND simple.
>>>>>>> feature1
```

## Fast forward

* "快进式合并"（fast - farward merge），会直接将 master 分支指向合并的分支，这种模式下进行分支合并会丢失分支信息，也就**不能在分支历史上看出分支信息**。 
* 可以在合并时加上 --no-ff 参数来**禁用 Fast forward 模式**，并且加上 -m 参数让合并时产生一个新的 commit。 

```
git merge --no-ff -m "merge with no-ff" dev
```

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180712123808.png)



## 分支管理策略

* master 分支应该是非常稳定的，只用来发布新版本 
* 日常开发在开发分支 dev 上进行

## 储藏（Stashing）

* 在一个分支上操作之后，如果还没有将修改提交到分支上，此时进行切换分支，那么另一个分支上也能看到新的修改。这是因为**所有分支都共用一个工作区**的缘故。 
* 可以使用 git stash 将当前分支的修改储藏起来，此时当前工作区的所有修改都会被存到栈上，也就是说**当前工作区是干净的，没有任何未提交的修改。此时就可以安全的切换到其它分支上了**。 
* 这个功能在bug分支上面实现比较常见。如果此时在dev分支上面进行开发，**master**上面有一个bug需要解决，此时就可以使用git stash先将dev分支未提交的修改储存起来。

## SSH 传输设置

* Git 仓库和 Github 中心仓库之间的传输是通过 SSH 加密 的，如果工作区下没有 .ssh 目录，或者该目录下没有 id_rsa 和 id_rsa.pub 这两个文件，可以通过以下命令来创建 SSH Key： 

  ```
  ssh-keygen -t rsa -C "youremail@example.com"
  ```

* 然后把公钥 id_rsa.pub 的内容复制到 Github "**Account settings**" 的 SSH Keys 中。 

## .gitignore 文件

忽略以下文件：

- 操作系统自动生成的文件，比如缩略图；
- 编译生成的中间文件，比如 Java 编译产生的 .class 文件；
- 自己的敏感信息，比如存放口令的配置文件。

## 参考资料

* [Pro Git 2nd](https://git-scm.com/book/zh/v2)

- [图解 Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)
- [廖雪峰 : Git 教程](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [Learn Git Branching](https://learngitbranching.js.org/)

