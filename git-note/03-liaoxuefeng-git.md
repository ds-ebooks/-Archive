# 廖雪峰Git教程Note

[TOC]

## 教程导图

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713230132.jpg)

## 集中式和分布式

* CVS和SVN集中式的版本控制系统；Git是分布式版本控制系统 
  * CVS会造成提交文件不完整，版本莫名其妙的损坏情况
  * 开源而且免费的SVN修正了CVS的一些稳定性问题，是目前用得最多的集中式版本库控制系统 
* 集中式版本控制系统 ：
  * 版本库是集中存放在中央服务器的，自己需要先从服务器取得自己最新的版本，然后在本地进行开发，完成之后再推送给中心服务器
  * 必须联网才能工作，网速慢 
* 分布式版本控制系统 ：
  * 无中心服务器，每个人的电脑就是一个完整的版本库，不需要联网，直接在本地工作
  * 对于多人协作，同时修改了一个文件，那么只需要将自己修改的文件推送给对方，他就可以看到
  * 安全性更高，每个人的电脑都有一份完整的版本库，自己本地的坏了可以从别人那里Copy，集中式版本库一旦中心服务器坏了，那就哈哈哈了
  * 分布式版本控制系统通常也有一台充当“中央服务器”的电脑，但这个服务器的作用仅仅是用来方便“交换”大家的修改，没有它大家也一样干活，只是交换修改不方便而已 

## 配置信息

```
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
```

## 创建版本库

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713234233.png)

* 所有的版本控制系统，其实只能跟踪文本文件的改动，对于二进制文件Git具体不清楚修改的内容（Microsoft的Word格式是二进制格式 ）
* 建议采用标准UTF-8编码
* Windows自带的**记事本**，每个文件开头添加了0xefbbbf（十六进制）的字符，避免使用

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713235626.png)

* Git区分大小写

## 修改文件并提交

```
git status	# 查看当前状态
git diff README.TXT	# 查看被修改的文件具体修改的内容
```

## 版本回退

* 现在有文件版本：




```
# version1 README.txt
Git is a version control system.
Git is free software.

# version2 README.txt
Git is a distributed version control system.
Git is free software.

# version3 README.txt
Git is a distributed version control system.
Git is free software distributed under the GPL.

```

* git log 查看历史提交记录，具体时间都显示出来了

  * ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714001337.png)
  * 加上`--pretty=oneline`参数 
  * ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714001807.png)
  * 其中前面一连串的数字是commit id，是十六进制，每提交一个新版本，实际上Git就会把它们自动串成一条时间线 
* 将REAME.txt回退到上一个版本

  * 用`HEAD`表示当前版本 ，上一个版本就是`HEAD^`，上上一个版本就是`HEAD^^` ，当然往上100个版本写成`HEAD~100` 
  * ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714002352.png)
  * 回退到了`version 2`版本了，然后我又想到最新版本，只要窗口没关，他就一直存在

```
git reset --hard <版本号>
```

* 
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714002944.png)
* 如果找不到commit id，使用`git reflog`记录命令历史
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714003503.png)
* git log----回退版本时使用，git reflog继续使用最新版本时使用



## 工作区和暂存区

* 工作区（Working Directory）：本地文件夹里面可以看到的目录
* 版本库（Repository）：工作区下的隐藏目录.git，这个是版本库，Git的版本库里存了很多东西，其中最重要的就是称为stage（或者叫index）的**暂存区**，还有Git为我们自动创建的第一个分支`master`，以及指向`master`的一个指针叫`HEAD`。 
* 需要提交的文件修改通通放到暂存区 



## 管理修改

* Git跟踪并管理的是修改，而非文件 
* `git diff HEAD -- readme.txt `，查看工作区和最新版本的区别



## 撤销修改

* `git checkout -- file`可以丢弃工作区的修改 
  * `readme.txt`自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态； 
  * `readme.txt`已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态；
  * 让这个文件回到最近一次`git commit`或`git add`时的状态
  * 注意命令中的`--`否则就会变成切换分支
* `git reset HEAD <file>` ，可以把暂存区的修改撤销掉（unstage），重新放回工作区：
  * `git reset`命令既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用`HEAD`时，表示最新的版本。
* 如果已经把文件提交到了版本库，那就只能使用版本回退了`git reset --hard <版本号>`，也可以使用HEAD指针 



## 删除文件

* `git rm test.txt`然后就是`git commit`这是删除暂存区的文件
* `rm test.txt`是删除工作区的文件
* 误删之后可以用`git reset HEAD^ `回退版本
* 但是只能恢复文件到之前的最新版本，你会丢失**最近一次提交后你修改的内容**。



## 远程仓库

