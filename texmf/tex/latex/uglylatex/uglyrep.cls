\ProvidesClass{uglyrep}[
2024/07/17 Custom Article Class]
\NeedsTeXFormat{LaTeX2e}

% 流程控制宏包
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

% 编译器约束
\RequireXeTeX
\ifxetex\else
\ClassError{uglyrep}{
You must use the `xelatex' driver\MessageBreak }{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% 文档类参数处理
\input{classoptions}

% 传递文档类选项
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*\relax

\LoadClass{report}

% 自定义的宏包
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
% \RequirePackage{docappendix}
\RequirePackage{commands}

% 定义中文序号
\renewcommand\thechapter{
\arabic{chapter}}
\renewcommand\thesection{
\arabic{chapter}.\arabic{section}}
\renewcommand\thesubsection{
\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection{
  \arabic{chapter}.\arabic{section}.%
  \arabic{subsection}.\arabic{subsubsection}
}

% 标题格式设置
\makeatletter
\patchcmd{\@makechapterhead}{\vspace*{50\p@}}{\vspace*{25\p@}}{}{}
\patchcmd{\@makeschapterhead}{\vspace*{50\p@}}{\vspace*{25\p@}}{}{}
\makeatother

\titleformat{\chapter}[hang]
{\centering\bfseries\large\color{ecolor}}
{\chinese{chapter}、}
{0em}
{}
\titleformat{\section}
{\bfseries\normalsize\color{ecolor}}
{\thesection}
{1em}
{}
\titleformat{\subsection}
{\bfseries\normalsize\color{ecolor}}
{\thesubsection}
{1em}
{}
\titleformat{\subsubsection}[runin]
% 加上 [runin] 参数将 subsubsection 调整为常见的款项样式
{\bfseries\small\color{ecolor}} %
{\thesubsubsection}
{1em}
{}
[\hspace*{1em}] % 在标题后插入 1em 的间距

% 标题间距设置
\titlespacing{\chapter}{0pt}{20pt}{10pt}
\titlespacing{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0\baselineskip}{0\baselineskip}[1em]

% 摘要格式设置
\RequirePackage{customized_abstract/abstract_page}

% 调整摘要位置的间距
% \setlength{\absleftindent}{1.18cm} % 控制摘要左缩进
% \setlength{\absrightindent}{1.18cm} % 控制摘要右缩进
% \setlength{\abstitleskip}{-1em} % 控制摘要标题与摘要正文的间距
% \setlength{\absparindent}{2em} % 控制摘要段落的缩进
% \setlength{\absbottomskip}{1em} % 控制摘要与正文的间距

% 设置目录标题样式
%
% LaTeX 会默认把目录的标题当作一级 Chapter 或者 Section，加入到页眉当中。
% 如果目录结束之后的正文部分不是紧跟着第一级 Chapter 或者 Section，而是，
% 比方说，有一段普通文本，那么，这段内容就会全部被强行冠以“目录”或者
% “CONTENT”字样的页眉。

% 为了解决这个问题，我试了大半年，前面试了很多的方法，都没有解决。想了很
% 长时间，这一行代码就是最终的解决方案。

% 简单来说原理就是通过 LaTeX 的流程控制宏包 etoolbox 在每次 (其实就一次)
% \tableofcontent 命令执行完毕之后，都清空一次页眉。目前我还没有想到更好
% 的方法，也不确定这个方法是不是还有其他没有预料到的问题，先这样用着吧。
\apptocmd\tableofcontents{\clearpage\markboth{}{}}

% 目录后必须换页
% \apptocmd{\tableofcontents}{\clearpage}{}{}

% \makeatother
%
% 目录标题：三号宋体，加粗，居中，段前20磅，段后10磅，无缩进，
% “目”和“录”之间空4格；
% \renewcommand{\contentsname}{}
% \renewcommand{\cfttoctitlefont}{\normalsize} % ToC = Table of Contents
% \renewcommand{\cftaftertoctitle}{}
% \renewcommand{\cftloftitlefont}{\normalsize} % LoF = List of Figures
% \renewcommand{\cftafterloftitle}{}
% \renewcommand{\cftlottitlefont}{\normalsize} % LoT = List of Tables
% \renewcommand{\cftafterlottitle}{}

% 隐藏子小节
% 设置目录深度显示三级
\setcounter{tocdepth}{3} % 只显示到三级深度

% 拓宽 chapter 标题序号后面的间距
\addtolength{\cftchapnumwidth}{1em}

\renewcommand{\cftchapfont}{\fontsize{12pt}{14pt}\bfseries} % 章节标题字体
\renewcommand{\cftsecfont}{\fontsize{12pt}{14pt}} % 小节标题字体
\renewcommand{\cftsubsecfont}{\fontsize{12pt}{14pt}} % 子小节标题字体

% 设置目录项格式
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % 章节之间的点线
\renewcommand{\cftsecpagefont}{\hfill\textperiodcentered} % 小节页码格式
\renewcommand{\cftsubsecpagefont}{\hfill\textperiodcentered} % 子小节页码格式

% 设置目录项缩进和间距
% \setlength{\cftbeforechapskip}{0pt} % 章节前的段距
% \setlength{\cftbeforesecskip}{0pt} % 小节前的段距
% \setlength{\cftbeforesubsecskip}{0pt} % 子小节前的段距

\setlength{\cftchapindent}{0em} % 章节标题缩进
\setlength{\cftsecindent}{2em} % 小节标题缩进
\setlength{\cftsubsecindent}{4em} % 子小节标题缩进
\setlength{\cftsubsubsecindent}{6em} % 子小节标题缩进

% 设置页眉和页脚
% 页眉设置
\pagestyle{fancy}
% \fancyhead{}
% \fancyhead[LE,RO]{\thepage} % 页码
% \fancyhead[LO]{\nouppercase{\rightmark}} % 左页章节标题
% \fancyhead[RE]{\nouppercase{\leftmark}} % 右页章节标题
\renewcommand{\chaptermark}[1]{
  \markboth{\thechapter#1}{}
}

% 设置图表标题样式

% 图表按章节编号
\numberwithin{table}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
% \numberwithin{lstlisting}{section}  % 设置 listings 环境按章节编号
% \newcounter{lstlisting}[section]
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
% \renewcommand{\thelstlisting}{\arabic{section}.\arabic{lstlisting}}

% 强制令 report 文档类里的 chapter 不换页
\makeatletter
\renewcommand
\chapter{
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}
\makeatother
