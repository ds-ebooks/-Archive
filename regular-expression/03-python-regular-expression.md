
# Python正则表达式

官方文档：[re](https://docs.python.org/3/library/re.html?highlight=re#module-re)

## re模块

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180716112011.png)

① Python 1.5.2 版中新增；2.4 版中增加 flags 参数

② Python 2.2 版中新增；2.4 版中增加 flags 参数

③ Python 2.7 和 3.1 版中增加 flags 参数

主要学习match()和 search()，以及 compile()函数

## re常用函数

### 使用 match()方法匹配字符串
`match(pattern ， string ， flags=0)`

尝试使用带有可选的标记的正则表达式的模式来匹配字符串。如果匹配成功，就返回匹配对象；如果失败，就返回 None

他是从字符串**起始部位开始匹配**,一旦第一个字符匹配失败，就是不匹配

匹配对象的 group()方法能够用于显示那个成功的匹配。


```python
import re
m = re.match('foo','foo')
if m is not None:
    regex1 = m.group()
regex1
```




    'foo'




```python
m
```




    <_sre.SRE_Match at 0x522adb0>




```python
m = re.match('foo','bar')
if m is not None:m.group()# 单行版本的if语句
print m  # 不匹配
```

    None


**后面操作省去if语句**，实际开发要加上，避免 AttributeError 异常


```python
m = re.match("foo","food on the table")
m.group()
```




    'foo'




```python
re.match("foo","food on the table").group()
```




    'foo'



### 使用search()在一个字符串中查找模式（搜索与匹配的对比）

`search(pattern ， string ， flags=0) `

使用可选标记搜索字符串中**第一次出现的正则表达式模式**。如果匹配成功，则返回匹配对象；如果失败，则返回 None


```python
m = re.match('foo','seafood')
if m is not None:print m.group()#匹配失败
```


```python
m = re.search('foo','searchfood')
if m is not None:regex3 = m.group()
print regex3 # 搜索成功，但是匹配失败
```

    foo


### 匹配多个字符串（|）


```python
bt = 'bat|bet|bit'
m = re.match(bt,'bat')
if m is not None:print m.group() # Pytho2这里不加print就打印不出结果
```

    bat



```python
m = re.match(bt,'blt')
if m is not None:print m.group() # 匹配失败
```


```python
m = re.match(bt, 'he bit me') 
if m is not None:print m.group() # 匹配失败：不能匹配字符串
```


```python
m = re.search(bt,'he bit me')
if m is not None:print m.group() 
```

    bit


到这里match()和search()的区别基本上就清晰了

### 匹配任何单个字符
点号（.）不能匹配一个换行符\n 或者非字符，也就是说，一个空字符串


```python
anyend = '.end'
m = re.match(anyend, 'bend')
if m is not None:print m.group() 
```

    bend



```python
m = re.match(anyend, 'end')
if m is not None:print m.group() # 匹配失败
```


```python
m = re.match(anyend, '\nend')
if m is not None:print m.group() # 除了\n之外的任何字符
```


```python
m = re.search(anyend, 'The end.')
if m is not None:str = m.group() # 可以匹配' '
str
```




    ' end'




```python
pat314 = '3.14'    # 表示正则表达式的点号
pi_pat = '3\.14'   # 表示字面量的点号 (dec. point)
m = re.match(pi_pat,'3.14')  #精确匹配
if m is not None:str = m.group() 
str
```




    '3.14'




```python
m = re.match(pat314,'3014') # 点号匹配0
if m is not None:str = m.group() 
str
```




    '3014'




```python
m = re.match(pat314,'3.14') # 点号匹配.
if m is not None:str = m.group() 
str
```




    '3.14'



### 创建字符集([ ])


```python
m = re.match('[cr][23][dp][o2]', 'c3po')  # 匹配 'c3po'
if m is not None:str = m.group()
str
```




    'c3po'




```python
m = re.match('r2d2|c3po', 'r2d2')# 匹配 'r2d2'
if m is not None:str = m.group()
str
```




    'r2d2'



### 重复、特殊字符以及分组