* 创建SSH Key：`ssh-keygen -t rsa -C "youremail@example.com"`
* 添加远程仓库：
  * `git remote add origin https://github.com/ds-ebooks/learngit.git`，远程库的名字就是`origin`，这是Git默认的叫法 
  * `git push -u origin master`加上了`-u`参数，Git不但会把本地的`master`分支内容推送的远程新的`master`分支，还会把本地的`master`分支和远程的`master`分支关联起来，在以后的推送或者拉取时就可以简化命令。 一般直接这样还会报错，加上`-f`强制推送
  * 之后就简化命令`git push origin master`
* 从远程库克隆：
  * GitHub给出的地址不止一个 ，使用`https`速度慢，每次推送都必须输入口令 ，建议使用`git协议` ：`git@github.com:ds-books/gitskills.git`

## 分支管理：

### 创建与合并分支：

* 一开始的时候，`master`分支是一条线，Git用`master`指向最新的提交，再用`HEAD`指向`master`，就能确定当前分支，以及当前分支的提交点，更详细分支图例见[图解Git](./02-diagram-git.md) 
* ![](https://cdn.liaoxuefeng.com/cdn/files/attachments/0013849087937492135fbf4bbd24dfcbc18349a8a59d36d000/0)
* 创建分支就是新建一个指针，指向和master相同的提交，再把HEAD指针指向dev
* 一般我们在dev上面进行开发，dev分支的开发完成了，我们需要合并dev和master分支，就直接将master指针指向dev当前提交，就完成了合并



### 删除指针，也就是删除指针而已

```
# 创建dev分支，此时远程库并没有dev分支，-b表示创建并切换
git checkout -b dev
# 相当于
git branch dev
git checkout dev

# 查看当前分支
git branch

# dev上面完成开发之后，合并到marster分支
git merge dev
# 这时master上面的内容就和dev一样,也就是直接把master指向dev的当前提交，所以合并速度非常快。

# 删除dev分支
git branch -d dev
# 安全起见，使用分支完成某个任务，合并后再删掉分支
```

### 冲突解决：

* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714111803.png)
* 必须把冲突文件修改成一样的才能合并
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714113010.png)
* `git log --graph --pretty=oneline --abbrev-commit`查看分支合并情况
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714113309.png)
* --graph参数用来查看分支合并图



### 分支管理策略：

