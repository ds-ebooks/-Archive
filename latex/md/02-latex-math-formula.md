
# 数学公式编辑

> 对于Python程序员，需要一些数学公式的编辑，所以对于LaTex的学习只需要掌握数学公式的编辑已经足够，关于文档编排感兴趣可以深究，但感觉没必要.

<h1>Contents<span class="tocSkip"></span></h1>
<div class="toc"><ul class="toc-item"><li><span><a href="#数学模式" data-toc-modified-id="数学模式-1"><span class="toc-item-num">1&nbsp;&nbsp;</span>数学模式</a></span></li><li><span><a href="#上下标^-_" data-toc-modified-id="上下标^-_-2"><span class="toc-item-num">2&nbsp;&nbsp;</span>上下标<code>^</code> <code>_</code></a></span></li><li><span><a href="#根式与分式" data-toc-modified-id="根式与分式-3"><span class="toc-item-num">3&nbsp;&nbsp;</span>根式与分式</a></span></li><li><span><a href="#运算符" data-toc-modified-id="运算符-4"><span class="toc-item-num">4&nbsp;&nbsp;</span>运算符</a></span></li><li><span><a href="#定界符括号等" data-toc-modified-id="定界符括号等-5"><span class="toc-item-num">5&nbsp;&nbsp;</span>定界符括号等</a></span></li><li><span><a href="#省略号" data-toc-modified-id="省略号-6"><span class="toc-item-num">6&nbsp;&nbsp;</span>省略号</a></span></li><li><span><a href="#矩阵" data-toc-modified-id="矩阵-7"><span class="toc-item-num">7&nbsp;&nbsp;</span>矩阵</a></span></li><li><span><a href="#多行公式" data-toc-modified-id="多行公式-8"><span class="toc-item-num">8&nbsp;&nbsp;</span>多行公式</a></span><ul class="toc-item"><li><span><a href="#长公式" data-toc-modified-id="长公式-8.1"><span class="toc-item-num">8.1&nbsp;&nbsp;</span>长公式</a></span></li><li><span><a href="#公式组" data-toc-modified-id="公式组-8.2"><span class="toc-item-num">8.2&nbsp;&nbsp;</span>公式组</a></span></li><li><span><a href="#分段函数" data-toc-modified-id="分段函数-8.3"><span class="toc-item-num">8.3&nbsp;&nbsp;</span>分段函数</a></span></li></ul></li><li><span><a href="#插入图片和表格" data-toc-modified-id="插入图片和表格-9"><span class="toc-item-num">9&nbsp;&nbsp;</span>插入图片和表格</a></span></li><li><span><a href="#一点背景" data-toc-modified-id="一点背景-10"><span class="toc-item-num">10&nbsp;&nbsp;</span>一点背景</a></span><ul class="toc-item"><li><span><a href="#TeX---LaTeX" data-toc-modified-id="TeX---LaTeX-10.1"><span class="toc-item-num">10.1&nbsp;&nbsp;</span>TeX - LaTeX</a></span></li><li><span><a href="#pdfTeX---pdfLaTeX" data-toc-modified-id="pdfTeX---pdfLaTeX-10.2"><span class="toc-item-num">10.2&nbsp;&nbsp;</span>pdfTeX - pdfLaTeX</a></span></li><li><span><a href="#总结" data-toc-modified-id="总结-10.3"><span class="toc-item-num">10.3&nbsp;&nbsp;</span>总结</a></span></li></ul></li></ul></div>

## 数学模式

* LaTeX 的数学模式有两种：**行内模式 (inline)** 和**行间模式 (display)** 。前者在正文的行文中，插入数学公式；后者独立排列单独成行，并自动居中。


```python
# `$ ... $` 可以插入行内公式
# `\[ ... \]` 可以插入行间公式
# 对行间公式编号：`equation环境`
```

```
\begin{equation}
...
\end{equation}
```

$$...$$

编号已经自动显示出来了，不过一般这个环境可以不使用，后面会介绍.

## 上下标`^` `_`

```
\[ x_1+x_2=-b/a. \]
\begin{equation}
E=mc^2.
\end{equation}
```

$$x_1+x_2=-b/a.$$
$$E=mc^2.$$

貌似这个equation环境是全局的...好吧，markdown已经帮我们实现了一切，我们只需要会用就行.

**它默认只作用于之后的一个字符，如果想对连续的几个字符起作用，请将这些字符用花括号 {} 括起来，例如：**

```
\[ z = r\cdot e^{2\pi i}. \]
```

$$ z = r\cdot e^{2\pi i}. $$

## 根式与分式

根式用 `\sqrt{·}` 来表示，分式用` \frac{·}{·}` 来表示（第一个参数为分子，第二个为分母）
```
$\sqrt{x}$, $\frac{1}{2}$.
\[ \sqrt{x}, \]
\[ \frac{1}{2}. \]
```
$\sqrt{x}$, $\frac{1}{2}$.
$$ \sqrt{x}, $$
$$\frac{1}{2}. $$

