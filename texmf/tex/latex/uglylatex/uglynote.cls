%%
%% This is file `uglynote.cls',
%% created for UglyLaTeX.
%%
%% Copyright (C) 2025 Githubonline1396529
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL),
%% either version 1.3c of this license or (at your option)
%% any later version. The latest version of this license is in:
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%%
\ProvidesClass{uglynote}[
2025/03/09 Custom Article Class]
\NeedsTeXFormat{LaTeX2e}

% -----------------------------------------------------------------------------
% Process Control Packages
% 
% Note that these packages must be imported before the Complier constraint.
\RequirePackage{ifxetex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

% Complier constraint
\RequireXeTeX
\ifxetex\else
\ClassError{uglynote}{
  You must use the `xelatex' driver\MessageBreak }{%
    Just choose `xelatex', no `pdflatex' or `latex' and so on.
  }
\fi

% Class options processing
\input{classoptions}

% 传递文档类选项
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article}
 }
\ProcessKeyvalOptions*\relax

\LoadClass{article}

% 自定义的宏包
\RequirePackage{dependencies}
\RequirePackage{docfmt}
\RequirePackage{docpapersize}
\RequirePackage{doccolor}
\RequirePackage{doccaptions}
\RequirePackage{doclanguage}
% \RequirePackage{docappendix}
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
{\centering\bfseries\large\color{ecolor}}
{\chinese{section}、}{0em}{}
\titleformat{\subsection}
{\bfseries\normalsize\color{ecolor}}
{\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\bfseries\small\color{ecolor}}
{\thesubsubsection}{1em}{}

% 标题间距设置
\titlespacing{\section}{0pt}{20pt}{10pt}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
% \titlespacing{\subsection}{0pt}{0pt}{0pt}
% \titlespacing{\subsubsection}{0pt}{0pt}{0pt}

% 摘要格式设置
\RequirePackage{customized_abstract/abstract_block}

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

% 定义新的命令

% 额外定义的功能性命令
\RequirePackage{commands}

% 精确调整 aritcle title 的位置
\makeatletter
\def\@maketitle{%
  \color{ecolor}
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