简单电子邮件地址的正则表达式`（\w+@\w+\.com）`, `www.xxx.com`，仅仅允许 xxx.com 作为整个域名，必须修改现有的正则表达式.为了表示主机名是可选的，即`\w+@(\w+\.)?\w+\.com`


```python
patt  = '\w+@(\w+\.)?\w+\.com'  # “？”操作符来表示该模式出现零次或者一次
re.match(patt, 'nobody@xxx.com').group()
```




    'nobody@xxx.com'




```python
# 允许任意数量的中间子域名存在
patt = '\w+@(\w+\.)*\w+\.com'
re.match(patt, 'nobody@www.xxx.yyy.zzz.com').group()
```




    'nobody@www.xxx.yyy.zzz.com'



更进一步


```python
m = re.match('(\w\w\w)-(\d\d\d)','abc-123')
if m is not None:str = m.group()
str
```




    'abc-123'




```python
m.group(1)  #子组1
```




    'abc'




```python
m.group(2)
```




    '123'




```python
m.groups()
```




    ('abc', '123')



更具体的分组操作


```python
m = re.match('ab','ab')
m.group()
```




    'ab'




```python
m.groups()  # 只抓取子组信息
```




    ()




```python
m = re.match('(ab)','ab')
m.group()
```




    'ab'




```python
m.group(1)
```




    'ab'




```python
m.groups() # 注意到元祖里面如果只有一个元素，需要加一个','号
```




    ('ab',)




```python
m = re.match('(a(b))', 'ab') # 两个子组
m.group()
```




    'ab'




```python
m.group(1)
```




    'ab'




```python
m.group(2)
```




    'b'




```python
m.groups()
```




    ('ab', 'b')



### 匹配字符串的起始和结尾以及单词边界
更多用于表示搜索而不是匹配


```python
m = re.search('The','The end.')
if m is not None: print m.group()
```

    The



```python
m = re.search('^The','end. The')
if m is not None:print m.group()
```


```python
m = re.search(r'\bthe','bite the dog')# 在边界
if m is not None: print m.group()
```

    the



```python
m = re.search(r'\bthe', 'bitethe dog') # 有边界
if m is not None: print m.group()
```


```python
m = re.search(r'\Bthe', 'bitethe dog') # 有边界
if m is not None: print m.group()
```

    the


### 使用 findall()和 finditer()查找每一次出现的位置
```
findall(pattern ， string [, flags] )
```
查找字符串中所有（非重复）出现的正则表达式模式，并返回一个匹配列表
```
finditer(pattern ， string [, flags] )
```
与 findall()函数相同，但返回的不是一个列表，而是一个迭代器。对于每一次匹配，迭
代器都返回一个匹配对象


```python
re.findall('car','car')
```




    ['car']




```python
re.findall('car','scary')
```




    ['car']




```python
re.findall('car','carry the barcardi to the car')
```




    ['car', 'car', 'car']




```python
s = 'This and that.'
re.findall(r'(th\w+) and (th\w+)',s,re.I)
```




    [('This', 'that')]




```python
re.finditer(r'(th\w+) and (th\w+)', s,re.I).next().groups()
```




    ('This', 'that')




```python
re.finditer(r'(th\w+) and (th\w+)', s,re.I).next().group(1)
```




    'This'




```python
 [g.groups() for g in re.finditer(r'(th\w+) and (th\w+)',s, re.I)]
```




    [('This', 'that')]



多重匹配


```python
re.findall(r'(th\w+)', s, re.I)
```




    ['This', 'that']




```python
it = re.finditer(r'(th\w+)', s, re.I)
g = it.next()
g.groups()
```




    ('This',)




```python
g.group(1)
```




    'This'




```python
g = it.next()
g.groups()
```




    ('that',)




```python
g.group(1)
```




    'that'




```python
[g.group(1) for g in re.finditer(r'(th\w+)',s,re.I)]
```




    ['This', 'that']



### 使用 sub()和 subn()搜索与替换
两者几乎一样，都是将某字符串中所有匹配正则表达式的部分进行某种形式的替换，但它也可能是一个函数，该函数返回一个用来替换的字符串。

