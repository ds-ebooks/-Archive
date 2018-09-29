
# 用jupyter编写数学公式

<h1>Contents<span class="tocSkip"></span></h1>
<div class="toc"><ul class="toc-item"><li><span><a href="#两种数学模式" data-toc-modified-id="两种数学模式-1"><span class="toc-item-num">1&nbsp;&nbsp;</span>两种数学模式</a></span></li><li><span><a href="#空格" data-toc-modified-id="空格-2"><span class="toc-item-num">2&nbsp;&nbsp;</span>空格</a></span></li><li><span><a href="#上标和下标" data-toc-modified-id="上标和下标-3"><span class="toc-item-num">3&nbsp;&nbsp;</span>上标和下标</a></span></li><li><span><a href="#命令" data-toc-modified-id="命令-4"><span class="toc-item-num">4&nbsp;&nbsp;</span>命令</a></span></li><li><span><a href="#符号" data-toc-modified-id="符号-5"><span class="toc-item-num">5&nbsp;&nbsp;</span>符号</a></span></li><li><span><a href="#头标" data-toc-modified-id="头标-6"><span class="toc-item-num">6&nbsp;&nbsp;</span>头标</a></span></li><li><span><a href="#括号" data-toc-modified-id="括号-7"><span class="toc-item-num">7&nbsp;&nbsp;</span>括号</a></span></li><li><span><a href="#字体及其选项" data-toc-modified-id="字体及其选项-8"><span class="toc-item-num">8&nbsp;&nbsp;</span>字体及其选项</a></span></li><li><span><a href="#转义字符'\'" data-toc-modified-id="转义字符'\'-9"><span class="toc-item-num">9&nbsp;&nbsp;</span>转义字符'\'</a></span></li><li><span><a href="#等式对齐" data-toc-modified-id="等式对齐-10"><span class="toc-item-num">10&nbsp;&nbsp;</span>等式对齐</a></span></li><li><span><a href="#分段函数" data-toc-modified-id="分段函数-11"><span class="toc-item-num">11&nbsp;&nbsp;</span>分段函数</a></span></li><li><span><a href="#一点总结" data-toc-modified-id="一点总结-12"><span class="toc-item-num">12&nbsp;&nbsp;</span>一点总结</a></span></li><li><span><a href="#附录1：数学符号表" data-toc-modified-id="附录1：数学符号表-13"><span class="toc-item-num">13&nbsp;&nbsp;</span>附录1：数学符号表</a></span></li><li><span><a href="#附录2：参考书籍" data-toc-modified-id="附录2：参考书籍-14"><span class="toc-item-num">14&nbsp;&nbsp;</span>附录2：参考书籍</a></span></li></ul></div>

## 两种数学模式

直接切入正题，毕竟我是在用Jupyter，不是LaTex。。。

```
$P(A \mid B) = \frac{ P(B \mid A) P(A) }{ P(B) }$
```

 $P(A \mid B) = \frac{ P(B \mid A) P(A) }{ P(B) }$

 ```
 贝叶斯公式：$$P(A \mid B) = \frac{ P(B \mid A) P(A) }{ P(B) }$$
 ```

 贝叶斯公式：$$P(A \mid B) = \frac{ P(B \mid A) P(A) }{ P(B) }$$

## 空格

```
$$a\quad\a$$
```

$$a\quad\a$$

注意这个空格很奇葩，后面非要紧跟字符，否则没有效果，~~另外，上一篇文章md是自动加空格的，写错了。~~

