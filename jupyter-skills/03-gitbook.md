# 使用GitBook打造自己的出版平台

## 准备工作

* 安装`node.js`(含`npm`):
  * 见廖雪峰的网站：[安装Node.js和npm](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143450141843488beddae2a1044cab5acb5125baf0882000)
  * 安装完成之后就可以使用`npm`命令了



* `npm - v`

* 更新npm：`npm install npm@latest -g`
* 安装`Summary`：` npm install -g gitbook-summary`
* 安装`Gitbook`：`npm install  -g  gitbook-cli`



## 使用Summary构建书籍目录

### 直接用Summary构建

* 打开命令行；然后，进入书目所在目录，键入如下命令 ：`$ book sm`，一个完整的目录文件`SUMMARY.md`就生成了 。
* 规划目录结构：Summary默认将文件夹作为章节名称，文件夹嵌套对应目录结构，如果愿意，您可以无限嵌套。
* 调整目录顺序：Summary默认按照章节（文件夹）的字母顺序排列。如果，您不满意，可以在前面加上字母或数字， 具体格式是:`{数字或字母}-文件夹或文件名称`，这里的数字或者字母不会出现在电子书中，像这样：

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725144104.png)



* 隐藏某些章节：
  * 默认，出现在`SUMMARY.md`的章节，电子书中都有显示，只不过，如果文章不存在，该章节将呈灰度状态 ；
  * 没出现在`SUMMARY.md`的文章，最终生成的电子书是看不到的（隐藏的） ；
  * `book sm -i 0home, 1-Guide`  ，`-i` 是参数 `--ignores `的缩写形式，意思是忽略该参数提供的目录 
  * ` book sm  -c 2-jupyter-skills, 3-Git` ，参数`-c`，即`--catalog`，是指全部要显示的目录，这两个参数可以同时使用，不过，显然不能同时包含同一个目录 
  * 查看具体参数：`book -h`



* 启用配置文件：
  * Summary默认支持用`book.json`配置书籍基本信息，格式如下： 
  * 需要把这个文件放在书目的根目录（顶层），当然，也可以提供更多内容，Summary建议您这么做 

```json
{
    "bookname": "json-config-name",
    "outputfile": "test.md",
    "catalog": "all",  // 如 [chapter1，chapter2, ...]
    "ignores": [],
    "unchanged": [] // 如: ['myApp'] -> `myApp` not `My App`
}
```

* 如果把文件命名为"readme.md"、“Readme.md”或“README.md”，它将自动链接到它所在的目录上（该目录就是可点击的） 



### 使用Python脚本构建

* 上面这种方式虽然简单，但是生成的目录都是文件名，不具有用户友好性体验
* 通过简单的Python脚本可以直接构建你想要的目录名
* 默认是以md文件的首行作为目录名，一般都是文章标题，满足需求
* 目前只支持二级目录
* 自行添加文件夹名和想要修改的中文名，也是在书目所在目录运行

```python
import os
import os.path

##############################################文件名##########################
# 文件名
folders = []
folders = ['Python-Tools', 
           'advanced-python',
           'Scipy']
# 对应的中文名
chinese = ['一、Python 工具', 
           '二、Python 进阶',
           '三、Scipy 基础']
# 对应到字典中
folders_to_chinese = dict(zip(folders, chinese))

#####################################先产生文件夹内部README.md################
for folder in folders:
    with open(folder+'/README.md','w') as f:
        pass
    folder_file = open(folder+'/README.md','w')
    folder_file.write('# '+folders_to_chinese[folder]+ '\n')
    files = sorted(os.listdir(folder)) 
    # 不处理README.md
    i = 0
    for file_name in files:
        i += 1
        if file_name.endswith('.md') and file_name != 'README.md':          
            fname = folder+'/'+file_name
            with open(fname) as fp:
                lines = fp.readlines()
                for f in lines:
                    if f[0] == '#':
                        new_name = f
                        break   
                # print '    '+str(i)+new_name[1:-1]
            folder_file.write('- ['+ str(i)+new_name[1:-1]+']('+ file_name +')\n')    
    folder_file.close()
#####################################再产生文件夹外部README.md#######################
# 产生目录文件：
index_file = open('SUMMARY.md', 'w')
index_file.write('# Python数据分析 \n\n')
print 'Contents'

for folder in folders:
    # 处理文件夹名
    index_file.write('- [' + folders_to_chinese[folder]+'](' + folder + '/' + 'README.md' +')\n')
    print folders_to_chinese[folder]
    files = sorted(os.listdir(folder))    
    # 处理文件夹内其他内容
    i = 0
    for file_name in files:       
        if file_name.endswith('.md') and file_name != 'README.md':
            i += 1
            name = file_name            
            fname = folder+'/'+name
            with open(fname) as fp:
                lines = fp.readlines()
                for f in lines:
                    if f[0] == '#':
                        new_name = f
                        break   
                print '    '+str(i)+new_name[1:-1]  
                
            index_file.write('    * [' + str(i)+new_name[1:-1])
            index_file.write('](' + folder + '/' + file_name +')\n')
index_file.close()
```

## 生成电子书

* 得到`SUMMARY.md`之后直接放在书目的根目录，如果需要配置文件，`book.js`也放在里面
* ` gitbook build`这将把所有`.md`文件，转换成`.html`格式的静态文件，并存放在根目录下的_book目录 
* 也可以，用下面的命令：`$ gitbook serve`该命令，在构建的基础上，启动一个HTTP Server运行，在浏览器输入相应的地址就可以访问电子书了
* 问题`Error: Cannot find module 'gitbook-html' `
  * 解决：Run gitbook fetch it installs latest version of dependencies perhaps?! But works then with `gitbook init` 



* [gitbook新版本 build命令导出的html不能跳转](https://blog.csdn.net/hello2013zzy/article/details/79987246)
  

## 输出pdf

* 可以使用插件[`ebook-convert`](https://calibre-ebook.com/download)
* `gitbook pdf {book_name}` 然后就生成了pdf文件了
* 你已经在编写的`gitbook`当前目录，也可以使用相对路径 ：`gitbook pdf .`
* 使用`nvm`管理`npm`



## 最终验证成功的命令

```
# 先卸载全局node.js
# 再安装nvm
nvm ls # 查看安装的npm版本
nvm use 8.11.3 # 切换node 8.11.3版本
nvm install 6 # 安装6的最新版本

nvm use 6.0.0  # 使用旧版本6.0.0
gitbook build --gitbook=2.6.7  # 使用旧版本创建书籍
# 这里输出的html支持跳转
gitbook pdf . book.pdf --gitbook=2.6.7 # 旧版本可以导出pdf等格式的电子书，不需要插件，前面一个是书籍路径，后面一个生成的pdf路径及文件名
```