## 运算符

```
\[ \pm\; \times \; \div\; \cdot\; \cap\; \cup\;
\geq\; \leq\; \neq\; \approx \; \equiv \]
```

$$\pm, \times, \div, \cdot, \cap, \cup,\geq, \leq, \neq, \approx, \equiv $$

```
\[\sum, \quad, \prod, \lim, \int \]
```

$$\sum, \quad, \prod, \lim, \int $$

```
$ \sum_{i=1}^n i\quad\prod_{i=1}^n $  和  $ \sum\limits _{i=1}^n i\quad\prod\limits _{i=1}^n $
\[ \lim_{x\to0}x^2\int_a^b x^2 dx \]
\[ \lim\nolimits _{x\to0}x^2\int\nolimits_a^b x^2 dx \]
```

$ \sum_{i=1}^n i\quad\prod_{i=1}^n $  和  $ \sum\limits _{i=1}^n i\quad\prod\limits _{i=1}^n $
$$ \lim_{x\to0}x^2\int_a^b x^2 dx $$
$$ \lim\nolimits _{x\to0}x^2\int\nolimits_a^b x^2 dx $$

\[ \iint\quad\iiint\quad\iiiint\quad\idotsint \]

$$ \iint\quad\iiint\quad\iiiint\quad\idotsint $$

~~这里又发现markdown已经帮我们把空格加上去了.~~好吧，是我搞错了。。。

## 定界符括号等

```
(x)  \[ \Biggl(\biggl(\Bigl(\bigl((x)\bigr)\Bigr)\biggr)\Biggr) \]
[x] \[ \Biggl[\biggl[\Bigl[\bigl[[x]\bigr]\Bigr]\biggr]\Biggr] \]
{x} \[ \Biggl \{\biggl \{\Bigl \{\bigl \{\{x\}\bigr \}\Bigr \}\biggr \}\Biggr\} \]
<x\> \[ \Biggl\langle\biggl\langle\Bigl\langle\bigl\langle\langle x
    \rangle\bigr\rangle\Bigr\rangle\biggr\rangle\Biggr\rangle \]
[x] \[ \Biggl\lvert\biggl\lvert\Bigl\lvert\bigl\lvert\lvert x
\rvert\bigr\rvert\Bigr\rvert\biggr\rvert\Biggr\rvert \]
||x||\[ \Biggl\lVert\biggl\lVert\Bigl\lVert\bigl\lVert\lVert x
\rVert\bigr\rVert\Bigr\rVert\biggr\rVert\Biggr\rVert \]
```

(x)  $$\Biggl(\biggl(\Bigl(\bigl((x)\bigr)\Bigr)\biggr)\Biggr)$$
[x]  $$\Biggl[\biggl[\Bigl[\bigl[[x]\bigr]\Bigr]\biggr]\Biggr]$$
{x} $$\Biggl \{\biggl \{\Bigl \{\bigl \{\{x\}\bigr \}\Bigr \}\biggr \}\Biggr\}$$
\<x\> $$ \Biggl\langle\biggl\langle\Bigl\langle\bigl\langle\langle x \rangle\bigr\rangle\Bigr\rangle\biggr\rangle\Biggr\rangle $$
|x| $$\Biggl\lvert\biggl\lvert\Bigl\lvert\bigl\lvert\lvert x \rvert\bigr\rvert\Bigr\rvert\biggr\rvert\Biggr\rvert $$
||x||$$ \Biggl\lVert\biggl\lVert\Bigl\lVert\bigl\lVert\lVert x \rVert\bigr\rVert\Bigr\rVert\biggr\rVert\Biggr\rVert $$

## 省略号

```
\[ x_1,x_2,\dots ,x_n\quad1,2,\cdots ,n\quad\vdots\quad\ddots \]
```

$$x_1,x_2,\dots ,x_n\quad1,2,\cdots ,n\quad\vdots\quad\ddots $$

## 矩阵

```
\[ \begin{pmatrix} a&b\\c&d \end{pmatrix} \quad 
\begin{bmatrix} a&b\\c&d \end{bmatrix} \quad 
\begin{Bmatrix} a&b\\c&d \end{Bmatrix} \quad 
\begin{vmatrix} a&b\\c&d \end{vmatrix} \quad 
\begin{Vmatrix} a&b\\c&d \end{Vmatrix} \]
```

$$ \begin{pmatrix} a&b\\c&d \end{pmatrix} \quad $$
$$ \begin{bmatrix} a&b\\c&d \end{bmatrix} \quad $$
$$ \begin{Bmatrix} a&b\\c&d \end{Bmatrix} \quad $$
$$ \begin{vmatrix} a&b\\c&d \end{vmatrix} \quad $$
$$ \begin{Vmatrix} a&b\\c&d \end{Vmatrix} $$ 

使用 smallmatrix 环境，可以生成行内公式的小矩阵。