subn()还返回一个表示替换的总数，**替换后的字符串和表示替换总数的数字**一起作为一个拥有两个元素的元组返回。


```python
re.sub('X', 'Mr. Smith', 'attn: X\n\nDear X,\n')
```




    'attn: Mr. Smith\n\nDear Mr. Smith,\n'




```python
re.subn('X', 'Mr. Smith', 'attn: X\n\nDear X,\n')
```




    ('attn: Mr. Smith\n\nDear Mr. Smith,\n', 2)




```python
print re.sub('X', 'Mr. Smith', 'attn: X\n\nDear X,\n')
```

    attn: Mr. Smith
    
    Dear Mr. Smith,


​    


```python
re.sub('[ae]', 'X', 'abcdef')
```




    'XbcdXf'




```python
re.subn('[ae]', 'X', 'abcdef')
```




    ('XbcdXf', 2)



**另一种分组编号：**

group（）方法除了能够取出匹配分组编号外，还可以使用\N，其中 N 是在替换字符串中使用的分组编号


```python
re.sub(r'(\d{1,2})/(\d{1,2})/(\d{2}|\d{4})',r'\2/\1/\3', '2/20/91') # 分组重排
```




    '20/2/91'




```python
re.sub(r'(\d{1,2})/(\d{1,2})/(\d{2}|\d{4})',r'\2/\1/\3', '2/20/1991')
```




    '20/2/1991'



### 在限定模式上使用 split()分隔字符串


```python
DATA = (
    'Mountain View, CA 94040',
    'Sunnyvale, CA',
    'Los Altos, 94023',
    'Cupertino 95014',
    'Palo Alto CA',
    )
for datum in DATA:
    # 如果空格紧跟在五个数字（ZIP 编码）或者两个大写字母（美国联邦州缩
    # 写）之后，就用 split 语句分割该空格。
    print re.split(', |(?= (?:\d{5}|[A-Z]{2})) ', datum) 
```

    ['Mountain View', 'CA', '94040']
    ['Sunnyvale', 'CA']
    ['Los Altos', '94023']
    ['Cupertino', '95014']
    ['Palo Alto', 'CA']


### 扩展符号

** i不区分大小写 **


```python
re.findall(r'(?i)yes', 'yes? Yes. YES!!')
```




    ['yes', 'Yes', 'YES']




```python
re.findall(r'(?i)th\w+', 'The quickest way is through thistunnel.')
```




    ['The', 'through', 'thistunnel']




```python
re.findall(r'(?im)(th[\w ]+)',"""
    This line is the first,
    another line,
    that line, it's the best
    """)
# 这里貌似书籍翻译错了
```




    ['This line is the first', 'ther line', 'that line', 'the best']




```python
re.findall(r'th.+', '''
    The first line
    the second line
    the third line
    ''')
```




    ['the second line', 'the third line']



x该标记允许用户通过抑制在正则表达式中使用空白符（除了在字符类中或者在反斜线转义中）来创建更易读的正则表达式


```python
re.search(r'''(?x)
    \((\d{3})\)             # 区号
    [ ]                     # 空白符
    (\d{3})                 # 前缀
    -                       # 横线
    (\d{4})                 # 终点数字
    ''', '(800) 555-1212').groups()
```




    ('800', '555', '1212')



(?:…)对部分正则表达式进行分组，但是**并不会保存该分组**用于后续的检索或者应用


```python
re.findall(r'http://(?:\w+\.)*(\w+\.com)',
           'http://google.com http://www.google.com http://code.google.com')
```




    ['google.com', 'google.com', 'google.com']



**对于正则表达式，尽量使用原始字符串**

## 正则表达式示例

### 复习jupyter魔法

1. 这个是Jupyter的魔法使用，将字符串写入文件，回顾一下算了,具体见笔记：
[Ipython解释器](/notebooks/python-tools/02-ipython-interpreter.ipynb)


