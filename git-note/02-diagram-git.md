# 图解Git笔记

> 参考：[图解 Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)

[TOC]

## 基本用法

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713181722.png)

* history----仓库；Stage(Index)----暂存目录；Working Directory----工作目录
* 具体命令：
  * `git add files` 把当前文件放入暂存区域 
  * `git commit` 给暂存区域生成快照并提交 
  * `git reset -- files` 用来**撤销最后一次**`git add files`，你也可以用`git reset` **撤销所有暂存区域文件 **
  * `git checkout -- files` 把文件从暂存区域复制到工作目录，用来丢弃本地修改
    * 这个和`git checkout gh-pages`很像，`git checkout gh-pages`之前需要先`git branch gh-pages`产生本地分支，从而进行本地的分支的切换
* 交互模式：
  * `git reset -p`, `git checkout -p`, or `git add -p` 

## 命令详解

### Diff 

* 查看两次提交之间的变动

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713211427.png)

```
git diff maint(分支名)
git diff b325c da985
git diff --cached
git diff
git diff HEAD
```

### Commit

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713211910.png)

或者

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713212659.png)

如果想**更改一次提交**，使用 `git commit --amend`。git会使用与当前提交相同的父节点进行一次新提交，旧的提交会被取消。 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713212421.png)

### Checkout

* checkout命令用于从历史提交（或者暂存区域）中拷贝文件到工作目录，也可用于切换分支。 
* 当给定某个文件名（或者打开-p选项，或者文件名和-p选项同时打开）时，git会从指定的提交中拷贝文件到暂存区域和工作目录。
  * 比如，`git checkout HEAD~ foo.c`会将提交节点*HEAD~*(即当前提交节点的父节点)中的`foo.c`复制到工作目录并且加到暂存区域中。
  * （如果命令中没有指定提交节点，则会从暂存区域中拷贝内容。）注意当前分支不会发生变化。 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713214051.png)

* **切换分支：**当不指定文件名，而是给出一个（本地）分支时，那么*HEAD*标识会移动到那个分支（也就是说，我们“切换”到那个分支了），然后暂存区域和工作目录中的内容会和*HEAD*对应的提交节点一致。新提交节点（下图中的a47c3）中的所有文件都会被复制（到暂存区域和工作目录中）；只存在于老的提交节点（ed489）中的文件会被删除；不属于上述两者的文件会被忽略，不受影响。 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713214609.png)

* **如果既没有指定文件名，也没有指定分支名，而是一个标签、远程分支、SHA-1值或者是像*master~3*类似的东西，就得到一个匿名分支**，称作*detached HEAD*（被分离的*HEAD*标识）。 
* 这样可以很方便地在历史版本之间互相切换 
  * 比如说你想要编译1.6.6.1版本的git，你可以运行`git checkout v1.6.6.1` （这是一个标签，而非分支名） 
  * 编译，安装，然后切换回另一个分支，比如说`git checkout master` ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713215315.png)
  * 当提交操作涉及到“分离的HEAD”时，其行为会略有不同,不会更新任何已命名的分支。(你可以认为这是在更新一个匿名分支。) 
  * ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713215608.png)
  * 对于匿名分支，一旦你切换到了其他分支，该分支就不存在了，要想之后能引用这个分支，你先得保存这个匿名分支，即`git checkout -b name`来创建一个新的分支

### Reset

* Reset命令把当前分支指向另一个位置，并且有选择的变动工作过目录和索引（暂存区），也用在从历史仓库中复制文件到索引，而不动工作目录。如果不给选项，那么当前分支指向到那个提交。如果用`--hard`选项，那么工作目录也更新，如果用`--soft`选项，那么都不变。 
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713220518.png)
* 如果没有给出提交点的版本号，那么默认用*HEAD*。这样，分支指向不变，但是索引会回滚到最后一次提交，如果用`--hard`选项，工作目录也同样。 
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713220626.png)
* 如果给了文件名(或者 `-p`选项), 那么工作效果和带文件名的checkout差不多，除了索引被更新。 

### Merge

* 合并分支。合并前，索引必须和当前提交相同。
* 默认把当前提交(*ed489* 如下所示)和另一个提交(*33104*)以及他们的共同祖父节点(*b325c*)进行一次[三方合并](http://en.wikipedia.org/wiki/Three-way_merge)。结果是先保存当前目录和索引，然后和父节点*33104*一起做一次新提交。 
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713222114.png)

### Cherry Pick

* "复制"一个**提交节点**并在当前分支做一次完全一样的新提交 

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713222933.png)

### Rebase

* 衍合是合并命令的另一种选择 
* 衍合在当前分支上重演另一个分支的历史，提交历史是线性的。 本质上，这是线性化的自动的cherry-pick
* 上面的命令都在*topic*分支中进行，而不是*master*分支，在*master*分支上重演，并且把分支指向新的节点。注意旧提交没有被引用，将被回收。 
* 要限制回滚范围，使用`--onto`选项。下面的命令在*master*分支上重演当前分支从*169a6*以来的最近几个提交，即*2c33a*。
* ![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180713223858.png)