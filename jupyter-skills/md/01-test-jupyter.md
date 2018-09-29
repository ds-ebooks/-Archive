
# 第一次使用Jupyter

<h1>Contents<span class="tocSkip"></span></h1>
<div class="toc"><ul class="toc-item"><li><span><a href="#一、更改Jupyter-notebook的工作空间" data-toc-modified-id="一、更改Jupyter-notebook的工作空间-1">一、更改Jupyter notebook的工作空间</a></span><ul class="toc-item"><li><span><a href="#1.直接在工作目录打开" data-toc-modified-id="1.直接在工作目录打开-1.1">1.直接在工作目录打开</a></span></li><li><span><a href="#2.通过快捷方式属性修改" data-toc-modified-id="2.通过快捷方式属性修改-1.2">2.通过快捷方式属性修改</a></span></li><li><span><a href="#3.修改config文件" data-toc-modified-id="3.修改config文件-1.3">3.修改config文件</a></span></li></ul></li><li><span><a href="#二、常用命令" data-toc-modified-id="二、常用命令-2">二、常用命令</a></span><ul class="toc-item"><li><span><a href="#1.误删了jupyter-notebook中的代码" data-toc-modified-id="1.误删了jupyter-notebook中的代码-2.1">1.误删了jupyter notebook中的代码</a></span></li><li><span><a href="#2.jupyter魔法" data-toc-modified-id="2.jupyter魔法-2.2">2.jupyter魔法</a></span></li></ul></li><li><span><a href="#三、Jupyter的各种快捷键" data-toc-modified-id="三、Jupyter的各种快捷键-3">三、Jupyter的各种快捷键</a></span></li><li><span><a href="#四、Jupyter-Notebook如何导入代码" data-toc-modified-id="四、Jupyter-Notebook如何导入代码-4">四、Jupyter Notebook如何导入代码</a></span><ul class="toc-item"><li><span><a href="#1.将本地的.py文件load到jupyter的一个cell中" data-toc-modified-id="1.将本地的.py文件load到jupyter的一个cell中-4.1">1.将本地的.py文件load到jupyter的一个cell中</a></span></li><li><span><a href="#2.从网络load代码到jupyter" data-toc-modified-id="2.从网络load代码到jupyter-4.2">2.从网络load代码到jupyter</a></span></li></ul></li><li><span><a href="#五、Jupyter运行python文件" data-toc-modified-id="五、Jupyter运行python文件-5">五、Jupyter运行python文件</a></span></li><li><span><a href="#六、Jupyter一些其他琐碎用法" data-toc-modified-id="六、Jupyter一些其他琐碎用法-6">六、Jupyter一些其他琐碎用法</a></span><ul class="toc-item"><li><span><a href="#1.jupyter的cell可以作为unix-command使用" data-toc-modified-id="1.jupyter的cell可以作为unix-command使用-6.1">1.jupyter的cell可以作为unix command使用</a></span></li><li><span><a href="#2.Magic-functions用法" data-toc-modified-id="2.Magic-functions用法-6.2">2.Magic functions用法</a></span></li><li><span><a href="#3.获取current-working-directory" data-toc-modified-id="3.获取current-working-directory-6.3">3.获取current working directory</a></span></li><li><span><a href="#4.使用Matplotlib绘图" data-toc-modified-id="4.使用Matplotlib绘图-6.4">4.使用Matplotlib绘图</a></span></li></ul></li><li><span><a href="#七、Jupyter中的Markdown" data-toc-modified-id="七、Jupyter中的Markdown-7">七、Jupyter中的Markdown</a></span><ul class="toc-item"><li><span><a href="#1.链接跳转" data-toc-modified-id="1.链接跳转-7.1">1.链接跳转</a></span></li><li><span><a href="#2.添加目录功能" data-toc-modified-id="2.添加目录功能-7.2">2.添加目录功能</a></span></li><li><span><a href="#3.在Jupyter中打开md文件" data-toc-modified-id="3.在Jupyter中打开md文件-7.3">3.在Jupyter中打开md文件</a></span></li></ul></li><li><span><a href="#八、主题配置" data-toc-modified-id="八、主题配置-8">八、主题配置</a></span></li><li><span><a href="#九、Ubuntu上面存在权限问题" data-toc-modified-id="九、Ubuntu上面存在权限问题-9">九、Ubuntu上面存在权限问题</a></span><ul class="toc-item"><li><span><a href="#修改权限" data-toc-modified-id="修改权限-9.1">修改权限</a></span></li><li><span><a href="#查看token" data-toc-modified-id="查看token-9.2">查看token</a></span></li></ul></li><li><span><a href="#十、Welcome-to-MkDocs" data-toc-modified-id="十、Welcome-to-MkDocs-10">十、Welcome to MkDocs</a></span><ul class="toc-item"><li><span><a href="#Commands" data-toc-modified-id="Commands-10.1">Commands</a></span></li><li><span><a href="#Project-layout" data-toc-modified-id="Project-layout-10.2">Project layout</a></span></li></ul></li><li><span><a href="#十一、Git基本命令" data-toc-modified-id="十一、Git基本命令-11">十一、Git基本命令</a></span></li><li><span><a href="#补充" data-toc-modified-id="补充-12">补充</a></span><ul class="toc-item"><li><span><a href="#指定图表格式" data-toc-modified-id="指定图表格式-12.1">指定图表格式</a></span></li><li><span><a href="#导出md格式去掉代码" data-toc-modified-id="导出md格式去掉代码-12.2">导出md格式去掉代码</a></span></li><li><span><a href="#matplotlib显示中文" data-toc-modified-id="matplotlib显示中文-12.3">matplotlib显示中文</a></span></li></ul></li></ul></div>

