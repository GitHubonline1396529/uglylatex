\ProvidesClass{uglypaper}[
2025/03/09 Custom Article Class]
\NeedsTeXFormat{LaTeX2e}

% 流程控制宏包
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\RequireXeTeX
\ifxetex\else
\ClassError{uglypaper}{
You must use the `xelatex' driver\MessageBreak }{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% 文档类参数处理
% % 自定义文档类选项
% \SetupKeyvalOptions{family=UGLY, prefix=UGLY@, setkeys=\kvsetkeys}
% % \newcommand{\ekv}[1]{\kvsetkeys{UGLY}{#1}}

% \DeclareStringOption[cn]{lang}
% \DeclareVoidOption{cn}{\kvsetkeys{UGLY}{lang=cn}}
% \DeclareVoidOption{en}{\kvsetkeys{UGLY}{lang=en}}

\SetupKeyvalOptions{family=UGLY, prefix=UGLY@, setkeys=\kvsetkeys}
% \newcommand{\ekv}[1]{\kvsetkeys{UGLY}{#1}}

% \DeclareStringOption[blue]{color}
% \DeclareVoidOption{green}{\kvsetkeys{UGLY}{color=green}}
% \DeclareVoidOption{cyan}{\kvsetkeys{UGLY}{color=cyan}}
% \DeclareVoidOption{blue}{\kvsetkeys{UGLY}{color=blue}}
% \DeclareVoidOption{sakura}{\kvsetkeys{UGLY}{color=sakura}}
% \DeclareVoidOption{black}{\kvsetkeys{UGLY}{color=black}}
% \DeclareVoidOption{brown}{\kvsetkeys{UGLY}{color=brown}}

\DeclareStringOption[cn]{lang}
\DeclareVoidOption{cn}{\kvsetkeys{UGLY}{lang=cn}}
\DeclareVoidOption{en}{\kvsetkeys{UGLY}{lang=en}}

\DeclareStringOption[normal]{device}
\DeclareVoidOption{pc}{\kvsetkeys{UGLY}{device=pc}}
\DeclareVoidOption{pad}{\kvsetkeys{UGLY}{device=pad}}
\DeclareVoidOption{kindle}{\kvsetkeys{UGLY}{device=kindle}}
\DeclareVoidOption{normal}{\kvsetkeys{UGLY}{device=normal}}
\DeclareVoidOption{screen}{\kvsetkeys{UGLY}{device=screen}}
\DeclareVoidOption{booklet}{\kvsetkeys{UGLY}{device=booklet}}
\DeclareVoidOption{textbook}{\kvsetkeys{UGLY}{device=textbook}}

% \DeclareStringOption{mode}
% \DeclareVoidOption{geye}{\kvsetkeys{UGLY}{mode=geye}}
% \DeclareVoidOption{hazy}{\kvsetkeys{UGLY}{mode=hazy}}
% \DeclareVoidOption{sepia}{\kvsetkeys{UGLY}{mode=sepia}}

% \DeclareStringOption[ctexfont]{chinesefont}
% \DeclareVoidOption{ctexfont}{\kvsetkeys{UGLY}{chinesefont=ctexfont}}
% \DeclareVoidOption{founder}{\kvsetkeys{UGLY}{chinesefont=founder}}
% \DeclareVoidOption{nofont}{\kvsetkeys{UGLY}{chinesefont=nofont}}

% \DeclareStringOption[numeric-comp]{citestyle}
% \DeclareStringOption[numeric]{bibstyle}

% \DeclareStringOption[biber]{bibend}
% \DeclareVoidOption{biber}{\kvsetkeys{UGLY}{bibend=biber}}
% \DeclareVoidOption{bibtex}{\kvsetkeys{UGLY}{bibend=bibtex}}

% \DeclareStringOption[11pt]{fontsize}
% \DeclareVoidOption{10pt}{\kvsetkeys{UGLY}{fontsize=10pt}}
% \DeclareVoidOption{11pt}{\kvsetkeys{UGLY}{fontsize=11pt}}
% \DeclareVoidOption{12pt}{\kvsetkeys{UGLY}{fontsize=12pt}}

% \DeclareStringOption[cm]{math}
% \DeclareVoidOption{newtx}{\kvsetkeys{UGLY}{math=newtx}}
% \DeclareVoidOption{mtpro2}{\kvsetkeys{UGLY}{math=mtpro2}}
% \DeclareVoidOption{cm}{\kvsetkeys{UGLY}{math=cm}}

% 传递文档类选项
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax

\LoadClass{article}

% 自定义的宏包
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{doclanguage}
\RequirePackage{docpapersize}
\RequirePackage{commands}

% 调整标题下移距离，减少顶部空白
% 由于原本使用的文章类型是 article 而不是 ctexart
% 需要设置这个：
%
% \setlength{\droptitle}{-5cm}
%
% 但现在则需要看实际情况来考虑，应该是暂时不用了

% 定义中文序号
\renewcommand\thesection
{\arabic{section}}
\renewcommand\thesubsection
{\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection
{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

% 标题格式设置
\titleformat{\section}
{\bfseries\fontsize{12pt}{14pt}\selectfont}
{\chinese{section}、}{0em}{}
\titleformat{\subsection}
{\bfseries\fontsize{12pt}{14pt}\selectfont}
{\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\bfseries\fontsize{10.5pt}{12pt}\selectfont}
{\thesubsubsection}{1em}{}

% 标题间距设置
\titlespacing{\section}{0pt}{20pt}{10pt}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
% \titlespacing{\subsection}{0pt}{0pt}{0pt}
% \titlespacing{\subsubsection}{0pt}{0pt}{0pt}

% 摘要格式设置
\RequirePackage{customized_abstract/runin_abstract}

% 调整摘要位置的间距
% \setlength{\absleftindent}{1.18cm} % 控制摘要左缩进
% \setlength{\absrightindent}{1.18cm} % 控制摘要右缩进

% 设置目录标题样式
%
% 拓宽 section 标题序号后面的间距
\addtolength{\cftsecnumwidth}{1em}
%
% 目录标题：三号宋体，加粗，居中，段前20磅，段后10磅，无缩进，
% “目”和“录”之间空4格；
% \renewcommand{\contentsname}{\centering 目\ \ \ \ 录}
\renewcommand{\cfttoctitlefont}{\hfill\normalsize} % ToC = Table of Contents
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\normalsize} % LoF = List of Figures
\renewcommand{\cftafterloftitle}{}
\renewcommand{\cftlottitlefont}{\normalsize} % LoT = List of Tables
\renewcommand{\cftafterlottitle}{}

% 设置页眉和页脚
\pagestyle{fancy}
% \fancyhead{} % 仅清空页眉
% \renewcommand{\headrulewidth}{0pt} % 去掉页眉的横线

% 设置图表标题样式
\captionsetup{
  font={small,bf,stretch=1.25},
  labelsep=space,
  justification=centering,
  singlelinecheck=false
}

\subcaptionsetup{
  labelfont=bf, textfont=bf,
  font={small,bf,stretch=1.25}, % 字体大小、加粗、行距
  labelsep=space, % 标签和标题之间的间隔
  labelformat=simple,
  singlelinecheck=off % 关闭单行检测
}

% 设置子图标题
\renewcommand\thesubfigure{(\alph{subfigure})}

% 定义新的命令

% 额外定义的功能性命令

% 精确调整 aritcle title 的位置
\makeatletter
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \vspace*{\droptitle}
  \maketitlehooka
  {\@bspretitle \@title \@bsposttitle}
  \maketitlehookb
  {\@bspreauthor \@author \@bspostauthor}
  \maketitlehookc
  {\@bspredate \@date \@bspostdate}
  \maketitlehookd
  \par
\vskip 1.5em}

\renewcommand{\maketitle}{\par
  \begingroup
  \@bsmarkseries
  \def\@makefnmark{\rlap{\@textsuperscript{%
  \normalfont\@bsthanksheadpre \tamark \@bsthanksheadpost}}}%
  \long\def\@makefntext##1{\makethanksmark ##1}
  \if@twocolumn
  \ifnum \col@number=\@ne
  \@maketitle
  \else
  \twocolumn[\@maketitle]%
  \fi
  \else
  \newpage
  \global\@topnum\z@
  \@maketitle
  \fi
  \thispagestyle{plain}\@thanks
  \endgroup
  \@bscontmark % \setcounter{footnote}{0}%
  %%%     \@bsmtitlempty
} % end non-titlepage

\makeatother