```python
%%writefile whodata.txt
wesley console Jun 20 20:33
wesley pts/9 Jun 22 01:38 (192.168.0.6)
wesley pts/1 Jun 20 20:33 (:0.0)
wesley pts/2 Jun 20 20:33 (:0.0)
wesley pts/4 Jun 20 20:33 (:0.0)
wesley pts/3 Jun 20 20:33 (:0.0)
wesley pts/5 Jun 20 20:33 (:0.0)
wesley pts/6 Jun 20 20:33 (:0.0)
wesley pts/7 Jun 20 20:33 (:0.0)
wesley pts/8 Jun 20 20:33 (:0.0) 
```

    Overwriting whodata.txt


2. 加载文件


```python
# %load whodata.txt
wesley console Jun 20 20:33
wesley pts/9 Jun 22 01:38 (192.168.0.6)
wesley pts/1 Jun 20 20:33 (:0.0)
wesley pts/2 Jun 20 20:33 (:0.0)
wesley pts/4 Jun 20 20:33 (:0.0)
wesley pts/3 Jun 20 20:33 (:0.0)
wesley pts/5 Jun 20 20:33 (:0.0)
wesley pts/6 Jun 20 20:33 (:0.0)
wesley pts/7 Jun 20 20:33 (:0.0)
wesley pts/8 Jun 20 20:33 (:0.0) 
```


      File "<ipython-input-69-851b49c8cf42>", line 2
        wesley console Jun 20 20:33
                     ^
    SyntaxError: invalid syntax




```python
%%writefile test.py
print 'Hello world'
```

    Writing test.py


3. 运行文件


```python
%run test.py
```

    Hello world



```python
!python test.py
```

    Hello world


4. 删除文件


```python
import os
os.remove('test.py')
```


```python
%ls
```

     驱动器 E 中的卷是 File Sharing
     卷的序列号是 8EC1-8F11
    
     E:\01-note\02-python27\python-essentials 的目录
    
    2018/07/27  16:39    <DIR>          .
    2018/07/27  16:39    <DIR>          ..
    2018/07/27  16:37    <DIR>          .ipynb_checkpoints
    2018/07/04  13:52            43,159 01-introduction-python.ipynb
    2018/07/04  14:00             2,128 02-date-types.ipynb
    2018/07/04  16:38            16,521 03-numbers.ipynb
    ...
                  28 个文件        498,884 字节
                   3 个目录 47,198,081,024 可用字节


### 正则表达式示例


```python
%%writefile whodata.py
import re
f = open('whodata.txt', 'r')
for eachLine in f:
    print re.split(r'\s\s+', eachLine)
f.close()
```

    Overwriting whodata.py



```python
%run whodata.py
```

    ['wesley console Jun 20 20:33\n']
    ['wesley pts/9 Jun 22 01:38 (192.168.0.6)\n']
    ['wesley pts/1 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/2 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/4 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/3 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/5 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/6 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/7 Jun 20 20:33 (:0.0)\n']
    ['wesley pts/8 Jun 20 20:33 (:0.0) ']


#### 分割 POSIX 的 who 命令输出（whodate.py)


```python
%%writefile whodata.py
import re
import os
with os.popen('whodata.txt', 'r') as f:
    for eachLine in f:
        print re.split(r'\s\s+|\t', eachLine.rstrip())
f.close()
```

    Overwriting whodata.py



```python
%run whodata.py 
```

tasklist相当于linux里的who


```python
!tasklist
```


    映像名称                       PID 会话名              会话#       内存使用 
    ========================= ======== ================ =========== ============
    System Idle Process              0 Services                   0          8 K
    System                           4 Services                   0        140 K
    Registry                        96 Services                   0     46,220 K
    smss.exe                       348 Services                   0        924 K
    ...



```python
%%writefile retasklist.py
import re
import os
with os.popen('tasklist /nh', 'r') as f: # '/nh去掉进程池PID的表格头'
    for eachLine in f:
        print re.split(r'\s\s+|\t', eachLine.rstrip())
f.close()
```

    Overwriting retasklist.py