* 安装必要的包：ipython， numpy， scipy，pandas，jupyter notebook
* 基本环境配置：安装 Anaconda 或者 Miniconda，但事实上可以不用安装，有Python的pip够用了

## 一、更改Jupyter notebook的工作空间
[链接跳转测试](#七、Jupyter中的Markdown)
### 1.直接在工作目录打开
* 进入工作目录文件夹
* 键盘Shift+鼠标右键->在此处打开命令窗口-> 在弹出的命令窗口中输入：Jupyter Notebook 
* Jupyter被打开，定位到当前目录！

### 2.通过快捷方式属性修改
* 创建Jupyter Notebook快捷方式，在属性中起始位置修改；
![image](https://img-blog.csdn.net/20171202181327191?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdGludGluZXRtaWxvdQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
* 然后运行快捷方式就可以是打开的起始界面定位到你设置的目录；
* BUT，只能通过快捷方式才能这样，如果直接运行jupyter，则直接定位到初始的默认文件夹下；

### 3.修改config文件
* 在cmd中输入jupyter notebook --generate-config，找到配置文件目录；
* 在这两行中修改路径：
```
# The directory to use for notebooks and kernels.
c.NotebookApp.notebook_dir = u'D:\Jupyter'
```
* 但是我没成功，他显示路径错误，在每一个分号前加了莫名奇妙的又加了一个分号，我再次打开配置文件，发现他是一个分号啊，不懂。

所以，最后我选择第一种方式最直接。

## 二、常用命令
### 1.误删了jupyter notebook中的代码
* 方式一：
```python
for line in locals()['In']:
    print(line)
```

* 方式二：
```
history
```

### 2.jupyter魔法


```python
# 当前目录
%pwd
```




    u'D:\\Python\\Scripts\\notebook'



* 运行脚本
```python
%run name.py
# 或者
%matplotlib inline
```


```python
# matplotlib画图
%matplotlib inline
```

* 代码写入脚本
```python
%%writefile foo.py
```
* 设置运行的python版本
```python
%%script python
```
* debug模式
```
%debug
```
* 自动保存,执行后，每3秒保存一次文件
```
%autosave 3
```


## 三、Jupyter的各种快捷键
* 执行当前cell，并自动跳到下一个cell：Shift Enter
* 执行当前cell，执行后不自动调转到下一个cell：Ctrl-Enter
* 是当前的cell进入编辑模式：Enter
* 退出当前cell的编辑模式：Esc
* 删除当前的cell：双D
* 为当前的cell加入line number：单L
* 将当前的cell转化为具有一级标题的maskdown：单1
* 将当前的cell转化为具有二级标题的maskdown：单2
* 将当前的cell转化为具有三级标题的maskdown：单3
* 为一行或者多行添加/取消注释：Crtl /
* 撤销对某个cell的删除：z
* 浏览器的各个Tab之间切换：Crtl PgUp和Crtl PgDn
* 快速跳转到首个cell：Crtl Home
* 快速跳转到最后一个cell：Crtl End

## 四、Jupyter Notebook如何导入代码
> 即导入代码到jupyter notebook的cell中

### 1.将本地的.py文件load到jupyter的一个cell中
**问题背景**：有一个test.py文件，需要将其载入到jupyter的一个cell中 
test.py内容如下：
```python
print "Hello World!"
```
**方法步骤：**


```python
# %load test.py
print "HellO World!"
```

Shift Enter运行后，%load test.py被自动加入了注释符号#，test.py中的所有代码都被load到了当前的cell中.

### 2.从网络load代码到jupyter

`%load https://matplotlib.org/examples/color/color_cycle_demo.html`

## 五、Jupyter运行python文件
* 利用jupyter的cell是可以运行python文件的，即在cell中运行如下代码：


```python
%run test.py
```

    HellO World!
    

## 六、Jupyter一些其他琐碎用法
### 1.jupyter的cell可以作为unix command使用


```python
# 查看python版本：
!python --version 
```

    Python 2.7.13
    


```python
# 运行python文件：
!python test.py
```

    HellO World!
    

### 2.Magic functions用法
待深究：[The cell magic in Ipython](http://nbviewer.jupyter.org/github/ipython/ipython/blob/1.x/examples/notebooks/Cell%20Magics.ipynb#The-cell-magics-in-IPython)
### 3.获取current working directory


```python
current_path = %pwd 
print current_path
```

    D:\Python\Scripts\notebook
    

### 4.使用Matplotlib绘图


```python
# 有时是弹不出图像框的，此时，可以在开头加入:
%matplotlib inline
```

<a id='七、Jupyter中的Markdown'></a>
## 七、Jupyter中的Markdown
### 1.链接跳转
```
## 一、更改Jupyter notebook的工作空间
[链接跳转](#更改Jupyter notebook的工作空间)
...
<a id='七、Jupyter中的Markdown'></a>
## 七、Jupyter中的Markdown
```

### 2.添加目录功能
```
$ pip2 install jupyter_nbextensions_configurator
$ pip2 install jupyter_contrib_nbextensions
```
* 详细地址参考：[jupyter_nbextensions_configurator](https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator)、[jupyter_contrib_nbextensions](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)
* 打开Jupyter Notebook，在它的（新增的）Nbextensions标签下勾选“Table of Contents(2)”
* 打开一个.jpynb文件，发现，目录功能可用了！
![image](http://static.zybuluo.com/lutingting/dh3va6p7vtyviah6i138nkmg/image_1b4ea6tov2ld1pckpnlujf4g513.png)

### 3.在Jupyter中打开md文件

让`jupyter notebook` 生成md这个大家都会，可是在github当中有很多很好的md文件，如果不能在`jupyter notebook`当中打开体验，实在是太让人难过了。

* 安装`notedown`
```
pip install notedown
```
* 打开配置文件`jupyter_notebook_config.py`，添加：
```
c.NotebookApp.contents_manager_class = ‘notedown.NotedownContentsManager’
```
* 重启`jupyter notebook`，OK

## 八、主题配置
```
pip install --upgrade jupyterthemes
jt -l     //查看能够使用得主题
jt -t chesterish -T -N    //配置主题，chesterish是主题名
jt -r   //恢复默认主题
```
更详细配置参考：[jupyter-themes](https://github.com/dunovank/jupyter-themes)

## 九、Ubuntu上面存在权限问题
### 修改权限
```
//问题1：jupyter无法访问python
sudo chmod 777 ~/.local/share/jupyter/
cd ~/.local/share/jupyter/
ls
sudo chmod 777 runtime/
cd runtime/
ls

//2.jupyter无法访问笔记本
//chown命令可以修改文件或目录所属的用户
$ sudo chown 用户 目录或文件名
//chgrp命令可以修改文件或目录所属的组
$ sudo chgrp 组 目录或文件名
```
* Ubuntu上面直接在`nbextensions_configurator`修改不会成功，因为浏览器根本没有保存你的修改，这个问题有待解决.
* 所以我暂时用Win10做笔记.
* 另外，可以利用mkdoc将notebook发布到GitHub Pages上面，这里不再展开，和静态博客的搭建类似.
### 查看token
```
jupyter-notebook list
```

## 十、Welcome to MkDocs

For full documentation visit [mkdocs.org](http://mkdocs.org).

### Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

### Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.


## 十一、Git基本命令
```
//建立本地仓库

//初始化本地仓库
$ git init

//添加到暂存区
$ git add .

//提交到工作区
$ git commit -m "first commit"

//添加远程Git仓库
$ git remote add origin https://github.com/ds19991999/VerCodeMFC.git

//删除远程Git仓库
$  git remote rm origin

//合并pull两个不同的项目解决fatal: refusing to merge unrelated histories
$ git pull origin master --allow-unrelated-histories

//使用强制push的方法：
$ git push -u origin master -f
```

## 补充

### 指定图表格式

`Jupyter Notebook` 用 `Matplotlib` 画出来那一坨糊糊的东西会不会跟我一样浑身难受,在画图表的时候加上最后一行就行了，指定他为`'svg'`格式:
```python
import matplotlib
import matplotlib.pyplot as plt
%matplotlib inline
%config InlineBackend.figure_format = 'svg'
```

### 导出md格式去掉代码

假如你的`jupyter notebook`是导出一个报告给业务人员看的，他们不想看到那些密密麻麻的代码，只想留下`markdown`和图表，在`jupyter notebook`加入下面这段代码就好:
```python
import IPython.core.display as di
di.display_html('<script>jQuery(function(){if (jQuery("body.notebook_app").length == 0) { jQuery(".input_area").toggle();jQuery(".prompt").toggle();}});
                </script>', raw=True)
```

### matplotlib显示中文

配置文件中加入：

Python27
```python
import seaborn as sns
import sys# print sys.getdefaultencoding()# ipython notebook中默认是ascii编码 
reload(sys)
sys.setdefaultencoding('utf8')
```
具体参见：[装扮你的Jupyter](https://zhuanlan.zhihu.com/p/26739300?group_id=843868091631955968)