在LaTeX中，符号之间的空格会被自动移除，通过 `\`, 或 `\:`或 `\;`添加空格，其空格宽度分别为从小到大。

`$$\intf(x) \; dx$$`

$$\int f(x) \; dx$$

## 上标和下标

`$$x^2$$ `

$$x^2$$ 

`$$e^2x$$ `

$$e^2x$$ 

`$$e^{2x}$$`

$$e^{2x}$$
`$$x_i$$`
 $$x_i$$
` $$_{10}C_5$$`
 $$_{10}C_5$$
`$$\underset{k}{argmax}$$ `
$$\underset{k}{argmax}$$ 

## 命令

特定的符号和形式通过命令进行编写，每一个命令以反斜杠开始，一个命令名紧随其后。比如说，创建一个平方根的表达式 `$ \sqrt{2\pi} $$` 显示为


$$ \sqrt{2\pi} $$
`$$\frac{a}{b}$$`
$$\frac{a}{b}$$

## 符号
`$$\alpha, \beta, \gamma$$`
$$\alpha, \beta, \gamma$$
`$$\Phi, \Lambda, \Gamma$$`
$$\Phi, \Lambda, \Gamma$$
`$$\times, \pm, \cup, \oplus$$`
$$\times, \pm, \cup, \oplus$$
`$$\sin, \cosh, \arctan$$`
$$\sin, \cosh, \arctan$$
`$$\leq, \geq, \approx, \neq$$`
$$\leq, \geq, \approx, \neq$$
`$$\cdots, \ldots, \ddots$$`
$$\cdots, \ldots, \ddots$$
`$$\infty, \nabla, \partial $$`
$$\infty, \nabla, \partial $$

## 头标
`$$\hat x$$`
$$\hat x$$
 `$$\widehat{abs}$$ `
 $$\widehat{abs}$$ 
`$$\bar x $$`
$$\bar x $$
`$$\overline{abs}$$`
$$\overline{abs}$$
`$$\dot x\quad\ddot x $$`
$$\dot x\quad\ddot x $$
 `$$\vec{x}, \overrightarrow{AB}$$`
 $$\vec{x}, \overrightarrow{AB}$$

## 括号
`$$z=(\frac{dx}{dy})^{1/3}$$`
$$z=(\frac{dx}{dy})^{1/3}$$
`$$z=\left(\frac{dx}{dy}\right)^{1/3}$$ `
$$z=\left(\frac{dx}{dy}\right)^{1/3}$$ 
`$$ {\langle} {\phi} \mid {\psi} {\rangle} $$ `
$$ {\langle} {\phi} \mid {\psi} {\rangle} $$ 
`$$ {\langle} {\phi} \vert {\psi} {\rangle} $$ `
$$ {\langle} {\phi} \vert {\psi} {\rangle} $$ 
`$$\left[\begin{matrix}a & b \cr c & d\end{matrix}\right]$$`
$$\left[\begin{matrix}a & b \cr c & d\end{matrix}\right]$$
`$$\left\lgroup\begin{matrix}a & b \cr c & d\end{matrix}\right\rgroup$$`
$$\left\lgroup\begin{matrix}a & b \cr c & d\end{matrix}\right\rgroup$$

## 字体及其选项


```python
# 非斜体罗马文本
# 使用 \textrm{abcdefghijklmn123456}
# 或者 \rm{abcdefghijklmn123456}
```

$$\textrm{abcdefghijklmn123456}$$


```python
# 斜体字母 \mathit{abcdefghijklmn123456} 
```

$$\mathit{abcdefghijklmn123456}$$


```python
# Boldsymbol 字体加粗 \boldsymbol{A\cdot x}=\lambda\cdot v
```

$$\boldsymbol{A\cdot x}=\lambda\cdot v$$

## 转义字符'\'

## 等式对齐
通过 \\ 断开两个或多个等式，可实现等式中部对齐，例如：
```
$$
a_1=b_1+c_1 \\
a_2=b_2+c_2+d_2 \\
a_3=b_3+c_3
$$
```
$$
a_1=b_1+c_1 \\
a_2=b_2+c_2+d_2 \\
a_3=b_3+c_3
$$
左对齐：
```
$$\begin{aligned}
a_1&=b_1+c_1 \\
a_2&=b_2+c_2+d_2 \\
a_3&=b_3+c_3
\end{aligned}$$
```
$$\begin{aligned}
a_1&=b_1+c_1 \\
a_2&=b_2+c_2+d_2 \\
a_3&=b_3+c_3
\end{aligned}$$

## 分段函数

```
$$
sign(x)=
\begin{cases}
1,&x>0 \\ 
0,&x=0 \\
-1,&x<0
\end{cases}
$$
```
$$
sign(x)=
\begin{cases}
1,&x>0 \\ 
0,&x=0 \\
-1,&x<0
\end{cases}
$$

`\\ 等价于 \cr，表示换行到新的 case。`

## 一点总结
`$$\sqrt[3]{a}$$`
$$\sqrt[3]{a}$$
`$$\overline{m+n}$$`
$$\overline{m+n}$$
`$$\underline {m+n}$$`
$$\underline {m+n}$$

不知道为啥这个下划线需要加空格，否则报错。。。关于md和LaTex对于空格方面都是忽略，不同的是md会保留一个空格。

所以以后书写数学公式关键命令及语法前面还是要加空格，正如md标准语法中，每一种格式的结束都需要空一行，表示此语法格式结束，虽然有些md编辑器会容下这些细小的错误，但为保证统一，我们还是使用标准格式比较好。
`$$\underbrace{a+b+\cdots+j}_{10}$$`
$$\underbrace{a+b+\cdots+j}_{10}$$
`$$\overbrace{a+b+\cdots+j}^{10}$$`
$$\overbrace{a+b+\cdots+j}^{10}$$
`$$\vec{AB}$$`
$$\vec{AB}$$
`$$\overrightarrow{AB}$$`
$$\overrightarrow{AB}$$
`$$\overleftarrow {AB}$$`
$$\overleftarrow {AB}$$
`$$\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$`
$$\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$
`$$\int_{0}^{\pi}{\tan x}$$`
$$\int_{0}^{\pi}{\tan x}$$
` $$\sum_{i=0}^{n}{i}$$`
 $$\sum_{i=0}^{n}{i}$$
`$$\prod_{i=1}^{9}{i}$$`
$$\prod_{i=1}^{9}{i}$$

## 附录1：数学符号表

> 要经常查看

![image](https://upload-images.jianshu.io/upload_images/5798456-33a39b68d3d2825d.png)

## 附录2：参考书籍

* 不错的参考资料：[LaTeX_Docs](LaTeX_Docs/)
* 了解LaTex的博客：[LaTeX 入门文档](https://liam0205.me/2014/09/08/latex-introduction/)