```python
%run retasklist.py 
```

    ['']
    ['System Idle Process', '0 Services', '0', '8 K']
    ['System', '4 Services', '0', '140 K']
    ['Registry', '96 Services', '0', '46,004 K']
    ...


此时PID和会话名称放在一起了，我们要将他分开，由于split的限制，所以要使用findall


```python
%%writefile retasklist.py
import re
import os

pat = r'([\w.]+(?: [\w.]+)*)\s\s+(\d+) \w+\s\s+\d+\s\s+([\d,]+ K)'
with os.popen('tasklist /nh', 'r') as f: # '/nh去掉进程池PID的表格头'
    for eachLine in f:
        print re.findall(pat, eachLine.rstrip())
f.close()
```

    Overwriting retasklist.py



```python
%run retasklist.py
```

    []
    [('System Idle Process', '0', '8 K')]
    [('System', '4', '140 K')]
    [('Registry', '96', '44,840 K')]
    ...

#### 实战示例


```python
%%writefile gendata.py
# coding=utf-8
# 创建随机数据，然后将生成的数据输出到屏幕
from random import randrange, choice
from string import ascii_lowercase as lc
from sys import maxint
from time import ctime

tlds = ( 'com', 'edu', 'net', 'org', 'gov' )

for i in xrange(randrange(5, 11)):
    dtint = randrange(maxint)	# pick date
    dtstr = ctime(dtint)	# date string
    llen = randrange(4, 7)	# login is shorter
    login = ''.join(choice(lc) for j in range(llen))
    dlen = randrange(llen, 13)	# domain is longer
    dom = ''.join(choice(lc) for j in xrange(dlen))
    print '%s::%s@%s.%s::%d-%d-%d' % (dtstr, login,
	dom, choice(tlds), dtint, llen, dlen)
```

    Overwriting gendata.py



```python
%run gendata.py
```

    Thu Dec 27 01:10:08 2035::dqtypg@iavqvgjwnvn.edu::2082301808-6-11
    Fri May 13 20:51:55 2033::osxul@elfzkq.gov::1999601515-5-6
    Mon Apr 06 22:52:20 2020::rehbg@yfdoy.edu::1586184740-5-5
    Wed Dec 31 23:22:03 2008::legdw@tonqsajuiuch.edu::1230736923-5-12
    Sat Sep 05 12:49:23 2015::tkyyb@oygzos.edu::1441428563-5-6
    Mon May 27 08:00:35 2013::ztkuz@usczxpegy.gov::1369612835-5-9
    Mon Jul 06 14:17:37 2015::urpy@eblts.org::1436163457-4-5



```python
import re
data = 'Thu Feb 15 17:46:04 2007::uzifzf@dpyivihw.gov::1171590364-6-8'
patt = '^(Mon|Tue|Wed|Thu|Fri|Sat|Sun)'
m = re.match(patt, data)
m.group()
```




    'Thu'




```python
m.group(1)
```




    'Thu'




```python
m.groups()
```




    ('Thu',)




```python
patt = '^(\w{3})'
m = re.match(patt, data)
if m is not None: print m.group()
```

    Thu



```python
m.group(1)
```




    'Thu'




```python
patt = '^(\w){3}'  # 注意区别
m = re.match(patt, data)
if m is not None: print m.group()
```

    Thu



```python
m.group(1)
```




    'u'



### 搜索、匹配和贪婪


```python
patt = '\d+-\d+-\d+'
re.search(patt, data).group() 
```




    '1171590364-6-8'




```python
patt = '.+(\d+-\d+-\d+)'
re.search(patt, data).group(1)
```




    '4-6-8'



这就是所谓的贪婪，`.`把前面的数字也给匹配了


```python
patt = '.+?(\d+-\d+-\d+)'  # ？是非贪婪操作符
re.search(patt, data).group(1)
```




    '1171590364-6-8'




```python
# 只要中间那个数字
patt = '-(\d+)-'
m = re.search(patt, data)
m.group()
```




    '-6-'




```python
m.group(1)
```




    '6'



> 参考文献： 《Python核心编程第三版》 人民邮电出版社
