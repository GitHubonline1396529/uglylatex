%
% This is file `uglyrep.cls',
% created for UglyLaTeX.
%
% Copyright (C) 2025 Githubonline1396529
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License (LPPL),
% either version 1.3c of this license or (at your option)
% any later version. The latest version of this license is in:
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of
% LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status "maintained".
%
\ProvidesClass{uglyrep}[
  2025/03/14 Customized document class based on `report'
]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Process Control Packages.
% 
% Note these packages must be imported before the Complier constraint.
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complier constraint, forcing user to use XeLaTeX and give necessary error 
% message.
\RequireXeTeX
\ifxetex\else
\ClassError{uglyrep}{
You must use the `xelatex' driver\MessageBreak }{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options processing.
% Note this part of TeX must be `input' not `imported', which means, must use
% `\input' not `\usepackage' or `\RequirePackage'.
\input{classoptions}

% Pass document class options to the `article' class, and load the class.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*\relax

% Load the class.
\LoadClass{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import customized packages
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
% \RequirePackage{docappendix}
\RequirePackage{commands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title format settings.

\RequirePackage{customized_headers/repheaders}

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

\renewcommand{\cftchapfont}{\normalsize\bfseries} % 章节标题字体
\renewcommand{\cftsecfont}{\normalsize} % 小节标题字体
\renewcommand{\cftsubsecfont}{\normalsize} % 子小节标题字体

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

% 附录格式设置
\renewcommand{\appendix}{%
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \titleformat{\chapter}[hang]
  {\centering\bfseries\large\color{ecolor}}
  {\Alph{chapter}. }
  {0em}
  {}
  \renewcommand{\thesection}{\thechapter.\arabic{section}}%
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