```
Marry has a little matrix $ ( \begin{smallmatrix} a&b\\c&d \end{smallmatrix} ) $.

Marry has a little matrix $ | \begin{smallmatrix} a&b\\c&d \end{smallmatrix} | $.
```

Marry has a little matrix $ ( \begin{smallmatrix} a&b\\c&d \end{smallmatrix} ) $.

Marry has a little matrix $ | \begin{smallmatrix} a&b\\c&d \end{smallmatrix} | $.

## 多行公式

有的公式特别长，我们需要手动为他们换行；有几个公式是一组，我们需要将他们放在一起；还有些类似分段函数，我们需要给它加上一个左边的花括号。

### 长公式

不对齐：
```
\begin{multline}
x = a+b+c+{} \\
d+e+f+g
\end{multline}
```

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725113753.png)

如果不需要编号，可以使用 multline* 环境代替。

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725113847.png)

对齐：
```
\[\begin{aligned}
x ={}& a+b+c+{} \\
&d+e+f+g
\end{aligned}\]
```

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725113943.png)

一行显示居中对齐：
```
\[\begin{aligned}
x =a+b+c+
d+e+f+g
\end{aligned}\]
```

一行显示居中对齐：
$$ x =a+b+c+d+e+f+g $$

### 公式组

无需对齐的公式组可以使用 gather 环境，需要对齐的公式组可以使用 align 环境。他们都带有编号，如果不需要编号可以使用带`*`的版本。

```
\begin{gather}
a = b+c+d \\
x = y+z
\end{gather}

\begin{align}
a &= b+c+d \\
x &= y+z
\end{align}
```

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725114326.png)

### 分段函数

分段函数可以用cases次环境来实现，它必须包含在数学环境之内。

```
\[ y= \begin{cases}
-x,\quad x\leq 0 \\
x,\quad x>0
\end{cases} \]
```

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725114427.png)

这里，LaTex和md的空格都不起作用了...

## 插入图片和表格

这里由于md本身已经支持了图片和和表格，所以关于LaTex本身的图片和表格就无须了解，要知道md支持LaTex数学公式，这个文档就是纯md写的.

看一下图片显示。。。
```
\begin{figure}[htbp]
\centering
\includegraphics{a.jpg}
\caption{有图有真相}
\label{fig:myphoto}
\end{figure}
```
“htbp” 选项用来指定插图的理想位置，这几个字母分别代表here, top, bottom, float page，也就是就这里、页顶、页尾、浮动页(专门放浮动体的单独页面) 。\centering 用来使插图居中；\caption 命令设置插图标题，LaTeX 会自动给浮动体的标题加上编号。注意 \label 应该放在标题命令之后。

![](https://raw.githubusercontent.com/ds19991999/githubimg/master/picgo/20180725114542.png)

## 一点背景

### TeX - LaTeX

TeX 是高德纳（Donald Ervin Knuth，1938年1月10日 –）教授愤世嫉俗（大雾；追求完美）做出来的排版引擎，同时也是该引擎使用的标记语言（Markup Lang）的名称。这里所谓的引擎，是指能够实现断行、分页等操作的程序（请注意这并不是定义）；这里的标记语言，是指一种将控制命令和文本结合起来的格式，它的主体是其中的文本而控制命令则实现一些特殊效果（同样请注意这并不是定义）。

而 LaTeX 则是 L. Lamport （1941年2月7日 – ） 教授开发的基于 TeX 的排版系统。实际上 LaTeX 利用 TeX 的控制命令，定义了许多新的控制命令并封装成一个可执行文件。这个可执行文件会去解释 LaTeX 新定义的命令成为 TeX 的控制命令，并最终交由 TeX 引擎进行排版。

所以：
* 最终进行断行、分页等操作的，是 TeX 引擎；
* LaTeX 实际上是一个工具，它将用户按照它的格式编写的文档解释成 TeX 引擎能理解的形式并交付给 TeX 引擎处理，再将最终结果返回给用户。

### pdfTeX - pdfLaTeX

 pdfTeX 直接输出 pdf 格式文档，而 TeX 引擎则输出 dvi 格式的文档。
 
 pdfLaTeX 这个程序的主要工作依旧是将 LaTeX 格式的文档进行解释，不过此次是将解释之后的结果交付给 pdfTeX 引擎处理。
 
 更多LaTex知识请看[LaTeX 入门文档](https://liam0205.me/2014/09/08/latex-introduction/)。

### 总结

TeX - pdfTeX - XeTeX - LuaTeX 都是排版引擎，按照先进程度递增（LuaTeX 尚未完善）。

LaTeX 是一种格式，基于 TeX 格式定义了很多更方便使用的控制命令。上述四个引擎都有对应的程序将 LaTeX 格式解释成引擎能处理的内容。

CTeX, MiKTeX, TeX Live 都是 TeX 的发行，他们是许许多多东西的集合。