* `Fast forward`模式，删除分支后，会丢掉分支信息
* 强制禁用`Fast forward`模式，Git就会在merge时生成一个新的commit，这样，从分支历史上就可以看出分支信息
* `git merge --no-ff -m "merge with no-ff" dev`，加上`--no-ff`强制禁用`Fast forward`模式
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180714124225.png)
* 像这样：![git-no-ff-mode](https://cdn.liaoxuefeng.com/cdn/files/attachments/001384909222841acf964ec9e6a4629a35a7a30588281bb000/0) 
* `fast forword`模式是看不出来分支合并信息的



### Bug分支：

* 假设此时dev上面的开发进行到一半，还不能提交，此时有一个Bug需要修复，可以先`stash`将工作现场储存起来，等之后再回来继续开发
* 假设需要在master修复bug，那么就切换至master分支，之后创建`issue-101`分支修复bug，`git checkout -b issue-101`



```
# 查看当前分支（dev），发现未提交的文件，但由于未完成，所以不想提交
git status

# 保存当前分支未提交的文件，即保存工作现场
git stash

# 假设master分支的bug需要修复
git checkout master

# 创建master的分支issue-101修复bug
git checkout -b issue-101

# 修复完bug之后，提交并合并
git add .
git commit -m "fix bug 101"
git checkout master
git merge --no-ff -m "merged bug fix 101" issue-101

# 切换至dev分支进行未完成的开发
git status   # 发现工作区是干净的
git stash list # 此时应该可以看到之前保存的信息

# 方式一
git stash apply	# 恢复，但是恢复后，stash内容并不删除
git stash drop	#删除stash内容

# 方式二
git stash pop # 相当于上面的两步

git stash list # 此时就看不到保存的工作区现场了

# 对于多次stash
# 先查看stash
git stash list
# 再指定恢复的的现场
git stash apply stash@{0}
```
### Feature分支：

* 新的功能要不断添加进来，但不想把主分支搞乱



```
# 开发代号为Vulcan的新功能
git checkout -b feature-vulcan

# 之后就是git add, git commit

# 切回dev合并
git checkout dev
git branch -d feature-vulcan

# 如果此时还未提交，但由于紧急情况需要取消该任务，该分支必须删除的时候
git branch -d feature-vulcan   # 发现并不能删除分支
# 强行删除
git branch -D feature-vulcan
```

### 多人协作：

* `git remove`查看远程库的信息或者`git remove -v`查看更详细的信息

* 抓取分支：

  * `git checkout -b dev origin/dev`就必须创建远程`origin`的`dev`分支到本地 
  * 你的同事已经向`origin/dev`分支推送了他的提交，而碰巧你也对同样的文件作了修改，此时你push就会冲突
  * 先`git pull`把最新的提交从`origin/dev`抓下来，然后，在本地合并，解决冲突，再推送 ，注意

  
```
# 指定本地dev分支与远程origin/dev分支的链接
git branch --set-upstream-to=origin/dev dev

# 之后再pull
git pull

# 出现合并冲突--解决方法同上
# 最后push
git push origin dev
```

* 具体模式：

  * 首先，可以试图用`git push origin <branch-name>`推送自己的修改；
  * 如果推送失败，则因为远程分支比你的本地更新，需要先用`git pull`试图合并；
  * 如果合并有冲突，则解决冲突，并在本地提交；
  * 没有冲突或者解决掉冲突后，再用`git push origin <branch-name>`推送就能成功！
  * 如果`git pull`提示`no tracking information`，则说明本地分支和远程分支的链接关系没有创建，用命令`git branch --set-upstream-to origin/<branch-name> <branch-name>`。 

  

### Rebase：

*  `git rebase`
*  rebase操作可以把本地未push的分叉提交历史整理成直线； 
*  rebase的目的是使得我们在查看历史提交的变化时更容易，因为分叉的提交需要三方对比。 



## 标签管理

* 发布一个版本，就给这个版本库打一个标签tag，方便以后取出标签对应的版本，也就是说，标签就是版本库的一个快照
* tag是指向某个commit的指针，是不能移动的，创建和删除标签都是瞬间完成的 



### 创建标签

```
# 切换打标签的分支
git branch
git checkout master

# 然后就可以打标签了
git tag v1.0

# 查看所有标签
git tag

# 为过去的提交打标签
git log --pretty=oneline --abbrev-commit
git tag v0.9 a793aa9 # a793aa9是commit id

# 标签是按字母排序的,可以查看标签信息
git show <tagname>

# 创建带有说明的标签，用-a指定标签名，-m指定说明文字：
git tag -a v0.1 -m "version 0.1 released" 1094adb

# 插卡说明文字
git show <tagname>
```

### 删除标签

```
# 删除标签
git tag -d v1.0

# 将某个标签对应的版本推送到远程仓
git push origin v1.0

# 一次性推送全部尚未推送的本地标签
git push origin --tags

# 删除远程标签
# 先本机删除
git tag -d v0.9
# 再远程删除
git push origin :refs/tags/v0.9
```

### GitHub Pages

* 详见[为博客添加小功能](https://github.com/ds19991999/ds19991999.github.io/blob/master/notebook/add-blog-tools.md)、[搭建个人博客](https://github.com/ds19991999/ds19991999.github.io/blob/master/notebook/build-blog.md)、[ds19991999的博客](https://ds19991999.github.io/)、[利用GitHub_Pages搭建简易个人博客](https://blog.csdn.net/ds19991999/article/details/80708987)

### 使用码云仓

* 详见[使用码云](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00150154460073692d151e784de4d718c67ce836f72c7c4000)，限github速度慢可以试一试国内的，不过我感觉github还好

## 自定义Git

```
# 让Git显示颜色
git config --global color.ui true
```

### 忽略特殊文件

* 也就是那个`.gitignore`文件，里面填的文件名或文件夹在git add和git commit过程中都不起作用，不会被提交，一般情况下github已经个我们写好了模板：[gitignore](<https://github.com/github/gitignore)
* 想要忽略什么文件就不需要多说了
* 关于`.gitignore`的格式，在里面你可以这样写：


```
# Windows:
Thumbs.db
ehthumbs.db
Desktop.ini

# Python:
*.py[cod]
*.so
*.egg
*.egg-info
dist
build

# My configurations:
db.ini
deploy_key_rsa
```

* 强制添加忽略的文件：加个`-f`参数，`git add -f App.class`

### 配置别名

* 偷懒做法，初学者慎重
* 参考廖雪峰老师原教程：[配置别名](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375234012342f90be1fc4d81446c967bbdc19e7c03d3000)

```
# 配置lg,查看分支合并情况
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

* 配置Git的时候，加上`--global`是针对当前用户起作用的，如果不加，那只针对当前的仓库起作用 
* 配置文件在`.git/config` 



## 搭建Git服务器

* 搭建Git服务器需要准备一台运行Linux的机器



```
# 安装git
sudo apt-get install git

# 创建一个git用户，用来运行git服务
sudo adduser git

# 创建证书登录
收集所有需要登录的用户的公钥，就是他们自己的id_rsa.pub文件，
把所有公钥导入到/home/git/.ssh/authorized_keys文件里，一行一个

# 初始化Git仓库
# 先选定一个目录作为Git仓库，假定是/srv/sample.git，在/srv目录下输入命令：
sudo git init --bare sample.git
sudo chown -R git:git sample.git

# 禁用shell登录
# 编辑/etc/passwd文件完成
git:x:1001:1001:,,,:/home/git:/bin/bash
# 改为一旦登录就自动退出：
git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell

# 克隆远程仓库
git clone git@server:/srv/sample.git

# 管理公钥
/home/git/.ssh/authorized_keys

# 管理权限
```